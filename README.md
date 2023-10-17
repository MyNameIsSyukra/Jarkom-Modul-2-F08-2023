# Jarkom-Modul-2-F08-2023
## Kelompok F08
1. Keyisa Raihan Illah Setiadi 5025211002
2. Syukra Wahyu Ramadhan 5025211037


## No 1 
Yudhistira akan digunakan sebagai DNS Master, Werkudara sebagai DNS Slave, Arjuna merupakan Load Balancer yang terdiri dari beberapa Web Server yaitu Prabakusuma, Abimanyu, dan Wisanggeni. Buatlah topologi dengan pembagian sebagai berikut. Folder topologi dapat diakses pada drive berikut.

Buat topologi dengan config yang dibutuhkan, cukup mengikuti modul akan tetapi mengikuti topologi yang sudah disediakan

## No 2
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

## No3
Dengan cara yang sama seperti soal nomor 2, buatlah website utama dengan akses ke abimanyu.yyy.com dan alias www.abimanyu.yyy.com.

Lakukan hal yang sama seperti dengan nomor 2 akan tetapi ip dan namanya berbeda, config pada file abimany.f08.com akan terlihat seperti berikut
![image](https://github.com/MyNameIsSyukra/Jarkom_F08/assets/90988646/96387770-0461-4597-88eb-253346968091)
Untuk testing jangan lupa untuk menambahkan nameserver pada client.

## No 4
Kemudian, karena terdapat beberapa web yang harus di-deploy, buatlah subdomain parikesit.abimanyu.yyy.com yang diatur DNS-nya di Yudhistira dan mengarah ke Abimanyu.

Pada file abimanyu.f08.com confignya akan terlihat seperti berikut
![image](https://github.com/MyNameIsSyukra/Jarkom_F08/assets/90988646/cdfe9dc1-1b23-416d-a889-2eed36a909b9)
Kemudian lakukan `service bind9 restart` dan untuk pengecekan lalukan `ping parikesit.abimanyu.f08.com` pada client

## No 5
Buat juga reverse domain untuk domain utama. (Abimanyu saja yang direverse)
  - nano /etc/bind/named.conf.local
    - tambahkan pada named.comf.local
![image](https://github.com/MyNameIsSyukra/Jarkom_F08/assets/90988646/6a1d5206-1c09-441c-a4d5-33d04d3ebee4)
  - cp /etc/bind/db.local /etc/bind/jarkom/3.225.192.in-addr.arpa
  - Edit file 3.225.192.in-addr.arpa
![image](https://github.com/MyNameIsSyukra/Jarkom_F08/assets/90988646/cd21f97e-5446-4efb-abfa-9cd52a984d6b)
  - Kemudian lakukan `service bind9 restart`
  - Untuk testing lakukan `apt-get update` dan `apt-get install dnsutils` pada client kemudian `host-t PTR 192.225.3.4`

## No 6
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

## No 7
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

## No 8
Untuk informasi yang lebih spesifik mengenai Ranjapan Baratayuda, buatlah subdomain melalui Werkudara dengan akses rjp.baratayuda.abimanyu.yyy.com dengan alias www.rjp.baratayuda.abimanyu.yyy.com yang mengarah ke Abimanyu

### DNS Slave
Lakukan congigurasi baratayuda.abimanyu.f08.com
![image](https://github.com/MyNameIsSyukra/Jarkom_F08/assets/90988646/b0a2391a-cd1d-4d0b-8a2a-4694c8d4dc26)
kemudian lakukan `service bind9 restart`

## No 9
Arjuna merupakan suatu Load Balancer Nginx dengan tiga worker (yang juga menggunakan nginx sebagai webserver) yaitu Prabakusuma, Abimanyu, dan Wisanggeni. Lakukan deployment pada masing-masing worker.

### Web server
Di setiap web server hanya perlu dilakukan penginstalan NGINX lalu dijalan kan servicenya, bisa di text dengan meng lynx IP web server dari komputer client

<img width="685" alt="image" src="https://github.com/MyNameIsSyukra/Jarkom_F08/assets/85614845/f37bc409-c723-47ff-a00f-28c76ad20dba">

## No 10
Kemudian gunakan algoritma Round Robin untuk Load Balancer pada Arjuna. Gunakan server_name pada soal nomor 1. Untuk melakukan pengecekan akses alamat web tersebut kemudian pastikan worker yang digunakan untuk menangani permintaan akan berganti ganti secara acak. Untuk webserver di masing-masing worker wajib berjalan di port 8001-8003. Contoh Prabakusuma:8001, Abimanyu:8002, Wisanggeni:8003

### Arjuna
Kita perlu menambahkan konfigurasi baru selain default pada NGINX, untuk mengarahkan request ke 3 web server yang berbeda. Kita hanya perlu memasukkan IP dari web server dan port yang akan digunakan.

<img width="301" alt="image" src="https://github.com/MyNameIsSyukra/Jarkom_F08/assets/85614845/20e76da1-d1f6-4f1c-87b4-03f3564f1a6a">

Lalu untuk setiap web server kita perlu tambahkan konfigurasi NGINX yang ada, agar sesuai dengan port yang ingin dituju

<img width="423" alt="image" src="https://github.com/MyNameIsSyukra/Jarkom_F08/assets/85614845/77c194c6-bcef-45e0-a079-6235ea0efc11">

## No 11
Selain menggunakan Nginx, lakukan konfigurasi Apache Web Server pada worker Abimanyu dengan web server www.abimanyu.yyy.com. Pertama dibutuhkan web server dengan DocumentRoot pada /var/www/abimanyu.yyy

### Abimanyu
Kita hanya perlu melakukan instalasi APACHE2 pada abimanyu dan menjalankan servicenya, lalu kita bikin file konfigurasi baru pada NGINX sesuai dengan kebutuhan soal yang ada, jangan lupa juga untuk menjalankan a2ensite sesuai domain

<img width="376" alt="image" src="https://github.com/MyNameIsSyukra/Jarkom_F08/assets/85614845/0e1f6685-7e4f-41a4-a4c9-f3e638f830a0">

Tidak lupa juga ktia harus mengcopy file resource dari google drive agar berada pada /var/www/abimanyu.f08 sehingga ketika kita mengakses domain tersebut akan terlihat tampilan yang diinginkan

<img width="406" alt="image" src="https://github.com/MyNameIsSyukra/Jarkom_F08/assets/85614845/86f71777-6fc7-4319-b0eb-2df03a69eb56">

Kita bisa mengetest nya dengan menggunakan lynx dari komputer client ke domain tersebut

## No 12
Setelah itu ubahlah agar url www.abimanyu.yyy.com/index.php/home menjadi www.abimanyu.yyy.com/home.

### Abimanyu 
Unutk membuat /home agar sama dengan index.php/home, kita hanya perlu menggunakan Alias pada configurasi APACHE2 abimanyu.f08.com

<img width="593" alt="image" src="https://github.com/MyNameIsSyukra/Jarkom_F08/assets/85614845/f2da4ccc-3cfe-4946-b1a3-7648c8dcc999">

## No 13
Selain itu, pada subdomain www.parikesit.abimanyu.yyy.com, DocumentRoot disimpan pada /var/www/parikesit.abimanyu.yyy

### Abimanyu
Kita perlu membuat konfigurasi baru untuk parikesit, dan menjalankan a2ensite untuk domain tersebut

<img width="582" alt="image" src="https://github.com/MyNameIsSyukra/Jarkom_F08/assets/85614845/4fc4b2b6-6f62-4664-8cc1-93bbc2975a64">

tidak lupa juga harus mengcopy file resource yang dibutuhkan dari google drive, agar berada di /var/www/parikesit.abimanyu.f08

<img width="519" alt="image" src="https://github.com/MyNameIsSyukra/Jarkom_F08/assets/85614845/2619e483-cf20-499c-9829-a28be4370dc9">

Seperti tadi, kita bisa mnegetestnya dengan menggunakan lynx ke domain parikesti dari komputer client

## No 14
Pada subdomain tersebut folder /public hanya dapat melakukan directory listing sedangkan pada folder /secret tidak dapat diakses (403 Forbidden).

### Abimanyu
Kiat perlu membuat directory secret pada /var/www/parikesit.abimanyu.f08, dan directory ini tidak boleh diakses, ketika user ingin mengakses /secret maka harus muncul pesan 403 forbidden. Untuk melakukan hal tersebut maka kita harus menambahkan directory /secret dengan --indexes dan deny from all

<img width="678" alt="image" src="https://github.com/MyNameIsSyukra/Jarkom_F08/assets/85614845/24f7b70b-dc65-4fa4-b70d-04e1a196ffac">

Untuk mengetestnya kita hanya perlu menggunakana lynx dari komputer client ke domain parikesit /secret, hasil yang ditunjukkan harus 403 forbidden

## No 15
Buatlah kustomisasi halaman error pada folder /error untuk mengganti error kode pada Apache. Error kode yang perlu diganti adalah 404 Not Found dan 403 Forbidden.

### Abimanyu
Kita hanya perlu menambahkan error document pada configurasi APACHE2 parikesit, dan mengarahkannya ke /error yang sudah disediakan pada resource

<img width="651" alt="image" src="https://github.com/MyNameIsSyukra/Jarkom_F08/assets/85614845/47a158c8-deec-410f-a48d-9da753966596">

## No 16
Buatlah suatu konfigurasi virtual host agar file asset www.parikesit.abimanyu.yyy.com/public/js menjadi 
www.parikesit.abimanyu.yyy.com/js 

### Abimanyu
Sama seperti /home tadi, kita hanya perlu menggunakan alias

<img width="578" alt="image" src="https://github.com/MyNameIsSyukra/Jarkom_F08/assets/85614845/ecbe91fe-4cdc-43af-94cd-7b0a5d92a67d">

Untuk mengetestnya kita hanya perlu meng lynx parikesit /js, jika mengeluarkan list directory sama seperti public/js/

## No 17
Agar aman, buatlah konfigurasi agar www.rjp.baratayuda.abimanyu.yyy.com hanya dapat diakses melalui port 14000 dan 14400.

### Abimanyu
Kita perlu membuat konfigurasi baru, untuk rjp.baratayuda yang mendengar dari port 14000 14400, lalu copy resource dari drive ke /var/www/rjp.baratayuda.abimanyu.f08. tidak lupa juga untuk melakukan a2ensite ke domain tersebut

<img width="589" alt="image" src="https://github.com/MyNameIsSyukra/Jarkom_F08/assets/85614845/2825b947-726f-455b-89ac-0ef3dbb7b486">

Jangan lupa untuk menambahkan port pada port configuration APACHE2 

<img width="643" alt="image" src="https://github.com/MyNameIsSyukra/Jarkom_F08/assets/85614845/c52113a0-4f33-41b6-9809-9cbd56d3000c">

Untuk mengetest nya kita hanya perlu lynx ke domain tersebut dari komputer client

## No 18
Untuk mengaksesnya buatlah autentikasi username berupa “Wayang” dan password “baratayudayyy” dengan yyy merupakan kode kelompok. Letakkan DocumentRoot pada /var/www/rjp.baratayuda.abimanyu.yyy.

### Abimanyu
Kita hanya perlu menambahkan authentication pada file konfigurasi rjp.baratayuda

<img width="602" alt="image" src="https://github.com/MyNameIsSyukra/Jarkom_F08/assets/85614845/d459ec38-f624-419a-a365-e9a7bf75eed4">

Jangan lupa untuk menjalankan perintah untuk menambhkan username dan password

<img width="299" alt="image" src="https://github.com/MyNameIsSyukra/Jarkom_F08/assets/85614845/db024819-2f48-4c1c-93c4-697c84b932e6">

## No 19
Buatlah agar setiap kali mengakses IP dari Abimanyu akan secara otomatis dialihkan ke www.abimanyu.yyy.com (alias)

### Abimanyu
Pada konfigurasi server abimanyu.f08, kita perlu menambahkan servername alias lagi sesuai dnegan ip server abimanyu

<img width="553" alt="image" src="https://github.com/MyNameIsSyukra/Jarkom_F08/assets/85614845/918de0f7-8138-4c28-8fbb-9778bbbc59c7">

Untuk mengetestnya kita hanya perlu melakukan lynx ke IP, maka hasil yang ditampilkan akan sama dengan abimanyu.f08.com


