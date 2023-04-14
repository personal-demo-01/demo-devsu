#!/bin/bash

# Environment
ENV=$1

# Init terraform project
echo "*** Command: terraform init"
terraform init

# Choose environment
echo "*** Command: terraform workspace select $ENV"
terraform workspace select $ENV

# Update modules
echo "*** Command: terraform get -update"
terraform get -update

# Check terraform config files
echo "*** Command: terraform plan"
terraform plan \
    -var-file="values-$ENV.tfvars"

# Apply changes
echo "*** Command: terraform apply -auto-approve"
terraform apply \
    -var-file=values-$ENV.tfvars \
    -auto-approve
