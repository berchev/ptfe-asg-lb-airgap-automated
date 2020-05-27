# ptfe-asg-lb-airgap-automated
Automated installation of TFE in Airgap mode using valid certificates

## Description
Тerraform Еnterprise have 2 modes of install, online and airgap. Airgap is used when we need to deploy our software on restricted internet or when we want to consume local assets to avoid drift.


The repo is just an example how to perform TFE version 4 airgap installation with valid certificate into AWS Cloud.

Following [immutable](https://www.hashicorp.com/resources/what-is-mutable-vs-immutable-infrastructure) infrastructure principles, we will 
- build custom ec2 image with packer, which fullfil all [TFE requirements](https://www.terraform.io/docs/enterprise/before-installing/index.html).
- use Terraform OSS and AWS to prepare the needed environment and the TFE Airgap installation itself

The Airgap installation will be performed by simple bash script, right after TFE instance provisioning.

The [TFE Airgap installer script](scripts/bootstrap.sh) will do following:
- download Airgap package from s3 Assets bucket to /opt/tfe-installer directory of the ec2 instance
- download replicated tar, which is actually the bootstrap installer for TFE, into /opt/tfe-installer directory
- extract replicated tar
- running the install script with all needed arguments


By changing variables only, you can perform your own installation based on this one. 

More details about the AWS environment itself, can be found into **Environment diagram** section down below

## Environment diagram
![](https://github.com/berchev/ptfe-asg-lb-airgap-automated/blob/master/diagram/AWS-LB-ASG__4__png.png)

## Repo Content
| File                   | Description                      |
|         ---            |                ---               |
| [modules/asg](modules/asg)| Terraform code for TFE Auto Scaling Group module|
| [modules/db](modules/db) | Terraform code for Postgres database module |
| [modules/lb](modules/lb) | Terraform code for Network Load Balancer module |
| [modules/r53](modules/r53) | Terraform code for Route 53 module|
| [modules/s3](modules/s3)| Terraform code for S3 Bucket module|
| [modules/vpc](modules/vpc)| Terraform code for VPC module |
| [packer](packer)| Packer code and confuguration needed for building appropriate for TFE ec2 image  |
| [scripts/bootstrap.sh](scripts/bootstrap.sh)| TFE installer script|
| [scripts/replicated.conf.tpl](scripts/replicated.conf.tpl)| Replicated configuration file passed like a template, populated with needed variables|
|[scripts/settings.json.tpl](scripts/settings.json.tpl)| TFE settings passed like a template, populated with needed variables|
|[asg.tf](asg.tf)| Terraform code that calls asg module |
|[db.tf](db.tf)| Terraform code that calls db module |
|[lb.tf](lb.tf)| Terraform code that calls lb module |
|[provider_aws.tf](provider_aws.tf)| Terraform provider file that includes the cloud provider only |
|[r53.tf](r53.tf)| Terraform code that calls r53 module |
|[s3.tf](s3.tf)| Terraform code that calls s3 module |
|[terraform.tfvars](terraform.tfvars)| Example of terraform.tfvars file |
|[terraform_version.tf](terraform_version.tf)| This file specify preffered Terraform and Providers version |
|[variables.tf](variables.tf)| Terraform variables file |
|[vpc.tf](vpc.tf)| Terraform code that calls vpc module |


## Requirements for this project
- AWS Account
- Your own Domain (I am using one from AWS)
- Valid SSL sertificate 
- TFE license (you can get one reaching Hashicorp Sales Team)
- Airgap package with desired TFE version
- [Installer bootstraper](https://install.terraform.io/airgap/latest.tar.gz)
- Packer installed
- Terraform OSS version 0.12.X installed

## Initial setup (Preparing for *terrafom apply* command)
- Part I - AWS Console 
  - Go to [AWS Console](https://aws.amazon.com/)
  - Create S3 Assets bucket manually. More info [here](https://docs.aws.amazon.com/AmazonS3/latest/user-guide/create-bucket.html)
  - Upload `Airgap package with desired TFE version` and `Installer bootstraper`(replicated.tar) into the newly created bucket

- Part II - Packer
  - clone this repository locally
  ```
  git clone https://github.com/berchev/ptfe-asg-lb-airgap-automated.git
  ```
  - change to packer directory
  ```
  cd ptfe-asg-lb-airgap-automated/packer
  ```
  - review variables section of packer json file [packer/ubuntu_docker_ce_ami.json](packer/ubuntu_docker_ce_ami.json) and change the region, ami name or the ami itself if needed.
  - into [packer/assets](packer/assets) directory add your SSL certificates and TFE license
  - export your AWS access and secret key 
  ```
  export AWS_ACCESS_KEY_ID="XXXXXXXXXXXXXXXXXXX"
  export AWS_SECRET_ACCESS_KEY="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  ```
  - build the ec2 image using following command  
  ```
  packer build ubuntu_docker_ce_ami.json
  ```
## Provisioning TFE environment
- after finishing `Initial setup` section successfully, you are ready for Terraform part
- make sure you are on the root directory on the repo. (where asg.tf, db.tf, lb.tf, r53.tf, s3.tf and vpc.tf are located)
- review the example of [terraform.tfvars](terraform.tfvars) file and chnage some of the values according to your needs
- install all needed Terraform providers
```
terraform init
```
- check which resources terraform is going to create
```
terraform plan -var 'access_key=YOUR_AWS_ACCESS_KEY' -var 'secret_key=YOUR_AWS_SECURITY_KEY'
```
- if no errors occurs, and you are satisfied with the result, apply the changes
```
terraform apply -var 'access_key=YOUR_AWS_ACCESS_KEY' -var 'secret_key=YOUR_AWS_SECURITY_KEY' --auto-approve
```
- once terraform finish, you will see an output very similar to this one:
```
TF OUTPUT
```
- right after that, the automated installation begin. Ordinary it will take between 40 and 60 min minutes.
- after that time you can try to reach the dashboard on url: `http://your_tfe_fqdn:8800`. It should look like this:
![](https://github.com/berchev/ptfe-asg-lb-airgap-automated/blob/master/screens/20.png)

- if everything looks good, you can visit `https://your_tfe_fqdn`. It should look like this:
![](https://github.com/berchev/ptfe-asg-lb-airgap-automated/blob/master/screens/21.png)
