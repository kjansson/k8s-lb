# A loadbalancer for K8s non-cloud deployments

## Info

K8s-lb is an implementation of HAproxy and keepalived designed to enable HA TCP loadbalancing in kubernetes running in non-cloud environments.
It is simply HAProxy and keepalived combined in one container with some helper scripts that utilizes K8s functionality to automate configuration and enable running a simple service discovery script on the side to configure HAProxy dynamically.

## Why use this?

k8s-lb offers some advantages over ingress-based proxys/loadbalancers, such as;

* Not limited to HTTP
* Single, highly available virtual IP as entrypoint to your services
* Not limited to routing by path, uses simple port numbers for routing

The trade-off is that you don't get the service discovery functionality that you get with an ingress-controller, but that can be achieved by polling the API for services and updating HAProxys configuration.

