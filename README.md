# SysOps test

Este repositorio tiene como objetivo presentar el test para Senior Sysops de Marfeel.

# Modo de uso

Correr los siguientes comandos en el orden indicado:  
`terraform init`  
`terraform apply`  
`aws eks update-kubeconfig --name Senior-SysOps-test --region us-east-1`  
`kubectl get nodes`  

generate new credentials for SysOps-test- user1 in the AWS console and create a local AWS profile
`aws configure --profile SysOps-test-user1`
`aws sts get-caller-identity --profile SysOps-test-user1`

add this to the .aws/config file

>[profile eks-admin]
>role_arn = arn:aws:iam::[accountnumber]]:role/eks-admin
>source_profile = SysOps-test-user1


`aws sts get-caller-identity --profile eks-admin`
`aws eks update-kubeconfig --name Senior-SysOps-test --region us-east-1 --profile eks-admin`
apply nginx
`kubectl apply -f k8s/nginx.yaml`
`watch -n 1 -t kubectl get nodes`
apply echoserver
`kubectl apply -f k8s/echoserver.yaml`
`kubectl get ingress`



# Costos

El costo estimado se calculó usando la herramienta [Infracosts](https://www.infracost.io/docs/features/cli_commands/), el resultado es el siguiente:

| Name                                        | Monthly Qty                                  | Unit  | Monthly Cost |   |
|---------------------------------------------|----------------------------------------------|-------|--------------|---|
| module.eks.aws_cloudwatch_log_group.this[0] |                                              |       |              |   |
| ├─ Data ingested                            | Monthly cost depends on usage: $0.50 per GB  |       |              |   |
| ├─ Archival Storage                         | Monthly cost depends on usage: $0.03 per GB  |       |              |   |
| └─ Insights queries data scanned            | Monthly cost depends on usage: $0.005 per GB |       |              |   |
| module.eks.aws_eks_cluster.this[0]          |                                              |       |              |   |
| └─ EKS cluster                              | 730                                          | hours | $73.00       |   |
| module.vpc.aws_nat_gateway.this[0]          |                                              |       |              |   |
| ├─ NAT gateway                              | 730                                          | hours | $32.85       |   |
| └─ Data processed                           | Monthly cost depends on usage: $0.045 per GB |       |              |   |
| OVERALL TOTAL                               |                                              |       | $105.85      |   |


# Autor

Aquiles Calvo, Cloud Engineer & Architect. 
Buenos Aires, Argetina.