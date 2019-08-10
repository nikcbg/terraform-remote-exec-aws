# terraform-remote-exec-aws

### Purpose of the repsoitory
- This is an example of Terraform configuration code that creates EC2 instance in AWS and then executes a bash script on the EC2 instance from a local machine. The bash script should display "Hello World" if execution is successful.

### List of files in the respository.
- main.tf - file with terraform configuration code.
- hello.sh - bash script that displays "Hello World".

### How to use this repository
- Install `terraform` by following this [instructions](https://www.terraform.io/intro/getting-started/install.html).
- Clone the repository to your local computer: `git clone https://github.com/nikcbg/terraform-remote-exec-aws`.
- Go into the cloned repo on your computer: `cd terraform-remote-exec-aws`.

### Note: NEVER make your any credentials publicly available so you can prevent your account from been compromised.
- To be able to authenticate to your AWS account without compromising your credentials you need to use environment variables.
- You need to get your secret access and access keys form your AWS account, you can follow this [instructions](https://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html)
- Execute `export AWS_ACCESS_KEY_ID=your_access_key_here` 
- Execute `export AWS_SECRET_ACCESS_KEY=your_secret_access_key_here` 
- You will need a Key Pair from your AWS account to be able to authenticate from your local machine to your AWS account.
- Follow this [instructions](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html) on how to create a Key Pair.

### Commands needed to execute Terraform code.
Command execution	| Command outcome
------------------|----------------
terraform init	| to initialize the working directory
terraform plan	| to create execution plan for changes to be applied.
terraform apply	| to apply the desired changes.
terraform destroy | to destroy the infrastructure that was created.
   



