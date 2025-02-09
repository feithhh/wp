UKK PROXMAX

Contekan ---------------------------------------------------------------------------------
remot contekan
- git clone https://github.com/kohanss/wp.git
- cd /wp
- cat (tab)	

Cara pindah file di ubuntu ---------------------------------------------------------------

- ls nya di /home/niam/wp (di ls mau mindahin apa) misal di dalem ada folder ukk sama nm,, trs mau pindah yang nm
- mv nm/ /home/niam/ (nanti file pindah di dzaki dan tidak lagi di wp)

Pengertian" dari perintah" ini -----------------------------------------------------------

nano = editor teks dalam file
cd = perintah untuk mengubah difolder kita berada
ls = menampilkan daftar file dan direktori
rm = del file 
rm -rv = del direktori
mv = move file ke folder lain  
cp = buat copy file
FLUSH PRIVILEGES = memuat ulang tabel database

INSTALASI PROXMOX ------------------------------------------------------------------------
PERTAMA Ganti IP proxmox  : nano /etc/network/interfaces
  	systemctl restart networking.service (SV IP)

- nano /etc/network/interfaces
(Dalamnya di isi ini)
auto lo
iface lo inet loopback

iface ens18 inet manual

auto vmbr0
iface vmbr0 inet static
        address 10.10.10.1**/24
        gateway 10.10.10.254
        bridge-ports ens18
        bridge-stp off
        bridge-fd 0


source /etc/network/interfaces.d/*

-

INSTALASI WP ----------------------------------------------------------------------------
Public Ip proxmox   : 103.210.35.189:8006
local Ip proxmox    : 10.10.10.1:8006
local Ip vm/linux   : 10.10.10.68
serv name	    : sijanet              (yang ada di belakang @)
pick user	    : niam		 (yang ada di depan @)
User proxmox 	    : root
Pw proxmox 	    : Ukk2025*
Pw WP		    : ukkniam
FILE prox/wp        : \\10.1.11.201\MyData\hacker NT\ISO
Kalau Proxmox Linux : User nya pasti default(root) pw nya ngikut
Kalau WP	    : User dan pw ngikut buatan kita  

Command WP ------------------------------------------------------------------------------
- sudo su
- Static ip WP  :   
- nano /etc/netplan/50-cloud-init.yaml
dalam nano di isi = 
network:
    ethernets:
        ens18:
            dhcp4: false
            addresses: [10.10.10.1**/24]
            routes:
              -  to: default
                 via: 10.10.10.254
            nameservers:
              addresses: [10.10.10.254]
    version: 2

-netplan apply (SV IP)

; Letak domain atau record
@       IN      A       10.10.10.110
www.ukk-niam.net.      IN      CNAME   ukk-niam.net.

Problm-----------------------------------------------------------------------------------
+ jika systemctl restart named.service tidak bisa maka cek 
  -systemctl status named.service(cek status)
  -nano /etc/bind + tab (buat cek ada apa aja di nano bind)
  -nano /etc/bind/ukk-namaKamu.net
  -nano /etc/bind/ukk-niam.net.reverse
  -nano /etc/bind/named.conf.
  -nano /etc/bind/named.conf.local

+ jika tidak muncul ip dan masih 127
 -nano /etc/netplan/50-cloud-init.yaml
 -network:
    ethernets:
        ens18:
            dhcp4: false
            addresses: [10.10.10.205/24]
            routes:
              -  to: default
                 via: 10.10.10.254
            nameservers:
              addresses: [10.10.10.254]
    version: 2


Remot use cmd ---------------------------------------------------------------------------

- ssh dzaki@10.10.10.** (cmd)
