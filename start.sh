#!/bin/bash

# decrpyt the file
smash -k $1 -n env > .env

# Source the .env file
source ./.env

# Use the environment variables
# echo "AWS Access Key ID: $AWS_ACCESS_KEY_ID"
# echo "AWS Secret Access Key: $AWS_SECRET_ACCESS_KEY"
# echo "AWS Region: $AWS_REGION"

rm .env

pulumi $2 $3 $4 $5 $6 $7 $8 $9