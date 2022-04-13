# custome aws vpc

for create your own vpc: 
## step1: first clone the repository
```
git clone https://github.com/anjanpaul/terraform-vpc-custome-module.git

```

## step 2: go to root directory folder and if you want to change your cidr then change from terraform.tfvars file. you can change your availability zone from here.

## step 3: from root folder run this command:
```
terraform init

```

## step 4: for validate your configuration run this command:
```
terraform plan

```
## step 5: For apply
```
terraform apply

```
and your resource will be created on your defiend region