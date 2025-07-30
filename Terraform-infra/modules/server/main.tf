# resource "aws_iam_role" "cw_agent_role" {
#   name = "CloudWatchAgentRole"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [{
#       Action = "sts:AssumeRole",
#       Effect = "Allow",
#       Principal = {
#         Service = "ec2.amazonaws.com"
#       }
#     }]
#   })
# }

# resource "aws_iam_role_policy_attachment" "cw_attach" {
#   role       = aws_iam_role.cw_agent_role.name
#   policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
# }

# resource "aws_iam_instance_profile" "cw_instance_profile" {
#   name = "CloudWatchInstanceProfile"
#   role = aws_iam_role.cw_agent_role.name
# }
################################################################################################
# resource "aws_key_pair" "jenkins-key" {
#   key_name   = "my-jenkins-key"
#   public_key = file("my-jenkins-key.pub")  
# }

resource "aws_instance" "ec2_master" {
  ami                         = "ami-053b0d53c279acc90"
  instance_type               = "t3.medium"
  subnet_id                   = var.subnet_id_1
  vpc_security_group_ids      = [aws_security_group.master_sg.id]
  key_name                    = "my-jenkins-key"  # الربط بالـ Key Pair
  # iam_instance_profile        = aws_iam_instance_profile.cw_instance_profile.name
  root_block_device {
    volume_size = 20  # تغيير المساحة لـ 20 جيجا بدلاً من 8 جيجا
    volume_type = "gp2"  
  }

  tags = {
    Name = "k8s-master"
  }
}

resource "aws_instance" "ec2_node1" {
  ami                         = "ami-053b0d53c279acc90"
  instance_type               = "t3.medium"
  subnet_id                   = var.subnet_id_2
  vpc_security_group_ids      = [aws_security_group.worker_sg.id]
  key_name                    = "my-jenkins-key"
  # iam_instance_profile        = aws_iam_instance_profile.cw_instance_profile.name
  root_block_device {
    volume_size = 20  # تغيير المساحة لـ 20 جيجا بدلاً من 8 جيجا
    volume_type = "gp2"  
  }

  tags = {
    Name = "k8s-node-1"
  }
}

resource "aws_instance" "ec2_node2" {
  ami                         = "ami-053b0d53c279acc90"
  instance_type               = "t3.medium"
  subnet_id                   = var.subnet_id_3
  vpc_security_group_ids      = [aws_security_group.worker_sg.id]
  key_name                    = "my-jenkins-key"
  # iam_instance_profile        = aws_iam_instance_profile.cw_instance_profile.name
  root_block_device {
    volume_size = 20  # تغيير المساحة لـ 20 جيجا بدلاً من 8 جيجا
    volume_type = "gp2"  
  }
  
  tags = {
    Name = "k8s-node-2"
  }
}
