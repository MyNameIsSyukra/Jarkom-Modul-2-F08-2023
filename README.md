# Jarkom_F08

## 1. No1 
Yudhistira akan digunakan sebagai DNS Master, Werkudara sebagai DNS Slave, Arjuna merupakan Load Balancer yang terdiri dari beberapa Web Server yaitu Prabakusuma, Abimanyu, dan Wisanggeni. Buatlah topologi dengan pembagian sebagai berikut. Folder topologi dapat diakses pada drive berikut.

Buat topologi dengan config yang dibutuhkan, cukup mengikuti modul akan tetapi mengikuti topologi yang sudah disediakan

## 2. No2
Buatlah website utama pada node arjuna dengan akses ke arjuna.yyy.com dengan alias www.arjuna.yyy.com dengan yyy merupakan kode kelompok.
1. Pada DNS Master
   -  apt-get update
   -  apt-get install bind9 -y
   -  nano /etc/bind/named.conf.local
   -  `zone "jarkom2022.com" {
	    type master;
	    file "/etc/bind/jarkom/arjuna.f08.com";
      };`
   - `mkdir /etc/bind/jarkom`
   - `cp /etc/bind/db.local /etc/bind/jarkom/arjuna.f08.com`
   - `nano /etc/bind/jarkom/arjuna.f08.com`
   - tambahkan syntax berikut

![image](https://github.com/MyNameIsSyukra/Jarkom_F08/assets/90988646/414dd266-8e6d-4886-8158-b6d24230cb50)
   - lakukan `service bind9 restart` atau `named -g`

## 3. No3
Dengan cara yang sama seperti soal nomor 2, buatlah website utama dengan akses ke abimanyu.yyy.com dan alias www.abimanyu.yyy.com.

Lakukan hal yang sama seperti dengan nomor 2 akan tetapi ip dan namanya berbeda, config pada file abimany.f08.com akan terlihat seperti berikut
![image](https://github.com/MyNameIsSyukra/Jarkom_F08/assets/90988646/96387770-0461-4597-88eb-253346968091)
Untuk testing jangan lupa untuk menambahkan nameserver pada client.

## 4. No4
Kemudian, karena terdapat beberapa web yang harus di-deploy, buatlah subdomain parikesit.abimanyu.yyy.com yang diatur DNS-nya di Yudhistira dan mengarah ke Abimanyu.

Pada file abimanyu.f08.com confignya akan terlihat seperti berikut
![image](https://github.com/MyNameIsSyukra/Jarkom_F08/assets/90988646/cdfe9dc1-1b23-416d-a889-2eed36a909b9)
Kemudian lakukan `service bind9 restart` dan untuk pengecekan lalukan `ping parikesit.abimanyu.f08.com` pada client

## 5. No5
Buat juga reverse domain untuk domain utama. (Abimanyu saja yang direverse)
  - nano /etc/bind/named.conf.local
    - tambahkan pada named.comf.local
![image](https://github.com/MyNameIsSyukra/Jarkom_F08/assets/90988646/6a1d5206-1c09-441c-a4d5-33d04d3ebee4)
  - cp /etc/bind/db.local /etc/bind/jarkom/3.225.192.in-addr.arpa
  - Edit file 3.225.192.in-addr.arpa
![image](https://github.com/MyNameIsSyukra/Jarkom_F08/assets/90988646/cd21f97e-5446-4efb-abfa-9cd52a984d6b)
  - Kemudian lakukan `service bind9 restart`
  - Untuk testing lakukan `apt-get update` dan `apt-get install dnsutils` pada client kemudian `host-t PTR 192.225.3.4`

## 6. No6
Agar dapat tetap dihubungi ketika DNS Server Yudhistira bermasalah, buat juga Werkudara sebagai DNS Slave untuk domain utama.

### Pada DNS master lakukan 
config pada file named.conf.local menjadi seperti berikut
![image](https://github.com/MyNameIsSyukra/Jarkom_F08/assets/90988646/47719c46-cf5f-4b68-94a4-ff47368f74f1)
Kemudian lakukan `service bind9 restart`

### Pada DNS slave lakukan:
  - `apt-get update`
  - `apt-get install bind9 -y`
  - Pada named.conf.local lakukan config seperti berikut
![image](https://github.com/MyNameIsSyukra/Jarkom_F08/assets/90988646/0d1f2ba8-8db9-4974-a230-cd90cfa92b9d)
  - lakukan `service bind9 restart`

### Testing
  - lakukan `service bind9 stop` pada DNS master
  - tambahkan nameserver dari DNS slave ke resolv.conf client
  - lakukan `ping abimanyu.f08.com`

## 7. No 7
Seperti yang kita tahu karena banyak sekali informasi yang harus diterima, buatlah subdomain khusus untuk perang yaitu baratayuda.abimanyu.yyy.com dengan alias www.baratayuda.abimanyu.yyy.com yang didelegasikan dari Yudhistira ke Werkudara dengan IP menuju ke Abimanyu dalam folder Baratayuda.

### DNS master
  - Pada file /jarkom/abimanyu.f08.com lakukan config seperti berikut
![image](https://github.com/MyNameIsSyukra/Jarkom_F08/assets/90988646/7edb3347-256c-4e65-9ce5-6c8ca713f984)
  - Kemudian edit file named.conf.option
![image](https://github.com/MyNameIsSyukra/Jarkom_F08/assets/90988646/414f4435-f24b-4ee3-8594-81aad136b228)
  - Kemudian edit file named.conf.local
![image](https://github.com/MyNameIsSyukra/Jarkom_F08/assets/90988646/1df01cf3-2ceb-41ab-a648-29c0a4a918e4)
  - Lakukan `service bind9 restart`
  - 
### DNS slave
  - pada file named.conf.option tambahkan
![image](https://github.com/MyNameIsSyukra/Jarkom_F08/assets/90988646/943a0d2a-567c-4ad4-b2a2-9a22ee15911e)
  - pada named.conf.local tambahkan 
![image](https://github.com/MyNameIsSyukra/Jarkom_F08/assets/90988646/c4ca7e42-6217-48bd-9372-999245f363f2)
  - lakukan `mkdir /etc/bind/delegasi`
  - Kemudian `cp /etc/bind/db.local /etc/bind/delegasi/baratayuda.abimanyu.f08.com`
  - Edit file `baratayuda.abimanyu.f08.com`
![image](https://github.com/MyNameIsSyukra/Jarkom_F08/assets/90988646/a02a0833-5f85-47b4-a1d5-f5fc83f6597a)
  - Lakukan `service bind9 restart`

### Testing 
  - lakukan `ping baratayuda.abimanyu.f08.com`

## 8. No8
Untuk informasi yang lebih spesifik mengenai Ranjapan Baratayuda, buatlah subdomain melalui Werkudara dengan akses rjp.baratayuda.abimanyu.yyy.com dengan alias www.rjp.baratayuda.abimanyu.yyy.com yang mengarah ke Abimanyu

### DNS Slave
Lakukan congigurasi baratayuda.abimanyu.f08.com
![image](https://github.com/MyNameIsSyukra/Jarkom_F08/assets/90988646/b0a2391a-cd1d-4d0b-8a2a-4694c8d4dc26)
kemudian lakukan `service bind9 restart`















