# 🚀 Code-Server Auto Installer for Ubuntu

Skrip bash ini adalah *one-click installer* untuk memasang dan mengonfigurasi **[code-server](https://github.com/coder/code-server)** (VS Code di peramban/browser) secara otomatis, khususnya untuk Virtual Machine di Cloud seperti Microsoft Azure.

Skrip ini mengatasi masalah umum pada instalasi otomatis, seperti *error D-Bus* ketika dijalankan menggunakan *user* `root`, serta otomatis membuka akses jaringan agar IDE bisa langsung diakses dari luar.

## ✨ Fitur Utama

* **Satu Baris Perintah:** Instalasi selesai hanya dengan menjalankan satu baris perintah di terminal.
* **Interaktif:** Meminta Anda untuk memasukkan *password* kustom saat instalasi berjalan.
* **Smart Service Detection:** Otomatis mendeteksi apakah skrip dijalankan oleh `root` (menggunakan *system-wide service*) atau pengguna standar (menggunakan *user-level service*).
* **Auto-Bind:** Langsung mengatur IP `0.0.0.0` sehingga server siap diakses melalui IP Publik.

## ⚡ Cara Instalasi (One-Click)

Jalankan perintah berikut di terminal Ubuntu Anda:

```bash
curl -sL https://raw.githubusercontent.com/lxcoding06/vscode-auto/main/install-ide.sh | bash
