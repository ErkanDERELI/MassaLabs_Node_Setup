![](https://github.com/ErkanDERELI/MassaLabs_Node_Setup/blob/main/Massa_TransBG_Red_Black.png)


You can access the installation video here: https://youtu.be/dsr5FgZPSto?si=1QLaGtOEMWzFzfWj



```yaml
sudo apt-get update && sudo apt-get upgrade
```

```yaml
screen -S MassaNode
```


```yaml
sudo apt install ufw -y
sudo ufw allow 22
sudo ufw allow ssh
sudo ufw allow 31244/tcp
sudo ufw allow 31245/tcp 
sudo ufw enable 
```
```yaml
sudo apt install pkg-config curl git build-essential libssl-dev libclang-dev cmake
```

```yaml
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

```yaml
source $HOME/.cargo/env
```

```yaml
rustc --version
```

```yaml
rustup toolchain install 1.74.1
```

```yaml
rustup default 1.74.1
```

```yaml
rustc --version
```

```yaml
git clone https://github.com/massalabs/massa.git
```

```yaml
nano massa/massa-node/config/config.toml
```
##### ( Write your own address in the IP address section)

```yaml
[protocol]
routable_ip = "88.120.15.55" 
```

![](https://github.com/ErkanDERELI/MassaLabs_Node_Setup/blob/main/set_ip.png)

Kayıt için: CTRL X   daha sonra Y ile kaydet. Enter ile çıkış yap.


```yaml
cd massa/massa-node/
```

( Type our own hard-to-find password where it says PASSWORD. ) PASSWORD Yerine kendi şifrenizi yazın ( < > İşaretleri   Olmadan )

```yaml
RUST_BACKTRACE=full cargo run --release -- -p <PASSWORD> |& tee logs.txt
```




CTRL A + C  

```yaml
cd massa/massa-client/
```

```yaml
cargo run --release -- -p <PASSWORD>
```

### To switch between "NODE" and "CLIENT" pages   CTRL A + P 

