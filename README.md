# Дипломная пельменная
[Пельменная здесь](https://momo.sudouser.net)  
[Мониторинг пельменной](https://momo-grafana.sudouser.net) (guest:pupalupa228)

## Приложение
### Требования
- Kubernetes кластер  
    - Пользователь с правами  ["get", "list", "watch", "create", "update", "delete", "patch"]
    - Ingress контроллер
- Gitlab CI
    - Доступные раннеры
    - Container Registry
 
### Ресурсы
- Исходный код frontend: <a href= https://gitlab.praktikum-services.ru/std-024-06/diploma/-/tree/main/frontend> Gitlab frontend</a>  
- Исходный код backend: <a href= https://gitlab.praktikum-services.ru/std-024-06/diploma/-/tree/main/backend> Gitlab backend</a>  
- Helm манифесты: <a href= https://gitlab.praktikum-services.ru/std-024-06/diploma/-/tree/main/deploy> Gitlab deploy</a>
- Docker образы:  Gitlab Container Redistry - gitlab.praktikum-services.ru:5050/std-024-06/diploma/

### CI/CD
Автоматические сборка и деплой реализованы в пайплайнах Gitlab CI.
#### Триггеры пайплайнов



- Сборка frontend: (изменеия в директории **/frontend**) & (Строка **"CI"** в тексте коммита)
- Деплой frontend: (сборка frontend) & (Строка **"CD"** в тексте коммита)
- Сборка backend: (изменеия в директории **/backend**) & (Строка **"CI"** в тексте коммита)
- Деплой backend: (сборка backend) & (Строка **"CD"** в тексте коммита)
- Общий деплой: (изменеия в директории **/deploy**) & (Строка **"DEPLOY"** в тексте коммита)

<span style="color:yellow">
!Frontend и Backend не могут быть одновременно задеплоены после одновременного билда!</span>
  
---


## Инфраструктура  
### Требования
- Аккаунт AWS
    - Пользователь AWS с правами создания ресурсов
        - EKS
        - EC2
        - VPC
        - S3
    - Отдельный IAM пользователь для деплоя в kubernetes
        - Роль пользователя с правом sts:AssumeRole
    - S3 Buckets
        - С картинками пельменей. (Публичный доступ)
        - Для хранения состояния Terraform
    - EBS
        - Для PV Grafana
        - Для PV Prometheus
- AWS CLI
- Terraform
- Helm

### Ресурсы
-   <a href= https://github.com/s-pepyako/infra/tree/main/terraform> Конфигурация Terraform</a>  
-   <a href= https://github.com/s-pepyako/infra/tree/main/postproc> Ресурсы донастройки кластера</a>
-   <a href= https://github.com/s-pepyako/infra/tree/main/monitoring> Манифесты мониторинга</a>

### Развертывание

#### Кластер
```bash
# Залогиниться под администратором AWS
aws configure

# Развернуть кластер
cd ./terraform
terraform apply -auto-approve
# Добавить kubeconfig для нового кластера
./add_kubeconfig.sh


# Добавить рабочий неймспейсм, развернуть ingress-nginx контроллер и добавить rbac роль для деплоя
cd ../postproc
./postproc.sh

```
#### DNS
```
Добавить CNAME записи для сайта и мониторинга на URL лоадбэлансера
```

#### Мониторинг
```
Установить чарты из ./monitoring
```

---
## Переменные окружения

```sh
$AWS_REGION - регион, в котором развернут кластер  
$AWS_ACCESS_KEY_ID - KEY_ID пользователя для деплоя  
$AWS_SECRET_ACCESS_KEY - ACCESS_KEY пользователя для деплоя  
$EKS_CLUSTER_NAME - Имя кластера kubernetes  
$EKS_ROLE_ARN - ARN роли с правами на наймспейс $PROD_NAMESPACE 
$PROD_DOMAIN - FQDN сайта  
$PROD_NAMESPACE - namespace  
$REG_CREDS - base64 данные для доступа imagePullSecrets в container registry  
$TLS_CERT - base64 сертификат HTTPS для $PROD_DOMAIN  
$TLS_KEY - base64 ключ HTTPS для $PROD_DOMAIN  
```


# Скриншоты

**Зеленые пайплайны**
![Screenshot](https://momo-img-bucket.s3.eu-central-1.amazonaws.com/screenshots/Gitlab+Pipelines.jpg)

**Деплой EKS кластера через Terraform**
![Screenshot](https://momo-img-bucket.s3.eu-central-1.amazonaws.com/screenshots/Terraform+success.jpg)

**Выполнение скриптов донастройки кластера**
![Screenshot](https://momo-img-bucket.s3.eu-central-1.amazonaws.com/screenshots/Cluster+postprocessing.jpg)

**Дешборды AWS c автоматически развернутыми ресурсами**
![Screenshot](https://momo-img-bucket.s3.eu-central-1.amazonaws.com/screenshots/EC2+Instances.jpg)

![Screenshot](https://momo-img-bucket.s3.eu-central-1.amazonaws.com/screenshots/EKS+Dashboard.jpg)

![Screenshot](https://momo-img-bucket.s3.eu-central-1.amazonaws.com/screenshots/ELB+Dashboard.jpg)
