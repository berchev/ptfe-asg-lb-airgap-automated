#! /bin/bash

set -x 
pushd /opt/tfe-installer/
pwd | tee /tmp/pwd.log

sudo mkdir -p /opt/tfe-installer/

ls -al /opt/tfe-installer/ | tee /tmp/before_start_ls.log

sudo aws s3 cp s3://${location_path}${tfe_package} /opt/tfe-installer/ | tee /tmp/get_tfe_package.log

sudo aws s3 cp s3://${location_path}${bootstrap_installer} /opt/tfe-installer/ | tee /tmp/get_replicated.log

ls -al /opt/tfe-installer/ | tee /tmp/aftercopy_from_bucket_ls.log

sudo tar -zvx --overwrite -f /opt/tfe-installer/${bootstrap_installer} -C /opt/tfe-installer/ | tee /tmp/tar.log

ls -al /opt/tfe-installer/ | tee /tmp/ls.log
echo sudo bash -x /opt/tfe-installer/install.sh airgap no-proxy private-address=$(curl -sL http://169.254.169.254/latest/meta-data/local-ipv4) public-address=$(curl -sL http://169.254.169.254/latest/meta-data/local-ipv4) | tee /tmp/echo.log
sudo bash -x /opt/tfe-installer/install.sh airgap no-proxy private-address=$(curl -sL http://169.254.169.254/latest/meta-data/local-ipv4) public-address=$(curl -sL http://169.254.169.254/latest/meta-data/local-ipv4) 2>&1 | tee /tmp/install.log

sleep 120
sudo service replicated restart | tee /tmp/replicated_restart.log
sudo service replicated-ui restart | /tmp/replicated_ui_restart.log
sudo service replicated-operator restart | /tmp/replicated_operator_restart.log
sleep 60
sudo replicated apps list | tee /tmp/replicated_apps_list.log
sudo replicated app $(replicated apps list | grep "Terraform Enterprise" | awk {'print $1'}) start