variable "project_name" {
  description = "Nom du projet (préfixe des ressources)"
  type        = string
}

variable "subnet_id" {
  description = "ID de la subnet publique"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "Liste des security groups à attacher"
  type        = list(string)
}

variable "db_name" {
  type        = string
  description = "Nom de la base de données WordPress"
}

variable "db_username" {
  type        = string
  description = "Utilisateur de la base de données"
}

variable "db_password" {
  type        = string
  description = "Mot de passe de la base de données"
  sensitive   = true
}

variable "db_host" {
  type        = string
  description = "Endpoint RDS"
}
