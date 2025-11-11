resource "aws_subnet" "db_subnet" {
  count             = length(var.aurora_subnet_cidrs)
  availability_zone = var.availability_zones[count.index % length(var.availability_zones)]
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.aurora_subnet_cidrs[count.index]

}

resource "aws_db_subnet_group" "aurora_subnet_group" {
  name       = "aurora-db-subnet-group"
  description = "Subnet group for Aurora PostgreSQL cluster"

  subnet_ids = aws_subnet.db_subnet[*].id

  
}