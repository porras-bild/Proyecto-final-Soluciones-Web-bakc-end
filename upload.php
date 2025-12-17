<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_FILES['uploaded_file']) && $_FILES['uploaded_file']['error'] === UPLOAD_ERR_OK) {
        $fileTmpPath = $_FILES['uploaded_file']['tmp_name'];
        $fileName = basename($_FILES['uploaded_file']['name']);
        $uploadFolder = "uploads/";

        // Crear carpeta si no existe
        if (!is_dir($uploadFolder)) {
            mkdir($uploadFolder, 0755, true);
        }

        $destination = $uploadFolder . $fileName;

        if (move_uploaded_file($fileTmpPath, $destination)) {
            echo "Archivo subido: " . htmlspecialchars($fileName, ENT_QUOTES, 'UTF-8');
        } else {
            echo "Error al mover el archivo cargado.";
        }
    } else {
        echo " Ocurrió un error en la subida o no se envió archivo.";
    }
}
?>