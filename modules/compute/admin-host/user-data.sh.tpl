#!/bin/bash
set -euxo pipefail

exec > >(tee /var/log/user-data.log)
exec 2>&1

#############################################################
# System Update
#############################################################

dnf update -y && dnf upgrade -y  

#############################################################
# Install Packages
#############################################################

dnf install -y \
git \
vim \
wget \
jq \
tree \
htop \
tar \
gzip \
unzip \
bash-completion \
docker

systemctl enable docker
systemctl start docker

usermod -aG docker ec2-user

#############################################################
# Install yq
#############################################################

wget -qO /usr/local/bin/yq \
https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64

chmod +x /usr/local/bin/yq

#############################################################
# Install kubectl
#############################################################

K8S_VERSION="1.35"

curl -Lo /usr/local/bin/kubectl \
https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable-${K8S_VERSION}.txt)/bin/linux/amd64/kubectl

chmod +x /usr/local/bin/kubectl

#############################################################
# Install Helm
#############################################################

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

#############################################################
# Install eksctl
#############################################################

ARCH="amd64"

curl --silent --location \
"https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_Linux_${ARCH}.tar.gz" \
| tar xz -C /tmp

mv /tmp/eksctl /usr/local/bin/

chmod +x /usr/local/bin/eksctl


source <(eksctl completion bash)

#############################################################
# Install Session Manager Plugin
#############################################################

curl \
https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm \
-o session-manager-plugin.rpm

dnf install -y ./session-manager-plugin.rpm

rm -f session-manager-plugin.rpm

#############################################################
# Install AWS CLI v2
#############################################################

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" \
-o "awscliv2.zip"

unzip awscliv2.zip

./aws/install

rm -rf aws awscliv2.zip

#############################################################
# Bash Aliases
#############################################################

cat <<'EOF' >> /home/ec2-user/.bashrc

alias k=kubectl
alias kgp='kubectl get pods'
alias kgs='kubectl get svc'
alias kgd='kubectl get deploy'
alias kgi='kubectl get ingress'
alias kgn='kubectl get nodes'
alias kgns='kubectl get ns'

alias kaf='kubectl apply -f'
alias kdf='kubectl delete -f'

alias ll='ls -alh'
alias c='clear'


source <(kubectl completion bash)
source <(helm completion bash)

complete -F __start_kubectl k

EOF

chown ec2-user:ec2-user /home/ec2-user/.bashrc




aws eks update-kubeconfig \
  --region ap-south-1 \
  --name dev-eks-cluster \
  --alias dev
#############################################################
# Version Information
#############################################################

echo "========================================"
echo "Bootstrap Completed"
echo "========================================"

aws --version || true
kubectl version --client || true
helm version || true
eksctl version || true
docker --version || true

echo "========================================"

