resource "docker_container" "bd" {
  name  = "bd-${terraform.workspace}"
  image = "lab/bd"

  env = [
    "POSTGRES_PASSWORD=secret", 
    "POSTGRES_USER=postgres",
    "POSTGRES_DB=${terraform.workspace}db"
  ]

  ports {
    internal = 5432
    external = var.db_port[terraform.workspace]
  }
}