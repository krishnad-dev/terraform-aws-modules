output "vpc_id" {
  description = "ID of the VPC."
  value       = aws_vpc.this.id
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC."
  value       = aws_vpc.this.cidr_block
}

output "public_subnet_ids" {
  description = "IDs of the public subnets (one per AZ)."
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs of the private subnets (one per AZ)."
  value       = aws_subnet.private[*].id
}

output "private_route_table_ids" {
  description = "IDs of the private route tables."
  value       = aws_route_table.private[*].id
}

output "nat_gateway_public_ips" {
  description = "Public IPs of the NAT gateways (useful for partner allow-lists)."
  value       = aws_eip.nat[*].public_ip
}
