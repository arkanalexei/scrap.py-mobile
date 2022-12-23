# ♻️ Scrap.py ♻️
![Banner](banner.png)

[![Pre-Release](https://github.com/arkanalexei/scrap.py-mobile/actions/workflows/pre-release.yml/badge.svg)](https://github.com/arkanalexei/scrap.py-mobile/actions/workflows/pre-release.yml)
[![Release](https://github.com/arkanalexei/scrap.py-mobile/actions/workflows/release.yml/badge.svg)](https://github.com/arkanalexei/scrap.py-mobile/actions/workflows/release.yml)
[![Staging](https://github.com/arkanalexei/scrap.py-mobile/actions/workflows/staging.yml/badge.svg)](https://github.com/arkanalexei/scrap.py-mobile/actions/workflows/staging.yml)
[![Build status](https://build.appcenter.ms/v0.1/apps/7cece1c6-7825-4e7a-9b5b-092ceb4d8649/branches/master/badge)](https://appcenter.ms)

>Proyek ini dibuat untuk memenuhi tugas Proyek Akhir Semester (PAS) pada mata kuliah Pemrograman Berbasis Platform (CSGE602022) yang diselenggarakan oleh Fakultas Ilmu Komputer, Universitas Indonesia pada Semester Gasal, Tahun Ajaran 2022/2023.

## 📱 Tautan APK 📱
`install.appcenter.ms/users/arkanalexei/apps/scrappy/distribution_groups/public`

## ⚒️ Tools ⚒️
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Heroku](https://img.shields.io/badge/heroku-%23430098.svg?style=for-the-badge&logo=heroku&logoColor=white)
![Railway](https://img.shields.io/badge/Railway-0B0D0E.svg?style=for-the-badge&logo=Railway&logoColor=white)

## 👤 Anggota Kelompok 👤
- [Laela Putri Salsa Biella - 2106751562](https://github.com/salsabiellalp)
- [Inez Bungaria Octaviana Pardede - 2106751833](https://github.com/InezBungaria)
- [Givarrel Veivel Pattiwael - 2106640341](https://github.com/Veivel)
- [Abraham Javier Sebastian Situmorang - 2106704364](https://github.com/ajsebastians)
- [Arkan Alexei Andrei - 2106631463](https://github.com/arkanalexei)

## 📝 Ringkasan 📝
Indonesia merupakan negara produsen sampah terbesar di seluruh Asia. Faktanya, kita menghasilkan 67,8 juta ton sampah pada tahun 2021. Produksi sampah Indonesia pada tahun 2022 diperkirakan mencapai 68,8 juta ton.

Scrap.py adalah sebuah organisasi non profit yang bertujuan untuk mengurangi jumlah sampah dengan mendaur ulang dan mengelola sampah dengan baik. Kami bekerja dengan sukarelawan untuk mengolah sampah-sampah anda untuk masa depan yang lebih cerah.

*Cleaning the environment, one scrap at a time.*

## 📃 Modules + Kontrak Kinerja 📃
### Register/Login @Arkan
Halaman untuk membuat akun atau login. Tipe user yang login akan mempengaruhi akses serta tampilan pada websitenya.
### Home @Arkan
Tampilan utama website. Menampilkan informasi umum mengenai websitenya. Hal-hal seperti statistik seputar sampah dunia, teknis deposit sampah, dan lain-lain.
### About Us + Contact @Bastian
Halaman untuk mengetahui informasi lebih jauh mengenai organisasi dan apa yang kami lakukan. Halaman ini akan menampilkan latar belakang munculnya organisasi, visi dan misi, dan daftar anggota organisasi. Selain itu, halaman ini akan menampilkan daftar kontak yang dapat dihubungi dan form feedback yang dapat diisi jika mempunyai kesan dan pesan.

### News/Blog @Arkan
Halaman dimana admin bisa menulis dan menerbitkan artikel baru. Tipe user selain admin hanya bisa melihat artikel-artikel tersebut.

### Deposit Sampah @Veivel
Halaman dimana user yang sudah login dapat mensubmit form untuk deposit sampah ke sistem bank sampah. User bisa menentukan jumlah sampah deposit dan tipe sampahnya (yang sudah pre-determined). Tergantung deposit yang dilakukan, user akan mendapatkan poin di *balance*nya yang nanti dapat ditukar.

### Point Leaderboard @Bella
Halaman papan peringkat. Menampilkan user dengan point tertinggi. Tampilan user diurutkan berdasarkan point yang diperoleh user selama menggunakan website.

### Tukar Poin @Inez
Halaman untuk user menukar poin hasil deposit sampah menjadi voucher/perks. Hanya dapat diakses oleh user yang sudah memiliki akun dan login.

### Green Footprint Calculator @ Arkan
Kalkulator jumlah *Greenhouse Emissions* yang telah dikurangi oleh user dengan melakukan deposit ke bank sampah. Jumlah tersebut akan ditampilkan pada halaman home user.

## 👨‍💻 Role Pengguna 👨‍💻
### 👤 Admin 👤
- Admin dapat membuat artikel baru di halaman news/blog.

### 🔒 User Yang Tidak Login 🔒
- User bisa melihat artikel yang sudah dipublish admin
- User bisa melihat feedback dan rating di halaman about us
- User bisa melihat profil organisasi, visi dan misi organisasi, dan daftar anggota organisasi di halaman about us
- User bisa melihat point leaderboard

### 🔑 User Yang Sudah Login 🔑
- User bisa melihat artikel yang sudah dipublish admin
- User bisa mengirim feedback dan rating melalui form di halaman about us
- User bisa menghapus feedback dan rating melalui dashboard history.
- User bisa melihat point leaderboard
- User bisa deposit sampah
- User bisa menukar poin
- User bisa melihat green footprint mereka

## 🌐 Integrasi Web 🌐
Integrasi web dilakukan dengan membuat fungsi fetch yang mengembalikan Future sebuah tipe data secara asinkronus dari endpoint Railway. Objek Future ini dapat menyimpan status pending dari sebuah operasi asinkronus (Uncompleted) ataupun hasil operasinya sendiri (Completed). Aplikasi Flutter dapat berinteraksi dengan endpoint Railway dengan cara yang sama seperti website berbasis Django yang berinteraksi dengan endpoint. Endpoint tersebut disimpan pada var url.

## Quick Start
Setelah melakukan `git clone` dari repositori ini, lakukan `flutter pub get` untuk meng-update packages yang termasuk dalam pubspec. Kemudian aplikasi bisa dijalankan secara local dengan `flutter run`, atau `flutter run -d chrome --web-renderer html` jika ada masalah dengan command yang pertama.

-----

## Widgets

Kami menggunakan berbagai macam widget, dari yang stateful sampai yang stateless. Stateless widget adalah komponen yang tidak memiliki 'variabel' berubah-ubah. Ia bisa menerima props yang pada setiap render/build berubah, namun widgetnya sendiri tidak berubah (karena hanya digantikan pada refresh). Sedangkan, stateful widget adalah widget yang memiliki 'state', yaitu variable yang dapat berubah. 

Misalnya RecentDeposits widget yang menampung FutureBuilder untuk daftar deposits terbaru. Konten dari daftar deposit tersebut dapat berubah ketika fetching sudah berhasil, maka ia adalah stateful widget. Text widget yang menampilakn depositnya sendiri termasuk stateless karena ia menerima props atau argumen, yang ketika berubah, widgetnya akan di build ulang sehingga tampilannya terbaharui. Page untuk form juga berupa Stateful Widget karena isi input field dalam formnya dapat berubah ketika diisi user.

## Event Listeners/Handlers

Aplikasi ini menggunakan berbagai macam event handler untuk menangani event yang terjadi. Misalnya, banyak tombol menggunakan listener onPressed atau onTap untuk melakukan suatu *action* ketika user men-tap atau memencet tombol terssebut. Kemudian ada juga event onChanged untuk input field dalam form. Event handler ini mengubah nilai dari input form tersebut namun sekaligus. Setelah form tersebut disimpan, ada juga event handler onSaved yang dapat menyimpan data tersebut.

## Kesulitan yang dihadapi

Dalam pengerjaan proyek kali ini, kami harus mengintegrasikan backend yang sudah ada ke dalam aplikasi Flutter, yang sendirinya merupakan teknologi yang sangat amat baru dan belum di dalam zona nyaman. Selain migrasi dari Heroku ke Railway yang cukup menantang, banyak masalah yang muncul dari awal hingga akhir pengerjaan proyek dari backend Django karena kurang sesuai dan belum bisa digunakan oleh Flutter. 

Misalnya, kami harus mengadaptasi POST request handler Django untuk bisa menerima data form dalam bentuk JSON object dalam body, daripada bentuk HTML Form (request.form.data). Kemudian banyak halaman yang perlu ditambah dekorator @csrf_exempt karena proyek Django kami tidak dibuat untuk menerima request dari luar website. Setelah masalah tersebut diselesaikan, adapun pertanyaan besar yaitu bagaimana melakukan autentikasi menggunakan Flutter. Meskipun adanya package pbp_django_auth, namun implementasinya tetap menantang karena dia termasuk teknologi yang baru dan berbeda.

Selain itu, tantangan muncul terkait pembuatan GitHub Workflow sebagai bagian dari CI/CD ke App Center. Hal tersebut perlu kami jelajahi sendiri, mulai dari pilihan release APK, cara menjalankan github workflows manual sampai actions/templates yang disediakan oleh GitHub. Dengan demikian kami bangga sudah bisa menyelesaikan aplikasi ini dengan realisasi 100% 😊.