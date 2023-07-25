#!/bin/bash

# Variables
resourceGroup="cloud-demo"
clusterName="developerproject4-cluster"

echo "AKS CLI installed"

# Create AKS cluster
echo "Step 1 - Creating AKS cluster $clusterName"

az aks create \
--resource-group $resourceGroup \
--name $clusterName \
--node-count 1 \
--generate-ssh-keys

az aks enable-addons -a monitoring -n $clusterName -g $resourceGroup --workspace-resource-id "/subscriptions/9ed10bd5-8420-4fdf-b87f-621a5ee7dd47/resourceGroups/cloud-demo/providers/Microsoft.OperationalInsights/workspaces/loganalytics-239229"

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
