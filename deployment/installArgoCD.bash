#!/usr/bin/env bash
#use k3d to create a kubernetes cluster
k3d cluster create argocd #create cluster
k create ns argocd #create namespace
k apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml #install argocd
k get all -n argocd #check argocd pods
k get po -n argocd -w #check argocd pods
k port-forward svc/argocd-server -n argocd 8080:443& #port forward argocd server
k get secret -n argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo #get argocd password
#To login to ArgoCD GUI, use the following URL and credentials:
#URL: https://localhost:8080 username: admin password: <password from above>

k port-forward -n demo svc/echo-service 8088:8080& #port forward echo server
#curl localhost:8088 #test echo server

