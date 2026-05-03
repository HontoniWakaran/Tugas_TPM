# 🍱 CaterSmart - Aplikasi Manajemen Katering
Tugas Akhir Mata Kuliah Teknologi Pemrograman Mobile (TPM)
UPN "Veteran" Yogyakarta

## 👥 Tim Pengembang
*   **Orang A (Backend & Core Logic):**
*   **Orang B (UI/UX & Hardware Sensors):**

---

## 📂 Struktur Folder Proyek (`/lib`)
Untuk menghindari *conflict* saat Git Push/Pull, mohon patuhi pembagian wilayah folder kerja di bawah ini:

### 🎨 Wilayah Orang B (Desain & Tampilan)
Tugas Orang B adalah membuat "Cangkang" aplikasi menggunakan data palsu (*dummy*).
*   📁 **`screens/`**: Tempat menaruh seluruh halaman utama (Halaman Login, Beranda, Keranjang, Halaman Profil/Saran Kesan).
*   📁 **`widgets/`**: Tempat menaruh komponen kecil yang dipakai berulang (Desain kartu menu makanan, tombol kustom, animasi).
*   **Target:** Semua halaman sudah bisa diklik dan punya efek transisi yang mulus, termasuk implementasi sensor *Gyroscope* (Parallax Profil) & *Accelerometer* (Kocok HP).

### 👨‍💻 Wilayah Orang A (Logika Data & Integrasi)
Tugas Orang A adalah menghidupkan UI dengan menyambungkannya ke Database XAMPP lokal dan Web Service.
*   📁 **`services/`**: Tempat menaruh *file* API (`api_service.dart`). Berisi fungsi HTTP untuk koneksi ke server lokal (Login, Pesan Katering) dan API Eksternal (Gemini AI, Frankfurter, WorldTime).
*   📁 **`models/`**: Tempat membuat *class* Dart untuk mengubah format data JSON dari API menjadi objek yang mudah dibaca Flutter.
*   📁 **`db/`** *(opsional)*: Tempat menaruh logika Hive/SQLite untuk *database* lokal (Keranjang Offline).
*   **Target:** Menyuntikkan data asli ke dalam tampilan buatan Orang B dan mengatur manajemen status pesanan.

### 🤝 Wilayah Bersama
*   📁 **`utils/`**: Tempat menaruh *file* pengaturan umum yang bisa dipakai berdua, seperti `constants.dart` (untuk palet warna utama dan *Base URL* server lokal).
*   📄 **`main.dart`**: File *root*. Jika ingin mengubah halaman awal, koordinasikan dengan teman sekelompok.

---

## 🚀 Aturan Git (Penting!)
1.  **SEBELUM** mulai *ngoding*, selalu jalankan: `git pull origin main`
2.  **SETELAH** selesai *ngoding*, jalankan urutan ini:
    *   `git add .`
    *   `git commit -m "Pesan penjelasan fitur yang ditambahkan"`
    *   `git push origin main`
3.  **Jangan pernah mengubah file di dalam folder milik teman!** Jika Orang A butuh file dari folder `screens` milik Orang B untuk diintegrasikan, beri tahu Orang B terlebih dahulu.