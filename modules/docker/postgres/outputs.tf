output "port" {
  value = docker_container.pg.ports[0].external
}