resource "aws_sfn_state_machine" "test_step_function" {
  name     = "test_state_machine"
  role_arn = "${aws_iam_role.iam_for_lambda.arn}"

  definition = <<EOF
{
  "Comment": "An example of the Amazon States Language using an AWS Lambda Functions",
  "StartAt": "test",
  "States": {
    "test": {
      "Type": "Task",
      "Resource": "${aws_lambda_function.test.arn}",
      "Next": "SuccessState",
      "Catch": [
            {
               "ErrorEquals": ["any"],
               "Next": "FailState"
            }
         ]
    },
    "FailState": {
      "Type": "Fail"
    },
    "SuccessState": {
      "Type": "Succeed"
    }
  }
}
EOF
}
