#!/bin/bash

install_etcher() {
echo_info " *********** Installing Etcher: Live USB creator ******** "
#echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list
#sudo apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 379CE192D401AB61
sudo apt update
sudo apt install -y balena-etcher-electron -y
}

install_youtubedl() {
echo_info " ******* Installing Youtube-DL: internet video downloader ********** "
sudo apt install -y curl
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
}

install_nixnote() {
echo_info " *********** Installing Nixnote2 (Linux interface for Evernote) ******** "
sudo DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:nixnote/nixnote2-stable
sudo apt update
sudo apt -y install nixnote2
}

install_inxi() {
echo_info " ***********installing Inxi (System/Hardware Identifier) ******** "
sudo apt install -y wget
wget -O inxi https://github.com/smxi/inxi/raw/master/inxi
chmod +x inxi 
sudo mv inxi /usr/local/bin/inxi
sudo chown root:root /usr/local/bin/inxi
}


install_protonvpn() {
echo_info " ****** Installing the new ProtonVPN-CLI : ProtonVPN-CLI-NG ******* "
sudo apt install -y python3-pip
sudo pip3 install protonvpn-cli
sleep 2
echo_note "To upgrade in the future, run: sudo pip3 install protonvpn-cli --upgrade"
echo_note "I'll save that for you in a note in your home folder"
sleep 2
echo "sudo pip3 install protonvpn-cli --upgrade" > $HOME/command-to-upgrade-proton.txt
echo_info "You can initialize and login while this script is running by opening a separate terminal and running: sudo protonvpn init"
sleep 3
}

 
install_signal() {
echo_info " *** installing signal messenger for desktop *** "
sudo apt install -y curl
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
sudo apt install signal-desktop -y
}

install_spotify() {
echo_info " *** installing spotify *** "
sudo apt install -y curl
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install spotify-client -y
}

install_caprine() {
echo_info " *** Installing Caprine:FB messenger for Linux *** "
sudo apt install -y curl
cd $HOME/Downloads
curl -s https://api.github.com/repos/sindresorhus/caprine/releases/latest | grep "browser_download_url.*deb" | cut -d : -f 2,3 | tr -d \" | tail -1 | wget -O caprine.deb -qi -
sudo gdebi -n caprine.deb
}

install_teamviewer() {
    echo_info " *** installing Teamviewer for Linux *** "
    sudo apt install -y wget
    cd $HOME/Downloads
    wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
    sudo gdebi -n teamviewer_amd64.deb
}


install_tor() {
echo_info "Installing Tor"
echo "deb [arch=amd64] https://deb.torproject.org/torproject.org $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/onions.list
sudo bash -c 'curl https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --import'
sudo bash -c 'gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -'
sudo apt update
sudo apt install -y tor deb.torproject.org-keyring torsocks
}

install_micahs() {
echo_info " *** Installing Micah F Lee's repository from github.com/micahflee; includes Onionshare and Torbrowser-launcher"
sudo DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:micahflee/ppa
sudo apt update
sudo apt install -y onionshare torbrowser-launcher
}

install_chrome() {
echo_info " *** Installing Google Chrome *** "
cd $HOME/Downloads ;
rm rf google-chrome*.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo gdebi -n google-chrome-stable*.deb
}

install_slack() {
echo_info " *** installing slack *** "
cd $HOME/Downloads ;
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.2.0-amd64.deb
sudo gdebi -n slack-desktop-4.10.3-amd64.deb
}


install_vbox() {
echo_info " *** installing virtualbox *** "
cd $HOME/Downloads ;
wget https://download.virtualbox.org/virtualbox/6.1.16/virtualbox-6.1_6.1.16-140961~Ubuntu~eoan_amd64.deb
wget https://download.virtualbox.org/virtualbox/6.1.16/Oracle_VM_VirtualBox_Extension_Pack-6.1.16.vbox-extpack
sudo gdebi -n virtualbox-6.1_6.1.16-140961~Ubuntu~eoan_amd64.deb
}

install_vivaldi() {
echo_info " *** Installing Vivaldi Browser *** "
cd ~/Downloads ;
rm -rf vivaldi-stable*.deb
wget https://downloads.vivaldi.com/stable/vivaldi-stable_2.9.1705.41-1_amd64.deb
sudo gdebi -n vivaldi-stable*.deb
sudo apt install vivaldi -y
}

install_zoom() {
echo_info " *** Installing Zoom *** "
cd ~/Downloads ;
rm -rf zoom_amd64.deb*
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo gdebi -n zoom_amd64.deb
}

install_brave() {
echo_info " ** Installing Brave Browser ** "
sudo apt install apt-transport-https curl
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y
}

install_skype() {
echo_info " *** Installing Skype *** "
sudo apt install -y wget
cd $HOME/Downloads
rm -rf skype*.deb
wget https://go.skype.com/skypeforlinux-64.deb
sudo gdebi -n skypeforlinux-64.deb
}

install_basecamp() {
echo_info " *** downloading and installing Basecamp: Unofficial app for Linux *** "
wget https://github.com/arturock/basecamp-linux/releases/download/v0.1.2/basecamp-0.1.2-linux-x64.tar.xz
cd ~/Downloads
tar -xzvf basecamp-linux-x64.tar.xz
sudo mv basecamp-linux-x64 /opt/basecamp-linux-x64
sudo chown -R root:root /opt/basecamp-linux-x64
sudo find /opt/basecamp-linux-x64 -type d -exec chmod 755 {} \;
sudo find /opt/basecamp-linux-x64 -type f -exec chmod 644 {} \;
sudo chmod +x /opt/basecamp-linux-x64/basecamp
sudo chmod +x /opt/basecamp-linux-x64/libnode.so
sudo chmod +x /opt/basecamp-linux-x64/libffmpeg.so
sudo ln -s /opt/basecamp-linux-x64/basecamp /usr/local/bin/basecamp
}

install_gcpsdk() {
echo_info " ** installing Google Cloud Platform SDK commandline tools ** "
#echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get install apt-transport-https ca-certificates gnupg
#curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - 
sudo apt-get update && sudo apt-get install google-cloud-sdk
}


install_node() {
echo_info " ** Installing NodeJS 14 and npm node package manager ** "
cd ;
sudo apt install gcc g++ make build-essentials -y
mkdir $HOME/.npm-global
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo -v
sudo apt update
sudo apt install -y nodejs
npm config set prefix "$HOME/.npm-global"
echo "export PATH=$HOME/.npm-global/bin:$PATH" | tee -a $HOME/.profile
source $HOME/.profile
npm install npm@latest -g
}

install_gatsbycli() {
npm install -g gatsby-cli
}

install_surge() {
npm install -g surge
}

install_nativefier() {
npm install  -g nativefier
}

install_n() {
    N_PREFIX=$HOME/.npm-global npm install -g n
    echo "export N_PREFIX=$HOME/.npm-global" | tee -a $HOME/.profile
    source $HOME/.profile
}

install_yarn() {
#    curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
#    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update && sudo apt-get install -y yarn
}

install_firejail() {
echo_info "Installing Firejail: Linux SUID Sandbox"
cd $HOME/Downloads
rm -rf firejail*.deb
wget https://sourceforge.net/projects/firejail/files/LTS/firejail-apparmor_0.9.56.2-LTS_1_amd64.deb
sudo gdebi -n firejail-apparmor_0.9.56.2-LTS_1_amd64.deb
}

install_stdnotes() {
echo_info "Downloading Standard Notes: Encrypted Notebook app image"
cd $HOME/Downloads ;
curl -s https://api.github.com/repos/standardnotes/desktop/releases/latest | grep "browser_download_url.*AppImage" | cut -d : -f 2,3 | tr -d \" | tail -1 | wget -i -
}

install_discord() {
echo_info "Installing Discord: Voice & Text Chat"
cd $HOME/Downloads ;
rm -rf discord*.deb
wget https://dl.discordapp.net/apps/linux/0.0.9/discord-0.0.9.deb
sudo gdebi -n discord-0.0.9.deb
}

install_vscode() {
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt install -y apt-transport-https
    sudo apt update
    sudo apt install -y code
}


install_dockerce() {
    echo_info "Installing Docker-CE"
    sudo apt remove docker* docker-engine docker.io containerd runc -y
    sudo apt update && sudo apt -y full-upgrade
    sudo apt install apt-transport-https ca-certificates curl software-properties-common gnupg-agent -y
 #   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
 #   sudo DEBIAN_FRONTEND=noninteractive add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" 
    sudo apt update
    sudo apt-get install docker-ce docker-ce-cli containerd.io -y
}

install_dockercompose() {
    if [[ -z $(which docker) ]]; then
        echo "Need To install Docker first "
        install_dockerce
    fi
    sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose 
    sudo docker-compose --version 
}

install_syncthing() {
#curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
#echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt-get update && sudo apt install syncthing
}

install_postman() {
wget https://dl.pstmn.io/download/latest/linux64 -O postman-linux-x64.tar.gz
sudo tar -xvzf postman-linux-x64.tar.gz -C /opt
sudo ln -s /opt/Postman/Postman /usr/local/bin/postman
echo "[Desktop Entry]
Name=Postman
GenericName=API Client
X-GNOME-FullName=Postman API Client
Comment=Make and view REST API calls and responses
Keywords=api;
Exec=/opt/Postman/Postman
Terminal=false
Type=Application
Icon=/opt/Postman/app/resources/app/assets/icon.png
Categories=Development;Utilities;" >> $HOME/.local/share/applications/postman.desktop
}

install_openvpn3() {
    sudo apt install apt-transport-https
#    wget https://swupdate.openvpn.net/repos/openvpn-repo-pkg-key.pub
#    sudo apt-key add openvpn-repo-pkg-key.pub
    if [[ -z $(ls /etc/os-release) ]]; then
        echo "no /etc/os-release, can't tell what distro you're using, but its not ubuntu or debian. Skipping."
    else
        source /etc/os-release
        case $ID in 
            ubuntu)
                DISTRO=$(lsb_release -cs)
                    ;;
            debian)
                DISTRO=$(lsb_release -cs)
                    ;;
                *)
                    echo "Can't tell what distro you're using, but its not ubuntu or debian. Skipping."
                    exit 0
                    ;;
        esac
    fi
    sudo wget -O /etc/apt/sources.list.d/openvpn3.list https://swupdate.openvpn.net/community/openvpn3/repos/openvpn3-$DISTRO.list
    sudo apt update
    sudo apt install -y openvpn3
}

install_phpcomposer() {
    if [[ -z $(which php) ]]; then
        echo "Need To install PHP first "
        sudo apt install php php-common
    fi
EXPECTED_CHECKSUM="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
then
    >&2 echo 'ERROR: Invalid installer checksum'
    rm composer-setup.php
    exit 1
fi

php composer-setup.php --quiet
RESULT=$?
rm composer-setup.php
sudo mv composer.phar /usr/local/bin/composer
exit $RESULT
}


install_appimagelauncher() {
    sudo DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:appimagelauncher-team/stable
    sudo apt-get update
    sudo apt install appimagelauncher
}
