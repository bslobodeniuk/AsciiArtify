### Create Kubernetes cluster with **k3d** and run **ArgoCD**
![Image](./img/mvp_cluster_create.gif)

### Authentication in ArgoCD
#### user - 'admin' and password from the command below:
```bash
k get secret -n argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo 
```
![argo_login.png](img%2Fargo_login.png)

### Application delivery automation
#### Create new application for delivery with ArgoCD
![argo_empty.png](img%2Fargo_empty.png)
![argo_create_app.png](img%2Fargo_create_app.png)
### Enable auto-sync (re-deploy) for application
![argo_sync_enabe_auto.png](img%2Fargo_sync_enabe_auto.png)
### Check application status in ArgoCD GUI and in the terminal
![argo_sync.png](img%2Fargo_sync.png)
![argo_sync_1.png](img%2Fargo_sync_1.png)
![argo_sync_done.png](img%2Fargo_sync_done.png)
### Application validation in the terminal:
![ambassador.gif](img%2Fambassador.gif)

#### Result:
![google.png](img%2Fgoogle.png)

### Used commands:

#### Check services in demo namespace
```bash
k get svc -ndemo 
```
#### Forward service port to localhost
```bash
k port-forward -n demo svc/ambassador 8088:80&
```     
#### Test connection to service
```bash
curl localhost:8088
```
#### Download image to test service 
```bash
wget -O /tmp/g.png https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png
```
#### Check uploaded image
```bash
open /tmp/g.png
```
#### Push downloaded image to service
```bash
curl -F "image=@/tmp/g.png" localhost:8088/img/
```
