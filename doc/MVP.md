### Create Kubernetes cluster and run ArgoCD
![Image](./img/mvp_cluster_create.gif)

### Authentication in ArgoCD
![argo_login.png](img%2Fargo_login.png)

### Create application in ArgoCD and deploy it to Kubernetes cluster
![argo_empty.png](img%2Fargo_empty.png)
![argo_create_app.png](img%2Fargo_create_app.png)
### Check application in ArgoCD
![argo_sync.png](img%2Fargo_sync.png)
![argo_sync_1.png](img%2Fargo_sync_1.png)
![argo_sync_done.png](img%2Fargo_sync_done.png)
### Enable auto-sync in ArgoCD
![argo_sync_enabe_auto.png](img%2Fargo_sync_enabe_auto.png)

### Check application
![ambassador.gif](img%2Fambassador.gif)

### Commands used in demo

#### Check Kubernetes service:
```bash
k get svc -ndemo 
```

#### Forward service port:
```bash
k port-forward -n demo svc/ambassador 8088:80&
```     
#### Test connection:
```bash
curl localhost:8088
```
#### Download image to test service:
```bash
wget -O /tmp/g.png https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png
```
#### Check uploaded image:
```bash
open /tmp/g.png
```
#### Push downloaded image to service:
```bash
curl -F "image=@/tmp/g.png" localhost:8088/img/
```
