#!/usr/bin/env bash
[ -e ../miner.conf ] && . ../miner.conf
TMPDIR="/tmp/miner-$$"
REPO_URL='https://github.com/res09ggm/miner-conf.git'
SETUP_SCRIPT='setup.sh'
INSTALL_DIR='/opt/miner'

echo "Init start"

#Create temp dir and clone project
echo "Creating tmp directory: ${TMPDIR}"
mkdir ${TMPDIR}
git clone ${REPO_URL} ${TMPDIR}
echo "Getting setup script from repo, and running it"

if [ -x ${INSTALL_DIR} ]
then
    echo "${INSTALL_DIR} already exists. Overwrite? [y/n]"
    read answer
    if echo $answer | grep -iq "^y" ;then
        echo "Overwriting existing directory ${INSTALL_DIR}"
        mv /opt/miner /tmp/deleted-$$
    else
        echo -n "Removing tmp directory... "
        rm -rf ${TMPDIR}
        echo " ... done"
        exit 1
    fi    
fi
    
mv ${TMPDIR} ${INSTALL_DIR}/ #copy setup script up to current dir

# Symlink our scripts to /usr/local/bin
cd /usr/local/bin/
for file in ${INSTALL_DIR}/scripts/*; do
  name=`basename ${file}`
  if [ `readink -e ${name}` != ${file} ]; then
      rm ${name}
      ln -s ${file}
  else echo "Skipping file $name since symlink already exists"
  fi

done

exec ${INSTALL_DIR}/scripts/$SETUP_SCRIPT
