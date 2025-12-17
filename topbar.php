<!-- Topbar -->
<?php
session_start();
?>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm">
  <div class="container-fluid">
    <!-- Logo y nombre -->
    <a class="navbar-brand d-flex align-items-center" href="/PROYECTO FINAL3/index.php">
      <img src="/PROYECTO FINAL3/uploads/logo_pet_shop.png" alt="Logo" width="60" height="60" class="me-2">
      <span class="fs-3 fw-bold">Pet's World</span>
    </a>

    <!-- Botón responsive -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menuTopbar">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Menú -->
    <div class="collapse navbar-collapse" id="menuTopbar">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link fs-5" href="/PROYECTO FINAL3/carrito/carrito_view.php">
            <i class="fas fa-shopping-cart me-1"></i> Carrito
          </a>
        </li>

        <?php if (isset($_SESSION["usuario_id"])): ?>
          <!-- Si está logueado -->
          <li class="nav-item">
            <a class="nav-link fs-5" href="/PROYECTO FINAL3/login/logout.php">
              <i class="fas fa-sign-out-alt me-1"></i> Cerrar sesión
            </a>
          </li>
        <?php else: ?>
          <!-- Si NO está logueado -->
          <li class="nav-item">
            <a class="nav-link fs-5" href="/PROYECTO FINAL3/login/login.php">
              <i class="fas fa-user me-1"></i> Ingresar
            </a>
          </li>
        <?php endif; ?>

      </ul>
    </div>
  </div>
</nav>
<!-- End of Topbar -->