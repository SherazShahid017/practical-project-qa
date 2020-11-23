variable "ec2sub" {
    description = "Pulling subnet ID from VPC"
}

variable "secID" {
    description = "Pulling security group id from VPC"
}

variable "pub-key" {
    
}

variable "scripts" {
    description = "Pulling path to script from main.tf"
    default = ""
}