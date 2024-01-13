You can access the installation video here: https://youtu.be/dsr5FgZPSto?si=1QLaGtOEMWzFzfWj
/////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////

1-   sudo apt-get update && sudo apt-get upgrade

2-   screen -S MassaNode


3-   sudo apt install ufw -y 

4-   sudo ufw allow 22 

5-   sudo ufw allow ssh

6-   sudo ufw allow 31244/tcp

7-   sudo ufw allow 31245/tcp 

8-   sudo ufw enable 


9-   sudo apt install pkg-config curl git build-essential libssl-dev libclang-dev cmake

10-   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

11-   source $HOME/.cargo/env

12-   rustc --version  (optional)

13-   rustup toolchain install 1.74.1

14-   rustup default 1.74.1

15-   rustc --version  (optional)

16-   git clone https://github.com/massalabs/massa.git

17-   nano massa/massa-node/config/config.toml


[protocol]
routable_ip = "88.120.15.55"      ( Write your own address in the IP address section)

Kayıt için: CTRL X   daha sonra Y ile kaydet. Enter ile çıkış yap.


18-  cd massa/massa-node/

19-  RUST_BACKTRACE=full cargo run --release -- -p  "PASSWORD" |& tee logs.txt 

( Type our own hard-to-find password where it says PASSWORD. ) PASSWORD Yerine kendi şifrenizi yazın ( Tırnaklar Olmadan ) 


CTRL A + C  

20-   cd massa/massa-client/

21-   cargo run --release -- -p "PASSWORD"     

To switch between "NODE" and "CLIENT" pages   CTRL A + P  
