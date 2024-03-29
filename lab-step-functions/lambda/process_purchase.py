import json
import urllib
import boto3
import datetime

def handler(message, context):
    print("Received Message from Step Functions: ")
    print(message)

    response = {}
    response["TransactionType"] = message["TransactionType"]
    response["Timestamp"] = datetime.datetime.now().strftime("%Y-%m-%d %H-%M-%S")
    response["Message"] = "Hello from Lambda Function"

    return response

