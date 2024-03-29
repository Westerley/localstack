resource "aws_lambda_function" "process_purchase" {
  function_name    = "${var.prefix}_process_purchase"
  filename         = "../lambda/process_purchase.zip"
  handler          = "process_purchase.handler"
  role             = aws_iam_role.lambda.arn
  runtime          = "python3.9"
  source_code_hash = filebase64sha256("../lambda/process_purchase.zip")
  description      = ""
  environment {
    variables = {
      name_cluster = "${var.prefix}-cluster"
    }
  }
  tags = local.common_tags
}

resource "aws_lambda_function" "process_refund" {
  function_name    = "${var.prefix}_process_refund"
  filename         = "../lambda/process_refund.zip"
  handler          = "process_refund.handler"
  role             = aws_iam_role.lambda.arn
  runtime          = "python3.9"
  source_code_hash = filebase64sha256("../lambda/process_refund.zip")
  description      = ""
  environment {
    variables = {
      name_cluster = "${var.prefix}-cluster"
    }
  }
  tags = local.common_tags
}