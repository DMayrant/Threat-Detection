resource "aws_security_group" "grafana_sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main_vpc.id

 tags = merge(local.common_tags, {
    Name = "Grafana-SG"
  })
}

resource "aws_vpc_security_group_ingress_rule" "grafana" {
  security_group_id = aws_security_group.grafana_sg.id
  cidr_ipv4         = aws_vpc.main_vpc.cidr_block
  from_port         = 3000
  ip_protocol       = "tcp"
  to_port           = 3000
  description       = "Allow internal Grafana API traffic"
}

resource "aws_vpc_security_group_ingress_rule" "https_traffic" {
  security_group_id = aws_security_group.grafana_sg.id
  cidr_ipv4         = aws_vpc.main_vpc.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "http_traffic" {
  security_group_id = aws_security_group.grafana_sg.id
  cidr_ipv4         = aws_vpc.main_vpc.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}


resource "aws_security_group" "alb_sg" {
  name        = "alb_security_group"
  description = "Security group for the load balancer"
  vpc_id      = aws_vpc.main_vpc.id

  tags = merge(local.common_tags, {
    Name = "ALB-Aurora-SG"
  })

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main_vpc.cidr_block]
  }
  
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main_vpc.cidr_block]
  

  }
}