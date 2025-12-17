<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>PetShop - Tienda de Mascotas</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="estilo.css">
</head>
<body>

<?php
include "conexion.php";
$conexion = conexion();
$consulta = "SELECT * FROM productos WHERE stock > 0";
$resultado = $conexion->query($consulta);
?>
 <?php include 'topbar.php'; ?>
<!-- Contenido principal -->
<div class="container mt-5">
  <div class="jumbotron text-center bg-light p-5 rounded jumbotron-petshop">
    <h1 class="display-4">Bienvenido a Pet's World</h1>
    <p class="lead">Todo lo que tu mascota necesita, en un solo lugar.</p>

    <!-- Imagen gato -->
    <img src="uploads/gato1.png" alt="Gato" class="pet-img pet-img-left">

    <!-- Imagen perro -->
    <img src="uploads/perro1.png" alt="Perro" class="pet-img pet-img-right">
  </div>
</div>

<div class="container py-5">
  <h2 class="text-center mb-4">Productos para tu mascota</h2>
  <div class="row row-cols-1 row-cols-md-4 g-4">

    <?php while ($producto = $resultado->fetch_assoc()): ?>
      <div class="col">
        <div class="card h-100 shadow-sm">
        <div class="ratio ratio-1x1">
       <img src="uploads/<?= htmlspecialchars($producto['imagen'] ?: 'no-image.jpg') ?>"
     class="img-fluid rounded"
     style="object-fit: cover; width: 100%; height: 100%;"
     alt="<?= htmlspecialchars($producto['nombre']) ?>">
        </div>
          <div class="card-body d-flex flex-column">
            <h5 class="card-title"><?= htmlspecialchars($producto['nombre']) ?></h5>
            <p class="card-text"><?= htmlspecialchars($producto['descripcion']) ?></p>
            <ul class="list-unstyled">
              <li><strong>Disponibles:</strong> <?= $producto['stock'] ?> unidades</li>
              <li><strong>Precio:</strong> S/ <?= number_format($producto['precio'], 2) ?></li>
            </ul>
            <!-- Formulario AJAX -->
            <form  class="mt-auto" onsubmit="agregarAlCarrito(event, <?= $producto['id_productos'] ?>)">
              <div class="mb-2">
                <label for="cantidad<?= $producto['id_productos'] ?>" class="form-label">Cantidad:</label>
                <input type="number" class="form-control" id="cantidad<?= $producto['id_productos'] ?>" name="cantidad" min="1" max="<?= $producto['stock'] ?>" value="1">
              </div>
              <button type="submit" class="btn btn-primary w-100">Agregar al carrito</button>
            </form>
          </div>
        </div>
      </div>
    <?php endwhile; ?>
  </div>
</div>

<!--Footer-->
 <?php include 'footer.php'; ?>

<!-- Contenedor flotante para mensajes -->
<div id="mensajeCarrito"
     style="position: fixed; bottom: 20px; right: 20px;
            min-width: 250px; z-index: 9999;"
     class="d-none"></div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
function agregarAlCarrito(event, productoId) {
  event.preventDefault();
  const cantidadInput = event.target.querySelector('input[name="cantidad"]');
  const cantidad = cantidadInput.value;

  fetch('carrito/carrito.php', {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: new URLSearchParams({
      producto_id: productoId,
      cantidad: cantidad
    })
  })
  .then(response => response.json())
  .then(data => {
    const mensaje = document.getElementById("mensajeCarrito");
    mensaje.textContent = data.message;
    mensaje.className = `alert ${data.status === 'ok' ? 'alert-success' : 'alert-danger'} text-center`;
    mensaje.classList.remove("d-none");

    // Ocultar después de 3 segundos
    setTimeout(() => mensaje.classList.add("d-none"), 3000);
  });
}
</script>
</body>
</html>
<?php $conexion->close(); ?>