#  📦 Container Orchestration with Kubernetes
## 🧠 Objective

Setup a production-ready Kubernetes environment for deploying and managing the django-web-app application.

## ✅ Overview
- 🚀 Setup Kubernetes cluster
- 🧱 Create `iVolve` namespace
- ⚙️ Configure `Deployments` and `Services` and `volumes` for the application


## 🔧 Prerequisites
- 3 EC2 installed on aws (1 > master , 2 > worker nodes)
- Basic understanding of YAML, pods, deployments, and services

## 📁 Project Structure
```cpp
.
├── k8s/
│   ├── db-pv.yaml
│   ├── db-pvc.yaml
│   ├── db-statefulset.yaml
│   ├── db-service.yaml
│   ├── configmab.yaml
│   ├── storadeclass.yaml
│   ├── app-pv.yaml
│   ├── app-deployment.yaml
│   ├── app-service.yaml
│   └── app.pvc.yaml
└── README.md
```
  
## steps:
### 1️⃣ Step: Create Namespace
```yml
# k8s/namespace.yaml
apiVersion: v1
kind: Namespace
metadata:
  name: ivolve
```

```bash
kubectl apply -f k8s/namespace.yaml
```
> you can see your namespaces :
```bash
kubectl get ns
```

![](https://github.com/Mohamedmagdy220/-CloudDevOpsProject/blob/main/k8s/images/namespace.png)

### 2️⃣ Step: create yml files for db :
1. `db-pv.yml`  >>> for creating presestant volume for database
2. `db-pvc.yml` >>> for creating presestant volume claim for database (optional) you can let statefulset craete it
3. `db-statefulset.yml`  >>> for creating 2 replica of datatbase pod in the worker node `node2=database`
4. `db-service.yml`  >>> for creating a cluster ip service for the database pod with name `db` for dns resolution
5. `configmab.yml` and `secret.yml`  >>> for the environment variables which you pass them to the app and db
6. `storageclass.yml`   >>> for pv and pvc
7. `app-pv.yml` and `app-pvc.yml`  >>> (optional) for storing data from app
8. `app-deployment.yml`  >>> for creating 2 replica of app pod in the worker1 `node1=database`

you can see the content of these files in this repo. 

after you create them you should apply these files by order :
```bash
kubectl apply -f db-pv.yml
kubectl apply -f db-pvc.yml
kubectl apply -f db-statefulset.yml
kubectl apply -f db-service.yml
kubectl apply -f configmab.yml
kubectl apply -f storageclass.yml
kubectl apply -f app-pv.yml
kubectl apply -f app-pvc.yml
kubectl apply -f app-deployment.yml
```

## 🧪 Verification

After success created you can see the resourses with these commands :
```bash
kubectl get all -n ivolve
```
![](https://github.com/Mohamedmagdy220/-CloudDevOpsProject/blob/main/k8s/images/get%20all%20resourses%20in%20namespace%20ivolve.png)
---

- you can see the service of app is nodeport you can use ingress instead of this but in this repo i used nodeport:
- you can access the app using :
```bash
http://<nodeip>:<nodeport>
```
![](https://github.com/Mohamedmagdy220/-CloudDevOpsProject/blob/main/k8s/images/access%20app%20with%20node%20port.png)
---






