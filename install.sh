#!/data/data/com.termux/files/usr/bin/bash
#Tube-Vide07
#Coded by Z3R07-RED on Oct 14 2020
#
#Define colors
W='\033[0m'
N='\033[1;30m'
R='\033[1;31m'
G='\033[1;32m'
Y='\033[1;33m'
B='\033[1;34m'
M='\033[1;35m'
C='\033[1;36m'
#
echo $(clear)
echo -e "\e[1;37mTube-Vide07\e[0m"
echo ""
echo "Coded by Z3R07-RED on Oct 14 2020"
echo ""

# dependencies
function dependencies(){
echo -e "\033[0m\e[0mChecking the required programs ...\033[0m\e[0m"
dependencies=(python python2 wget) # dependencies
for program in "${dependencies[@]}"; do
    echo -ne "\n\e[0m[*] $program tool ..."
    test -f $PREFIX/bin/$program
    if [ "$(echo $?)" == "0" ]; then
        echo " (V)"
    else
        echo -e " \e[1;31m(X)\e[0m"
        echo -e "\n\e[1;33m[i]\e[0m Installing '$program' tool ..."
        apt-get install $program -y > /dev/null 2>&1
        echo -e "\n\e[1;32m[V]\e[0m $program tool ..."
    fi; sleep 1
done
}

dependencies
echo ""
echo -e "Installing youtube-dl\n"
pip install youtube-dl

echo -e "Creating the Youtube folder to download the files\n"
if [[ ! -d ~/storage/shared/TubeVideo ]]; then
    mkdir ~/storage/shared/TubeVideo
    sleep 0.1
fi

echo -e "Creating youtube-dl folder for config\n"
if [[ ! -d ~/.config/youtube-dl ]]; then
    mkdir -p ~/.config/youtube-dl
    sleep 0.1
fi

echo -e "Creating bin folder\n"
if [[ ! -d ~/bin ]]; then
    mkdir ~/bin
    sleep 0.1
fi

if [[ ! -f ~/.netrc ]]; then
    cat .netrc > ~/.netrc
    chmod 777 ~/.netrc
fi

echo -e "Installing termux-url-opener\n"
cat termux-url-opener > ~/bin/termux-url-opener
dos2unix ~/bin/termux-url-opener
chmod +x ~/bin/termux-url-opener

if [[ -d ~/Tube-Vide07 ]]; then
    rm -rf ~/Tube-Vide07
fi

echo -e "\n"
echo -e "\n"
echo -e "Downloaded Files will be found in TubeVideo Folder in internal storage\n"
echo -e "Copyright 2020 Z3R07-RED, modified by secret club 07\n"
