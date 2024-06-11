# DevOps course graduation work


## Application
### Prerequisites
- Kubernetes cluster  
    - User with permissions: ["get", "list", "watch", "create", "update", "delete", "patch"]
    - Ingress controller
- Gitlab CI
    - Available runners
    - Container Registry
 
### Resources
- frontend source code: <a href= https://gitlab.praktikum-services.ru/std-024-06/diploma/-/tree/main/frontend> Gitlab frontend</a>  
- backend source code: <a href= https://gitlab.praktikum-services.ru/std-024-06/diploma/-/tree/main/backend> Gitlab backend</a>  
- Helm manifests: <a href= https://gitlab.praktikum-services.ru/std-024-06/diploma/-/tree/main/deploy> Gitlab deploy</a>
- Docker images:  Gitlab Container Redistry - gitlab.praktikum-services.ru:5050/std-024-06/diploma/

### CI/CD
Automated build and deploy made for Gitlab CI.
#### Pipelines triggers

- Build frontend: (directory **/frontend** changed) & (Commit comment conatins **"CI"**)
- Deploy frontend: (сборка frontend) & (Commit comment contains **"CD"**)
- Build backend: (directory **/backend** changed) & (Commit comment conatins **"CI"** )
- Deploy backend: (сборка backend) & (Commit comment conatins **"CD"**)
- Full deploy: (directory **/deploy** changed) & (Commit comment conatins  **"DEPLOY"**)

<span style="color:yellow">
!Frontend and Backend cannot be deployed after they built together using "CD" comment!</span> To deploy them together use comment "DEPLOY"
  
---



# Screenshots

**Pipelines**
![Screenshot](https://momo-img-bucket.s3.eu-central-1.amazonaws.com/screenshots/Gitlab+Pipelines.jpg)

**Deploy EKS via Terraform**
![Screenshot](https://momo-img-bucket.s3.eu-central-1.amazonaws.com/screenshots/Terraform+success.jpg)

**Scripts**
![Screenshot](https://momo-img-bucket.s3.eu-central-1.amazonaws.com/screenshots/Cluster+postprocessing.jpg)

**Dashboards**
![Screenshot](https://momo-img-bucket.s3.eu-central-1.amazonaws.com/screenshots/EC2+Instances.jpg)

![Screenshot](https://momo-img-bucket.s3.eu-central-1.amazonaws.com/screenshots/EKS+Dashboard.jpg)

![Screenshot](https://momo-img-bucket.s3.eu-central-1.amazonaws.com/screenshots/ELB+Dashboard.jpg)
