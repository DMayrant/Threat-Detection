data "aws_vpc_endpoint_service" "execute_api" {
  service = "execute-api"
}

resource "aws_vpc_endpoint" "api_gateway_endpoint" {
  vpc_id              = aws_vpc.main_vpc.id
  service_name        = data.aws_vpc_endpoint_service.execute_api.service_name
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  subnet_ids          = aws_subnet.private_subnet.*.id 
  security_group_ids  = [aws_security_group.grafana_sg.id]
}

resource "aws_api_gateway_rest_api" "threat_detection_api" {
  name        = "Threat-Detection-API"
  description = "REST API"
  endpoint_configuration {
    types            = ["PRIVATE"]
    vpc_endpoint_ids = [aws_vpc_endpoint.api_gateway_endpoint.id]
    
  }
}