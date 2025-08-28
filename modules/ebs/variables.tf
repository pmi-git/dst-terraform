variable "project_name" {
  description = "Nom du projet"
  type        = string
}

variable "instance_id" {
  description = "ID de l'instance EC2 à laquelle attacher le volume"
  type        = string
}

variable "az" {
  description = "Availability Zone dans laquelle créer le volume"
  type        = string
}
