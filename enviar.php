<?php
$correo = $_POST['email'];
$mensaje = $_POST['mensaje'];

$destino = "porras.maria.ci.00@iestpgildaballivian.edu.pe";
$asunto = "Nuevo mensaje desde tu formulario";

$contenido = "Correo: $correo\nMensaje:\n$mensaje";

mail($destino, $asunto, $contenido);

header("Location:index.php");
?>