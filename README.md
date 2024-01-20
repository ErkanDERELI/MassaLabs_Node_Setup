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







### STAKİNG İŞLEMLERİ

Client başarılı şekilde çalışmaya başladıktan sonra karşımıza Kodların bulunduğu  sayfa çıkacak.
Burada  bulunan kodlarla  Node  üzerindeki işlemleri yapabiliyoruz. Cüzdanlar arası token transferi , roll alıp-satmak gibi.
![](https://github.com/ErkanDERELI/MassaLabs_Node_Setup/blob/main/client_page.png)


< wallet_generate_secret_key > Komutu ile yeni cüzdan oluşturabilir,
< wallet_add_secret_keys  SecretKey1 >  Komutuyla da mevcut cüzdanınıza import edebilirsiniz.  

![](https://github.com/ErkanDERELI/MassaLabs_Node_Setup/blob/main/wallet_add.png)

Cüzdanımızı başarılı ile import  ettikten sonra  < wallet_info >  komutunu kullanarak  Cüzdan bakiyesini öğrenebilirsiniz.  
Bu aşamada hata alıyorsanız  NOde Çalışmıyor  anlamına gelir. 
![](https://github.com/ErkanDERELI/MassaLabs_Node_Setup/blob/main/wallet_info.png)


Staking işlemlerini başlatmak için  Minumum 100  Massa tokene ihtiyacınız  olacak,  100 Massa Token karşılığında 1 adet Roll  alabileceksiniz.
örneğin; 2000 Massa tokeniniz varsa  en fazla 20 roll alabilirsiniz.  Roll  milktarınız ne kadar  fazla olursa  stake geliriniz aynı oranda  artacaktır.
Bu konuda daha detaylı bilgileri https://t.me/massa_turkey sayfamızdan öğrenebilirsiniz.
Elimizde 2000 token varsayımı ile roll alımı yapıyoruz. 

< buy_rolls AU12iA1n5p7TR9koNikUcgDsY3Dyq6qzEpHfbEmQZabnQ12iNifcn 20 0 >
![](https://github.com/ErkanDERELI/MassaLabs_Node_Setup/blob/main/client.png)


Stake işlemini başlatmak için; cüzdan adresimizi yazıp onaylıyoruz.

< node_start_staking AU12iA1n5p7TR9koNikUcgDsY3Dyq6qzEpHfbEmQZabnQ12iNifcn > 
![](https://github.com/ErkanDERELI/MassaLabs_Node_Setup/blob/main/stakıng.png)

Stake İşlemlerini bitirdikten  sonra  artık stake gelirinizi, node durumunuzu takip  edebilir,
başka cüzdanlara transferler yapabilirsiniz.













