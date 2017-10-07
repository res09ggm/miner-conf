[ -e ../miner.conf ] && . ../miner.conf
TMPDIR="/tmp/miner-$$"
REPO_URL='https://github.com/res09ggm/miner-conf.git'
SETUP_SCRIPT='setup.sh'
INSTALL_DIR='/opt/miner'

echo "Init start"

#Create temp dir and clone docker scripts project
echo "Creating tmp directory: ${TMPDIR}"
mkdir ${TMPDIR}
git clone ${REPO_URL} ${TMPDIR}
echo "Getting setup script from repo, and running it"

if [ -x ${INSTALL_DIR} ]
then
    echo "${INSTALL_DIR} already exists. Overwrite? [y/n]"
    read answer
    if echo $answer | grep -iq "^y" ;then
        mv ${TMPDIR} ${INSTALL_DIR} #copy setup script up to current dir
    else
        echo "Cancelling"
        exit 1
    fi    
fi
    
exec ${INSTALL_DIR}/scripts/$SETUP_SCRIPT
