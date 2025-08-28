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
