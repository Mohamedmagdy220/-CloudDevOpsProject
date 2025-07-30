# 🚀 ArgoCD Setup & Application Deployment

This guide helps you set up ArgoCD and configure it to sync and deploy your application automatically to your Kubernetes cluster.

## 📌 Prerequisites

- A running Kubernetes cluster (kubeadm on AWS cloud ).
- kubectl configured to access your cluster.
- helm (optional, for Helm-based apps).
- A Git repository containing your Kubernetes manifests or Helm charts.

## Setup Steps 

### ⚙️ Step 1: Install ArgoCD
```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```
you will see:
![setup success]()
---

### step2: convert argocd-server service to nodeport service 
```bash
kubectl patch svc  -n argocd -p '{"spec": {"type": "NodePort"}}'
```
![service for argocd]()
---

### step3: Access argocd server 
To get the initial password:
```bash
kubectl get secret -n argocd
kubectl get secret argocd-initial-admin-secret -n argocd
kubectl get secret argocd-initial-admin-secret -n argocd -o yaml
echo -n "a29iSjlhR21tRWswbHBwMA==" | base64 -d
```
![initial password]()
---

then on the Browser :
```bash
http://<node-ip>:<nodeport>
```
![image]()
---


## ⚙️ Steps for creating cd-deployment 

### step1: Prepare Kubernetes Manifests Repository
- Add required manifest files like this [](https://github.com/Mohamedmagdy220/-CloudDevOpsProject.git)
- 
### step2: Create New Application
1. Click "+ New App" button in top navigation
2. Configure application settings:

General Section:
. Application Name: WEB-APP-DEMO
. Project: default
. Sync Policy:
   ✓ Automatic sync
   ✓ Self-Heal

Source Section:
. Repository URL: [](https://github.com/Mohamedmagdy220/-CloudDevOpsProject.git)
. Revision: main
. Path: ./k8s/ (root directory of repo)

Destination Section:

. Cluster: in-cluster
. Namespace: ivolve

![new app]()
---

after create the app you will see:
![]()
---

then you can refresh your app and after success you will see:
![image]()
---

### Step3: Test Pipeline-Driven Deployment Flow
#### 1. Manually Trigger Pipeline

In Jenkins UI:
   - Navigate to your Jenkins-CI-Workflow job
   - Click Build Now

#### 2. Verify Automated Manifest Update

Check Git commit (within 1 minute of pipeline completion):
![github]()
---

#### 3. Observe ArgoCD Response (Within 2 Minutes)

In ArgoCD UI:
     - Application status will transition:
     ```bash
      Synced → OutOfSync → Syncing → Synced
     ```
     - Health status may briefly show Progressing during rollout
![]()
---

### Final step: list all resourses in your namespace to see the resourses created:
![list reasourses]()
---

### Step4: Access Your application 
on your Browser:
```bash
http://<node-ip>:<nodepore>
```
you will see:
![image]()
---

 







