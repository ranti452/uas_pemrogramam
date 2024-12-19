<?php
session_start();

// Periksa apakah pengguna sudah login dan apakah mereka memiliki peran 'admin'
if (!isset($_SESSION['role']) || $_SESSION['role'] != 'Admin') {
    header("Location: /login.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Admin</title>
</head>
<body>

    <h1>Selamat datang, Admin!</h1>
    <p>Ini adalah halaman dashboard admin. Anda dapat mengelola semua data di sini.</p>
    
    <ul>
        <li><a href="data_seminar.php">Kelola Seminar</a></li>
        <li><a href="data_peserta.php">Kelola Peserta</a></li>
        <li><a href="Laporan.php">Laporan</a></li>
        <li><a href="logout.php">Logout</a></li>
        

    </ul>

</body>
</html>