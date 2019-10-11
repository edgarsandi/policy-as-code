resource "aws_security_group" "web" {
  name        = "web"
  description = "The security for web instance"

  tags = {
    Name = "web"
  }
}

resource "aws_security_group_rule" "web_egress_any" {
  security_group_id = aws_security_group.web.id
  type              = "egress"
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 0
}

resource "aws_security_group_rule" "web_ingress_http" {
  security_group_id = aws_security_group.web.id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "web_ingress_https" {
  security_group_id = aws_security_group.web.id
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]  
}

resource "aws_security_group_rule" "web_ingress_ssh" {
  security_group_id = aws_security_group.web.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]  
}