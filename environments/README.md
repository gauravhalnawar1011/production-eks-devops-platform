# Production EKS Platform

## Overview

This project provisions a production-ready Amazon EKS platform using Terraform.

The platform follows infrastructure modularization, security best practices, GitOps principles, private networking, encrypted storage, IAM least privilege access, and scalable Kubernetes architecture.

---

# Architecture

text
Internet
    │
    ▼
Route53
    │
    ▼
AWS ALB
    │
    ▼
Amazon EKS
    │
    ├── ArgoCD
    ├── Prometheus
    ├── Grafana
    ├── Applications
    └── Kubernetes Services


---

# Why Terraform?

### Q: Why use Terraform instead of creating resources manually?

Terraform provides:

* Infrastructure as Code
* Version control
* Repeatability
* Automated deployments
* State management
* Disaster recovery

Without Terraform, infrastructure changes become difficult to track and reproduce.

---

# Why Custom VPC?

### Q: Why not use the default VPC?

Default VPCs are designed for quick experimentation.

Production workloads require:

* Network isolation
* Custom CIDR ranges
* Private subnets
* NAT gateways
* Security controls
* VPC endpoints

---

# Why Private Subnets?

### Q: Why are worker nodes deployed in private subnets?

Private subnets prevent direct internet exposure.

Benefits:

* Reduced attack surface
* Improved security
* Compliance alignment
* Controlled outbound access

Only load balancers are exposed publicly.

---

# Why NAT Gateway?

### Q: Why do private nodes require NAT Gateway?

Nodes need outbound internet access for:

* Package downloads
* Container image retrieval
* AWS API communication

NAT Gateway allows outbound traffic while preventing inbound access.

---

# Why VPC Endpoints?

### Q: Why create VPC Endpoints?

Without endpoints:

text
EKS Node
    ↓
NAT Gateway
    ↓
Internet
    ↓
AWS Service


With endpoints:

text
EKS Node
    ↓
VPC Endpoint
    ↓
AWS Service


Benefits:

* Lower NAT costs
* Better security
* Reduced latency
* Private AWS communication

---

# Why KMS?

### Q: Why use AWS KMS?

KMS encrypts:

* EKS secrets
* EBS volumes
* ECR repositories
* CloudWatch Logs
* Terraform state (optional)

Encryption protects sensitive data at rest.

---

# Why ECR?

### Q: Why use Amazon ECR?

ECR is the private container registry.

Benefits:

* Secure image storage
* IAM integration
* Vulnerability scanning
* Lifecycle policies
* KMS encryption

---

# Why Amazon EKS?

### Q: Why choose EKS?

EKS provides:

* Managed Kubernetes control plane
* High availability
* Security integration
* Managed upgrades
* AWS ecosystem integration

---

# Why OIDC?

### Q: What problem does OIDC solve?

OIDC allows Kubernetes Service Accounts to securely assume IAM roles.

Without OIDC:

text
Pod
    ↓
Node IAM Role


Every pod inherits node permissions.

With OIDC:

text
Pod
    ↓
Service Account
    ↓
IAM Role


Each workload receives only required permissions.

---

# Why IRSA?

### Q: What is IRSA?

IRSA stands for:

IAM Roles for Service Accounts

IRSA enables Kubernetes workloads to access AWS services securely.

Example:

text
ExternalDNS
     ↓
Route53 Permissions

ALB Controller
     ↓
Load Balancer Permissions

EBS CSI Driver
     ↓
EBS Permissions


Each workload gets dedicated IAM permissions.

---

# Why EBS CSI Driver?

### Q: Why install EBS CSI Driver?

Kubernetes cannot dynamically provision EBS volumes by default.

The EBS CSI Driver enables:

* Persistent Volumes
* Persistent Volume Claims
* Dynamic EBS creation
* Storage expansion

Required for:

* Prometheus
* Grafana
* Databases
* Stateful applications

---

# Why AWS Load Balancer Controller?

### Q: Why use AWS Load Balancer Controller?

The controller automatically creates:

* ALBs
* Target Groups
* Listener Rules

based on Kubernetes Ingress resources.

Without it:

* ALBs must be managed manually
* Listener rules require manual updates

---

# Why Shared ALB?

### Q: Why use one ALB for multiple applications?

Example:

text
argocd.company.com
grafana.company.com
prometheus.company.com
app.company.com


Benefits:

* Lower cost
* Easier management
* Centralized SSL
* Simpler routing

---

# Why CloudWatch Logging?

### Q: Why enable EKS control-plane logs?

Logs help troubleshoot:

* Authentication failures
* Scheduling issues
* API server problems
* Kubernetes audits

Enabled logs:

* API
* Audit
* Authenticator
* Scheduler
* Controller Manager

---

# Why Bottlerocket?

### Q: Why use Bottlerocket instead of Amazon Linux?

Benefits:

* Smaller attack surface
* Minimal OS
* Container optimized
* Automatic updates
* AWS maintained

---

# Why GitOps?

### Q: Why use GitOps?

Git becomes the source of truth.

Benefits:

* Auditable changes
* Rollback capability
* Automated deployments
* Improved reliability

ArgoCD continuously reconciles cluster state with Git.

---

# Repository Structure

text
modules/
├── network
├── security
├── container
├── orchestration
├── gitops
└── observability

environments/
├── network
├── security
├── container
└── orchestration


Modules contain reusable infrastructure logic.

Environments contain deployment-specific configurations.

---

# Deployment Order

1. Network
2. Security (KMS)
3. Container Registry (ECR)
4. EKS Cluster
5. OIDC
6. EBS CSI Driver
7. AWS Load Balancer Controller
8. ExternalDNS
9. ArgoCD
10. Monitoring Stack

---

# Future Enhancements

* ExternalDNS
* ACM Certificates
* Route53 Automation
* ArgoCD GitOps
* Prometheus
* Grafana
* Loki
* Karpenter
* External Secrets Operator
* Velero Backup & Restore
* Service Mesh
* Multi-Environment CI/CD
* Blue-Green Deployments
* Canary Deployments
* Multi-Account AWS Architecture



