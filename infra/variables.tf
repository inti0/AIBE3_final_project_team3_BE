variable "region" {
  description = "region"
  default     = "ap-northeast-2"
}

variable "prefix" {
  description = "Prefix for all resources"
  default     = "team3"
}

variable "app_2_domain" {
  description = "staging server domain"
  default     = "staging.mixchat.inti0.shop"
}

variable "app_1_domain" {
  description = "production server domain"
  default     = "mixchat.inti0.shop"
}

variable "nickname" {
  description = "nickname"
  default     = "inti0"
}

variable "rds_instance_class" {
  description = "RDS instance class for production database"
  default     = "db.t3.micro"
}

variable "rds_allocated_storage" {
  description = "Allocated storage (GB) for the production RDS instance"
  default     = 20
}

variable "rds_backup_retention_period" {
  description = "Automated backup retention days for the production RDS instance"
  default     = 0
}

variable "rds_engine_version" {
  description = "MySQL engine version for RDS"
  default     = "8.0.43"
}

variable "rds_multi_az" {
  description = "Whether to enable Multi-AZ deployment for production RDS"
  type        = bool
  default     = false
}

variable "hosted_zone_domain" {
  description = "The root domain name of the Route53 hosted zone (e.g. yhcho.com). Used to lookup the hosted zone for app domains."
  default     = "mixchat.site"
}

variable "app_1_db_name" {
  description = "Initial database name for production RDS"
  type        = string
}

variable "app_1_db_username" {
  description = "Master username for production RDS"
  type        = string
}

variable "app_1_db_password" {
  description = "Master password for production RDS"
  type        = string
  sensitive   = true
}

variable "password_1" {
  description = "EC2 user password (temporary)"
}

variable "github_access_token_1_owner" {
  description = "GitHub username"
}

variable "github_access_token_1" {
  description = "GitHub access token"
}

variable "app_1_image" {
  description = "Production app container image (including tag). If empty, docker-compose default is used. Example: ghcr.io/inti0/mixchat:20260201-abc123"
  type        = string
  default     = ""
}
