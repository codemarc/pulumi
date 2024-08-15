# Using Pulumi with AWS and Nodejs

## AWS environment vars

In order to use AWS, you need to set up your AWS credentials. We use the npm package @codemarc/smashdata to decode our encrypted credentials set them in the environment and run pulumi commands. you can setup your own env.bin file with the following:

### env.bin
```bash
# create the env.bin file
echo export AWS_ACCESS_KEY_ID=XXXXXX > env
echo export AWS_SECRET_ACCESS_KEY=YYYYYY >> env
echo export AWS_REGION=ZZZZZZ >> env

smash -k xxxsuper_secret_keyxxx env
cat env.bin bc22628c322a00dc81a10764af2f1b15::3a1e8740f96170a36c3036f317e89705...

#check the env.bin file
smash -k xxxsuper_secret_keyxxx -n env

export AWS_ACCESS_KEY_ID=XXXXXX
export AWS_SECRET_ACCESS_KEY=YYYYYY
export AWS_REGION=ZZZZZZ
```
### setup.sh

```bash
#!/bin/bash
# decrpyt the file
smash -k $1 -n env > .env
# Source the .env file
source ./.env
#remove the .env file
rm .env

pulumi $2 $3 $4 $5 $6 $7 $8 $9
```


## PulumiAccess Permissions Policy
You must make sure the user that you run under has permission to access the
resources that you are trying to create.

```json
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Effect": "Allow",
			"Action": [
				"cloudformation:CreateResource",
				"cloudformation:GetResourceRequestStatus",
				"cloudformation:GetResource",
				"cloudformation:DeleteResource"
			],
			"Resource": "*"
		}
	]
}
```