# TODO: data?
resource "docker_image" "pg" {
  name = "postgres:${var.tag}"
}


resource "docker_container" "pg" {
  image = docker_image.pg.image_id
  name  = "postgres-module-pg-${var.name}"
  ports {
    internal = 5432
    external = var.port
  }
  env = [
    "POSTGRES_USER=${var.username}",
    "POSTGRES_PASSWORD=${var.password}",
    "POSTGRES_DB=${var.database}"
  ]
  restart = "unless-stopped"
}

resource "docker_container" "pgadmin" {
  image = "dpage/pgadmin4"
  count = var.enable_pgadmin ? 1 : 0
  name  = "postgres-module-pgadmin-${var.name}"
  ports {
    internal = 80
    # TODO: make this configurable
    external = 8080
  }
  env = [
    "PGADMIN_DEFAULT_EMAIL=${var.username}",
    "PGADMIN_DEFAULT_PASSWORD=${var.password}"
  ]
  restart = "unless-stopped"
  depends_on = [
    docker_container.pg
  ]
}