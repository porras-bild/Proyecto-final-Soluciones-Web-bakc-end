<footer class="bg-dark text-white pt-4 mt-auto">
  <div class="container">
    <div class="row">
      <!-- Sección de contacto -->
      <div class="col-md-4 mb-3">
        <h5>Contacto</h5>
        <p><i class="bi bi-telephone"></i> +51 903 140 323</p>
        <p><i class="bi bi-envelope"></i> contacto@petsworld.com</p>
        <p><i class="bi bi-geo-alt"></i> Av. Ramón Vargas Machuca 320, Lima 15801</p>

        <!-- FORMULARIO FUNCIONAL -->
       <form action="enviar.php" method="POST">
  <div class="mb-3">
    <label for="email" class="form-label">Correo electrónico</label>
    <input type="email" class="form-control" id="email" name="email" placeholder="tuemail@ejemplo.com" required>
  </div>

  <div class="mb-3">
    <label for="mensaje" class="form-label">Mensaje</label>
    <textarea class="form-control" id="mensaje" name="mensaje" rows="3" placeholder="Escribe tu mensaje aquí" required></textarea>
  </div>

  <button type="submit" class="btn btn-primary">Enviar</button>
</form>
      </div>

      <div class="col-md-4 mb-3 text-center">
        <h5>Síguenos en redes</h5>
        <a href="https://www.youtube.com" target="_blank" class="text-white me-3">
          <i class="bi bi-youtube" style="font-size: 2rem;"></i>
        </a>
        <a href="https://www.facebook.com" target="_blank" class="text-white me-3">
          <i class="bi bi-facebook" style="font-size: 2rem;"></i>
        </a>
        <a href="https://www.instagram.com" target="_blank" class="text-white">
          <i class="bi bi-instagram" style="font-size: 2rem;"></i>
        </a>
      </div>

      <div class="col-md-4 mb-3">
        <h5>Ubícanos</h5>
        <iframe 
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3900.2180449575003!2d-76.97704308859896!3d-12.165553244075694!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105b851de5dffc1%3A0xa7c420906cc5e7f8!2sIESTP%20Gilda%20Liliana%20Ballivian%20Rosado!5e0!3m2!1ses-419!2spe!4v1765330509942!5m2!1ses-419!2spe"
          width="500" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
        </iframe>
      </div>
    </div>
  </div>



    <div class="row">
      <div class="col text-center mt-3">
        <p class="mb-0">&copy; <?php echo date("Y"); ?> Pet's World. Todos los derechos reservados.</p>
      </div>
    </div>
  </div>
</footer>

<!-- Bootstrap y Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
