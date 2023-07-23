#!/bin/bash

# Variables
resourceGroup="cloud-demo1"
clusterName="developerproject4-cluster"

echo "AKS CLI installed"

# Create AKS cluster
echo "Step 1 - Creating AKS cluster $clusterName"

az aks create \
--resource-group $resourceGroup \
--name $clusterName \
--node-count 1 \
--generate-ssh-keys

az aks enable-addons -a monitoring -n $clusterName -g $resourceGroup --workspace-resource-id "/subscriptions/622411f9-056b-4cd2-8612-cd26091f1c5c/resourceGroups/cloud-demo1/providers/Microsoft.OperationalInsights/workspaces/developerproject4-loganalytics"

echo "AKS cluster created: $clusterName"

# Connect to AKS cluster

echo "Step 2 - Getting AKS credentials"

az aks get-credentials \
--resource-group $resourceGroup \
--name $clusterName \
--verbose

echo "Verifying connection to $clusterName"

kubectl get nodes

# echo "Deploying to AKS cluster"
# kubectl apply -f azure-vote.yaml
