#!/bin/bash

# Pastikan script berhenti jika ada error
set -e

echo "=========================================="
echo "  🚀 Menyiapkan Auto-Installer VS Code"
echo "=========================================="

# 1. Meminta input password dari user saat instalasi
read -p "Masukkan password yang ingin digunakan untuk IDE: " IDE_PASSWORD

echo ""
echo "[1/4] Mengunduh dan menginstall code-server..."
curl -fsSL https://code-server.dev/install.sh | sh

echo "[2/4] Membuat folder konfigurasi..."
mkdir -p ~/.config/code-server

echo "[3/4] Menginjeksi file konfigurasi..."
# Menulis langsung ke file config.yaml
cat <<EOF > ~/.config/code-server/config.yaml
bind-addr: 0.0.0.0:8080
auth: password
password: $IDE_PASSWORD
cert: false
EOF

echo "[4/4] Mengaktifkan dan menjalankan background service..."
# Cek apakah user adalah root. Jika ya, gunakan system-wide service.
# Jika bukan, gunakan user-level service.
if [ "$EUID" -eq 0 ]; then
  systemctl enable --now code-server@root
else
  sudo loginctl enable-linger $USER
  systemctl --user enable --now code-server
fi

# Mengambil IP Publik Server secara otomatis
PUBLIC_IP=$(curl -s ifconfig.me)

echo ""
echo "=========================================="
echo "  ✅ Instalasi Selesai!"
echo "=========================================="
echo "Buka browser Anda dan kunjungi:"
echo "👉 http://$PUBLIC_IP:8080"
echo ""
echo "Password Anda: $IDE_PASSWORD"
echo "=========================================="
