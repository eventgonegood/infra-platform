#Install the AWS CLI

```
brew install awscli

#verify it installed
aws help

#set it up
aws configure
```
For more detailed information see the [AWS Documentation](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-config-files).

This will ask you for your Access Key and your Secret Access Key. You can get those from Dru at this point. This will store the data in the `~/.aws` directory.

You will also need to configure the `terraform.tfvars` with this same data. This file is ignored in `.gitignore` and **should not be checked in**. For the needed format check the [Terraform Docs](https://terraform.io/intro/getting-started/variables.html).

#Amazon
Access Key: Your username
Secret Access Key: Your password

##Default Region
`us-west-2`: Oregon - I basically feel like all of the new stuff goes into virginia and that is the area that I think is the buggiest of the AWS. No real data on this just my gut.

##Default Infrastructure Admin
Make sure you are assigned the IAM group `infra-admin`
