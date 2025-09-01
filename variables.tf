variable "project_name" {
  description = "Nom du projet (préfixe des ressources)"
  type        = string
  default     = "dst-wordpress"
}

variable "db_username" {
  description = "Nom d'utilisateur de la base de données"
  type        = string
}

variable "db_password" {
  description = "Mot de passe de la base de données"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Nom de la base de données"
  type        = string
}
