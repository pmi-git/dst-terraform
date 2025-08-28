# dst-terraform

Déploiement automatisé d'une infrastructure complète WordPress sur AWS via Terraform.

## Architecture

Ce projet déploie :

- Un VPC avec sous-réseaux publics et privés
- Une instance EC2 (Ubuntu 22.04) hébergeant WordPress
- Une base de données RDS (MySQL, multi-AZ)
- Un volume EBS supplémentaire pour persistance
- Des groupes de sécurité pour EC2 et RDS

## Structure du projet

```bash
dst-terraform/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars.template # ➜ à copier en terraform.tfvars (non versionné)
├── install_wordpress.sh
└── modules/
├── networking/
├── ec2/
├── rds/
└── ebs/
```


## Utilisation

### 1. Préparer les credentials AWS

```bash
export AWS_ACCESS_KEY_ID="..."
export AWS_SECRET_ACCESS_KEY="..."
```

### 2. Copier le fichier de configuration

```bash
cp terraform.tfvars.template terraform.tfvars
# puis modifier les valeurs sensibles dans terraform.tfvars
```

### 3. Initialiser et déployer

```bash
terraform init
terraform plan
terraform apply
```

### 4. Accéder à WordPress

L'URL publique sera affichée à la fin de l'exécution (output "ec2_public_ip").

### 5. Pour tout détruire

```bash
terraform destroy
```
