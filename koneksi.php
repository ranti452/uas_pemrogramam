<?php
// Konfigurasi Koneksi ke Database
$host = "localhost";      // Ganti jika menggunakan server selain localhost
$user = "root";           // Username MySQL Anda
$pass = "";    // Password MySQL Anda
$dbname = "db_seminar_online";  // Nama Database Anda

// Membuat Koneksi ke Database
$conn = mysqli_connect($host, $user, $pass, $dbname);

// Cek Koneksi
if (!$conn) {
    die("Koneksi database gagal: " . mysqli_connect_error());
}
?>