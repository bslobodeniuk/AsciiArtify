### use k3d to create a kubernetes cluster
```agsl
k3d cluster create argocd
```
### create namespace
```bash
k create ns argocd 
```
### install argocd
```bash
k apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml 
```
### check argocd
```bash
k get po -n argocd -w 
k get all -n argocd 
```
### port forward argocd server
```bash
k port-forward svc/argocd-server -n argocd 8080:443& 
```
### get argocd password
```bash
k get secret -n argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo 
```
### To login to ArgoCD GUI, use the following URL and credentials:
### URL: https://localhost:8080 username: admin password: <password from above>
![Image](./argocd.png)
### port forward echo server
```bash
k port-forward -n demo svc/echo-service 8088:8080& 
```
### test echo server
```bash
curl localhost:8088 
```
![Image](./check_echo.gif)
### delete argocd
```bash
k delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml 
```
### delete cluster
```bash
k3d cluster delete argocd
```



k port-forward svc/argocd-server -n argocd 8080:443& 
k get secret -n argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo #get argocd password
#To login to ArgoCD GUI, use the following URL and credentials:
#URL: https://localhost:8080 username: admin password: <password from above>

k port-forward -n demo svc/echo-service 8088:8080& #port forward echo server
#curl localhost:8088 #test echo server



