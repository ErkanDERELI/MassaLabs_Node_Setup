#!/bin/bash

bold=$(tput bold)
underline=$(tput smul)
italic=$(tput sitm)
info=$(tput setaf 2)
error=$(tput setaf 160)
warn=$(tput setaf 214)
reset=$(tput sgr0)

clear;
echo "MassaLabs  Node Installation"
sleep 3

# server update and port settings
sudo apt-get update -y
sudo apt install ufw -y
sudo ufw allow 22
sudo ufw allow ssh
sudo ufw allow 31244/tcp
sudo ufw allow 31245/tcp
sudo ufw enable


clear;
sudo ufw status
echo "${info}INFO${reset}: installation is ${bold}set${reset} please wait... "

sleep 5

# required libraries
sudo apt install pkg-config curl git build-essential libssl-dev libclang-dev -y
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustc --version

# change later because this old library
rustup toolchain install nightly-2023-02-27
rustup default nightly-2023-02-27
rustc --version

# From binaries
wget https://github.com/massalabs/massa/releases/download/DEVN.28.2/massa_DEVN.28.2_release_linux.tar.gz
tar -xf massa_DEVN.28.2_release_linux.tar.gz

# settings file
clear;
echo "---------------------"
echo "${info}INFO${reset}: Libraries loaded ${bold}successfully${reset}..."
echo "---------------------"
sleep 2

read -p 'Set ip address: ' ipadr

echo -e "[network]\nroutable_ip = '$ipadr'" >> massa/massa-node/config/config.toml

sudo apt install screen -y

# node start
screen -S massa-node -d -m bash
screen -r massa-node -X stuff "cd massa/massa-node/ && sudo ./massa-node"$(echo -ne '\015')
echo "${info}INFO${reset}: NODE ${bold}STARTED${reset}."

# client start
screen -S massa-client -d -m bash
screen -r massa-client -X stuff "cd massa/massa-client/ && sudo ./massa-client"$(echo -ne '\015')
echo "${info}INFO${reset}: CLIENT ${bold}STARTED${reset}."

cat << EOF
                      .*%%#,
              %%%%%%%%%%%%%%%%%%%%%#*             
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#         
       .%%%%%%%#    %%%%%%%%%%%    %%%%%%%%       
     %%%%%%%%%%%%     %#%%%%%     %%%%%%%%%%%(    
    %%%%%%%%%%%%%%     %%%%%     %%%%%%%%%%%%%#   
  *%%%%%%%%%%%%%%%%#    ,#     %%%%%%%#%%%%%%%%%  
 .%%%%%%%%%              #              %%%%%%%%# 
 %%%%%%%%%%     %%%%%%%%%%%%%%%%%##     %%%%%%%%%#
.%%%%%%%%%%%#    .%%%%%%%%%%%%%%%     #%%%%%%%%%%#
%%%%%%%#####%#     %%%%%%%%%%%%%     ########%%%%%
.%%%%#             %%%%%%%%%%%#%             %%%#%
 %%%%%%%%%%%%%%%%%    %%%%%%#    #%%%%%%%%%%%%%%%%
 .%%%%%%%%%%%%%%       #%%##       %%%%%%%%%%%%%% 
  .#%%%%%%%%%##          #          %%%%%%%%%%%#  
    %%%%%%%%%     %%%        .%##    *%%%%%%%%%   
     #%%%%%%#    %%%%%#     %%%%##    %%%%%%#     
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       
          /#%%%%%%%%%%%%%%%%%%%%%%%%%%#%          
              .%%%%%%%%%%%%%%%%%%%%#

EOF
echo "${info}INFO${reset}: Screens have been created successfully, enter the ${bold}(screen -ls)${reset} command to view them."
sleep 3
