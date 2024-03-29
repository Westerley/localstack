resource "aws_sfn_state_machine" "sfn_state_machine" {
  name     = "TransactionProcessorStateMachine"
  role_arn = aws_iam_role.StateMachineRole.arn
  definition = templatefile("./statemachine/statemachine.asl.json", {
    web_process_purchase = aws_lambda_function.process_purchase.arn,
    web_process_refund  = aws_lambda_function.process_refund.arn
    }
  )
}