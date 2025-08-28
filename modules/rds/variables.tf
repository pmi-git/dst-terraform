variable "project_name" {
  description = "Nom du projet"
  type        = string
}

variable "db_username" {
  description = "Nom d'utilisateur de la base de données"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Mot de passe de la base de données"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Nom de la base de données"
  type        = string
  default     = "wordpress_db"
}

variable "db_subnet_ids" {
  description = "Liste des subnets privés pour le RDS"
  type        = list(string)
}

variable "vpc_security_group_ids" {
  description = "Security Groups autorisés à accéder au RDS"
  type        = list(string)
}
