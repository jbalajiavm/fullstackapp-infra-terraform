resource "aws_iam_policy" "app_policy" {
  name = var.app_policy_name
  path = "/"
  description = "APP policy for Secert Manager access"

  policy = jsonencode({
    Statement: [
        {
            "Action": [
                "ssm:DescribeParameters"
            ],
            "Effect": "Allow",
            "Resource": "*",
            "Sid": "TechSystemManagerDescParams"
        },
        {
            "Action": [
                "ssm:GetParameters",
                "ssm:GetParameter"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:ssm:ap-south-1:099730796456:parameter/visualpathtech*",
            "Sid": "TechSystemManagerGetParams"
        }
    ],
    Version: "2012-10-17"
  })
}