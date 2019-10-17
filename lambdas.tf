data "archive_file" "functions" {
  type = "zip"
  output_path = "dist/functions.zip"
  source_dir = "src/functions/"
}

resource "aws_lambda_function" "test" {
  filename      = "dist/functions.zip"
  function_name    = "test"
  role             = "${aws_iam_role.iam_for_lambda.arn}"
  handler       = "testFunction/testFunction.handler"
  runtime          = "nodejs10.x"
  depends_on = ["data.archive_file.functions"]
}
