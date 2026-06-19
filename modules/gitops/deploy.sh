helm repo add eks https://aws.github.io/eks-charts

helm repo update

helm upgrade --install aws-load-balancer-controller \
eks/aws-load-balancer-controller \
-n kube-system \
--create-namespace \
--set clusterName=dev-eks-cluster \
--set serviceAccount.create=true \
--set serviceAccount.name=aws-load-balancer-controller \
--set serviceAccount.annotations."eks\.amazonaws\.com/role-arn"=arn:aws:iam::074095961179:role/dev-alb-controller-role


kubectl get pods -n kube-system | grep load-balancer