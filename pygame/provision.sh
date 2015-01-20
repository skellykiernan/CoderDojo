#!/bin/bash
##############################################################################
# Configurable used in the provisioning
##############################################################################
# Versions and info for Packages and Tools
PYCHARM_VERSION='4.0.4'
PYCHARM_DOWNLOAD_URL='http://download-cf.jetbrains.com/python'
PYCHARM_PKG_NAME=pycharm-community-${PYCHARM_VERSION}

##############################################################################
# Install Ubuntu packages
##############################################################################
# needed for FFMEG a pygame dependency
sudo add-apt-repository ppa:jon-severinsson/ffmpeg

apt-get -y update
# install lightweight desktop only if xorg package not installed
# using xorg to indicate the presence of desktop
dpkg -s xorg &> /dev/null || {
    apt-get -y install --no-install-recommends ubuntu-desktop
}

# used to check if a package for ubuntu already installed before installing 
function check_install_pkg {
    dpkg -s $1 &> /dev/null || {
        echo "---- Installing $1"
        apt-get -y install $1
    }
}

# prefered terminal
check_install_pkg gnome-terminal

# packages required to compile pygame 
# see http://www.pygame.org/wiki/CompileUbuntu
declare -a pygame_dep_pkgs=("mercurial"           'python3-dev' 
                            'python3-numpy'       'ffmpeg'
                            'libsdl-image1.2-dev' 'libsdl-mixer1.2-dev'
                            'libsdl-ttf2.0-dev'   'libsmpeg-dev' 
                            'libsdl1.2-dev'       'libportmidi-dev'
                            'libswscale-dev'      'libavformat-dev'
                            'libavcodec-dev')

## now loop through the above array
for pkg in "${pygame_dep_pkgs[@]}"
do
   check_install_pkg $pkg
done

# virtualbox guest installations(mainly to improve the screen resolution)
declare -a virtualbox_pkgs=('virtualbox-guest-dkms' 'virtualbox-guest-utils'
                            'virtualbox-guest-x11')

for pkg in "${virtualbox_pkgs[@]}"
do
   check_install_pkg $pkg
done

# download and compile pygame
if [[ -d tools/pygame ]]; then
    echo '++++ Have already download pygame'
else
    echo '---- Downloading, build and install pygame'
    mkdir tools
    cd tools
    # Grab source
    hg clone https://bitbucket.org/pygame/pygame
     
    # Finally build and install
    cd pygame
    python3 setup.py build
    python3 setup.py install
    cd ../..
fi    

##############################################################################
# install development tools
##############################################################################
#
# add python idle 
check_install_pkg idle3

# java needed for pycharm
check_install_pkg openjdk-7-jre

# download and unpack PyCharm
# NOTE: will still need to run the pycharm.sh script in unpacked pycharm bin
# directory, think that need to use sudo when starting 
if [[ -d tools/pycharm ]]; then
    echo '++++ Have already downloaded PyCharm'
else
    echo "---- Download and unpack ${PYCHARM_PKG_NAME}"
    mkdir -p tools/pycharm
    cd tools/pycharm
    # downloads the tar.gz linux install file
    wget ${PYCHARM_DOWNLOAD_URL}/${PYCHARM_PKG_NAME}.tar.gz
    #wget http://download-cf.jetbrains.com/python/pycharm-community-4.0.4.tar.gz
    tar xzvf ${PYCHARM_PKG_NAME}.tar.gz
    rm ${PYCHARM_PKG_NAME}.tar.gz
    cd ..
fi

