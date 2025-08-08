resource "aws_iam_role" "instance-role" {
  name = "${var.name}-instance-role-${var.region}"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY

  tags = {
    "Name" = var.name
  }

}

resource "aws_iam_role_policy_attachment" "instance-role-ssm" {
  policy_arn = data.aws_iam_policy.aws-ssm-managed_instance-core.arn
  role       = aws_iam_role.instance-role.name
}


resource "aws_iam_instance_profile" "instance-profile" {
  name = "${var.name}-instance-profile-${var.region}"
  role = aws_iam_role.instance-role.name
}

