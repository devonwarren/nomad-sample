# Sample Flask Deployment

## Organization

Apps are placed in 2 different folders corresponding to function. Inside will be everything needed to run these including code, Docker build files, and dependencies

## Nomad v Kubernetes

### Simpler Design

Nomad is a simpler system when compared to Kubernetes, they try to focus on the basic needs of a cluster with scaling/HA/secrets management in an opinionated way with assumptions. Kubernetes by contrast does have some easily installed options such as K3s but generally still has a larger standup time as well as learning for those unfamiliar. 

### Flexibility

Kubernetes is composed of many more layers that could be swapped out depending on business needs. This leads to higher upfront time and less consistent environments between companies/setups but much higher ability to modify the way the system works for business/technical needs.

### Popularity

Right now Kubernetes seems to be the number one targetted orchestration system. Nomad is pretty new still and has not gained near the attention or support as Kubernetes. Many applications are available as easily configured Helm charts or Operators for easy installation in K8s, this is not currently the case with Nomad.

### Support for VMs

Kubernetes focuses on container based applications where-as Nomad allows use of Qemu and other application types, this could be useful for legacy applications.

## CI/CD Pipeline

### Current State

There is a basic Github Actions pipeline included for this repo, it likely should see improvements but the basic steps would be the same:
1. Build Docker Images
2. (Optional) Push Images to registry (local tags for 1.0 is how it's setup currently)
3. Deploy to Nomad the 2 apps using the hcl files as templates

### Future Options

Github Actions is just one option of many potential good ones. The CI/CD system should be something that works well with the other tools in your environment. 

#### Self-hosted Runners

It would need to have access to your Nomad cluster so this may mean self-hosted runners such as those that could be used by Gitlab CI or Github Actions depending on your network restrictions

#### Integrations

You want the pipeline system to be able to easily interact with any tools you have that might be tied in that are in your environment. For example maybe you would like notifications to be pushed to a Slack channel, or you want containers scanned by something prior to deployment.

#### Maintance/Familiarity

Your teams familiarity with a subset of systems means more of them can understand and improve the system faster. You also want to take into account the overhead for maintaining a pipeline system.

