You can access the installation video here: https://youtu.be/dsr5FgZPSto?si=1QLaGtOEMWzFzfWj
/////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////

sudo apt-get update && sudo apt-get upgrade

screen -S MassaNode


sudo apt install ufw -y 

sudo ufw allow 22 

sudo ufw allow ssh

sudo ufw allow 31244/tcp

sudo ufw allow 31245/tcp 

sudo ufw enable 


sudo apt install pkg-config curl git build-essential libssl-dev libclang-dev cmake

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

source $HOME/.cargo/env

rustc --version  (optional)

rustup toolchain install 1.74.1

rustup default 1.74.1

rustc --version  (optional)

git clone https://github.com/massalabs/massa.git

nano massa/massa-node/config/config.toml


[protocol]
routable_ip = "88.120.15.55"      ( Write your own address in the IP address section)

Kayıt için: CTRL X   daha sonra Y ile kaydet. Enter ile çıkış yap.


cd massa/massa-node/

RUST_BACKTRACE=full cargo run --release -- -p  "PASSWORD" |& tee logs.txt 

( Type our own hard-to-find password where it says PASSWORD. )


CTRL A + C  

cd massa/massa-client/

cargo run --release -- -p "PASSWORD"     

To switch between "NODE" and "CLIENT" pages   CTRL A + P  
