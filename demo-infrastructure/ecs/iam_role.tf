resource "aws_iam_role" "ec2_role" {
  name = var.ec2_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid : "TrustEC2",
        Action : "sts:AssumeRole"
        Effect : "Allow"
        Principal : {
          Service = "ec2.amazonaws.com"
        },
      }
    ]
  })
}

resource "aws_iam_policy" "iam_policy" {
  name        = var.iam_policy_name
  description = var.iam_policy_description

  policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Effect : "Allow",
        Action : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogStreams"
        ],
        Resource : [
          "arn:aws:logs:*:*:*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_cloudwatch_logs_policy_attachment" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.iam_policy.arn
}

resource "aws_iam_role_policy_attachment" "ec2_container_service_policy_attachment" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_role_policy_attachment" "ec2_ssm_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = var.ec2_profile_name
  role = aws_iam_role.ec2_role.name
}
