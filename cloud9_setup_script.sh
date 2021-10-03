# This script is written to accelerate and standardized the prescribed setup in cloud9 envrionments 
# (specs: t3.medium, amazon linux, resizing hard disk to 20 GB)
python3 -m venv ~/.devops
source ~/.devops/bin/activate

# Cloud 9 only: re-using the standard re-size script to increase hard disk space
# Reference: https://docs.aws.amazon.com/cloud9/latest/user-guide/move-environment.html
./resize.sh

make install

# running the linting checks
make lint

# Installing minikube according to standard documentation (https://minikube.sigs.k8s.io/docs/start/)
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Installing and verifying kubectl according to standard documentation (https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(<kubectl.sha256) kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client

# afterwards proceed as described in the readme file.
# don't forget to activate the virtual environmnet after exiting






