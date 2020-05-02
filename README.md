# aks-aad-pod-identity

Deployment pipeline Azure AAD Pod Identity on AKS cluster

# Flux CD GitOps Operator
For every AKS cluster that is created through this repo, many Flux operators must be installed to manage some aspect of the platform's Kubernetes configurations. This includes RBAC, namespace & cluster management (ResourceQuotas, LimitRanges) and other policy related objects (NetworkPolicy, PodSecurityPolicy, OPA).

A corresponding Jenkins job is available, which should be run after every cluster creation to bootstrap Flux installation and begin applying configurations from source code. By default, the Flux operator will  perform manifest generation and apply manifests to a cluster. The [automated deployment of new container images](https://docs.fluxcd.io/en/stable/references/automated-image-update.html) is disabled.
