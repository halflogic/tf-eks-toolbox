![GitHub Workflow Status](https://img.shields.io/github/workflow/status/halflogic/tf-eks-toolbox/Build%20Push%20Docker%20Image%20CI) 
![GitHub](https://img.shields.io/github/license/halflogic/tf-eks-toolbox)


# Terraform EKS Toolbox 

Github: https://github.com/halflogic/tf-eks-toolbox

Ubuntu based container image you can use to manage your AWS EKS cluster.
Incudes primary tools like **aws-cli2, kubectl, eksctl, terraform, helm.**

Public images from Docker Hub are available.

Docker: https://hub.docker.com/r/halflogic/tf-eks-toolbox

### Which image tag to use?

Specifiy the image tag since there is no "latest" tag.

Example: ` halflogic/tf-eks-toolbox:1.21.r1 `

Means **kubectl 1.21** is installed, **r1** is the toolbox release version which may contain updates to the rest of the toolset. Refer to the Dockerfile to see specific versions included in the release.

### Usage:
```
docker pull halflogic/tf-eks-toolbox:<tag>

# run the container
docker run -it --rm halflogic/tf-eks-toolbox:<tag>

# or keep running in detached mode
docker run --name tf-eks-toolbox -dt halflogic/tf-eks-toolbox:<tag>
docker exec -it tfeks-toolbox /bin/bash
```


### Tools installed:

- aws-cli2
- eksctl
- helm v3
- kubectl
- kubent
- terraform

Also includes common tools and dependencies:

- curl, dnsutils, git, groff, iputils-ping, jq, unzip

