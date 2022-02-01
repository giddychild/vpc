data "aws_iam_policy" "AmazonSSMManagedInstanceCore" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role" "EC2_SSM_Service_Role" {
  name = "EC2_SSM_Service_Role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "EC2_SSM_Policy_attachment" {
  name       = "EC2_SSM_Policy_attachment"
  roles      = [aws_iam_role.EC2_SSM_Service_Role.name]
  policy_arn = data.aws_iam_policy.AmazonSSMManagedInstanceCore.arn
}

resource "aws_iam_instance_profile" "EC2_SSM_profile" {
  name = "EC2_SSM_profile"
  role = aws_iam_role.EC2_SSM_Service_Role.name
}