---

options:
  implicit_slide_ends: true

title: Kubernetes meets Rust
author: Shawn Wang @ Netdb Tech Talks 2403

#<!-- #author: Shawn Wang @ TOOCON 2402 -->

---

# kubernetes

## Kubernetes meets Rust
## Outline
 
* What is Kubernetes?
  * Some Rust Kubernetes utilities
* Why Rust is good for Kubernetes? (kube.rs)
* Rust for other parts of Kubernetes.

## source

- https://gist.github.com/shawn111/ebebfcf7e0bbd4a7ac9e17adefd625cc
- presenterm [](https://github.com/mfontanini/presenterm)

<!-- end_slide -->

# What is Container

## Linux Container
- chroot
- cgroup
- namespaces
- capabilities
- seccomp
- AppArmour / SELinux

## OCI Open Container Initiative
- runtime
  - runc 
- image
- distribution

<!-- end_slide -->

# kubernetes overview

* k8s - **container orchestration engine** [](https://kubernetes.io/docs)
  - automating deployment / scaling
  - management containerized applications

* Kubernetes is written in the Go language.
  - Unlike Borg, which was written in C++
  - announced in June, 2014 and version 1.0 was released on July 21, 2015

* relatation with Docker
  - OCI Established in June 2015 by Docker
  - v1.24 in May 2022, the "dockershim" has been removed entirely

* Linux foundation < CNCF < kubernetes

<!-- end_slide -->

# Componenents

<!-- column_layout: [1, 2] -->

<!-- column: 0 -->

## Admin

- kubectl
- others
  - helm
  - kdash / k9s

<!-- column: 1 -->

## Control Plane (master)
- kube-scheduler - assigns Pods to Nodes
- kube-controller-manager
- etcd
- kube-api

## Node

- kubelet - kube agent
  - cri Container Runtime Interface
    - contianerd
    - cri-o
  - cni Container Network Interface
  - csi Container Storage Interface
- kube-proxy

<!-- end_slide -->

# Overview

```
      ┌─────────────────────────┐ ┌────┬────────────┐
      │   ┌────┐  Control Plan  │ │Node│kube-proxy┌─┴─────┐
      │   │etcd│                │ │   ┌┴──────┬─┬─│Network│
─────┐│   └────┘    ┌───────┐   │ │   │kubelet│ │ └────.──┘
Admin├┼─────────────►  Api  ◄───┼┐└───┴──┬────┴─┘    .. 
kubectl             └───────┘   │└────┬──┴┐       ┌─.───
─────┘│   ┌────────────────┐    │ ┌───┴──┐│       │Users
      │   │ kube-scheduler │    │ │ Node ││       └─────
      │┌──┴────────────────┴───┐│ └───┬──┴┴──┐
      ││kube-controller-manager││     │ Node │
      └┴───────────────────────┴┘     └──────┘
```

<!-- end_slide -->

# k8s quick start

[](https://kind.sigs.k8s.io/)

<!-- column_layout: [1, 1] -->
<!-- column: 0 -->
- prepare docker or podman
  - apt install podman
- kind 
  - kind create cluster
- kubectl
- prepare kubecfg
  - $KUBECONFIG
  - kubectl config view
  - kubectl config view --raw

<!-- column: 1 -->

```bash +exec
kind create cluster
```
```bash +exec
podman ps
```
```bash +exec
podman exec -it  kind-control-plane  bash
```
```bash +exec
kubectl get pods -A
```

<!-- end_slide -->

# Inside kind-control-plane

containerd cli

```bash +exec
ctr -n k8s.io containers list
```

 cri-tools

```bash +exec
crictl ps
```

nerdctl
- on the way, [](https://github.com/kubernetes-sigs/kind/pull/3429)

```bash +exec
nerdctl ps
```

<!-- end_slide -->

# API / Objects In Kubernetes

<!-- column_layout: [1, 1] -->
<!-- column: 0 -->

- Object spec and status 

- API / Resource
- API Group

- watch

- kubectl / restful

<!-- column: 1 -->

```
❯ k get pod nginx-0 -o yaml
apiVersion: v1
kind: Pod
metadata:
  labels:
    app: nginx
  name: nginx-0
  namespace: default
spec:
  containers:
  - image: nginx:1.16.1
status:
  conditions:
...
```
<!-- end_slide -->

# Example of Operator/Controller

<!-- column_layout: [1, 2] -->
<!-- column: 0 -->

## application
### controller
### reconciler
## CRD Custom Resource Definitions

<!-- column: 1 -->

```
                    ┌──────────┐
               ┌────┤controller├──────┐
               │    └────▲─────┘      │
               │         │      schedule object
             watch    result          │
┌────────┐     │         │       ┌────▼─────┐
│kubectl │     │         └───────┤reconciler│
└───┬────┘     │                 └────┬─────┘
    │          │                   update
    │     ┌────▼────┐                 │
    └─────►kube api ◄─────────────────┘
          └─────────┘
```

<!-- end_slide -->

## Why Rust

- Concurrency
- No garbage collection.
- memory safe
- performance
- cli (Rust-CLI wg) [](https://rust-cli.github.io/book/tutorial/index.html)
- Easy distribution
  - cargo install / binstall
- Document / resources
  - mdbook
  - crates.io / docs.rs / lib.rs
- kube.rs
- kernel / M$ / ... love rust
- ...

<!-- end_slide -->

# kube.rs

- core Rust ecosystem for building applications against Kubernetes.
- accepted to CNCF on November 16, 2021 at the Sandbox maturity level ...

<!-- column_layout: [1, 3] -->
<!-- column: 0 -->

## kube
 - 5 crates
<!-- column: 1 -->
### kube-core
Core traits and types necessary for interacting with the kubernetes API.
### kube-derive < kube-core
for managing Custom Resource Definitions
### kube-client < kube-core
kube::client and kube::config modules.
#### kube-runtime < kube-client
Common components for building Kubernetes operators

<!-- end_slide -->
-----

## KDash

```
 KDash - A simple Kubernetes dashboard    v0.6.0 with ♥ in Rust  
┌───────────────────────────────────────────────────────────────┐
│ Active Context <A>│All Contexts <C>│Utilization <U><←→> switch│
└───────────────────────────────────────────────────────────────┘
┌ Namespaces <n> (all: <a>) ────────┐┌ Context┐┌ CLI Info (filte┐
│   Name                   Status   ││CPU:    ││kubectl  v1.29.0│
│=> kube-insider           Active   ││0% ━━━━━││kubectl  v1.29.1│
└───────────────────────────────────┘└────────┘└────────────────┘
┌ Resources ────────────────────────────────────────────────────┐
│ Pods <1>│ Services <2>│ Nodes <3>│ ConfigMaps <4>│ StatefulSe │
│                                                               │
│       ┌ Select Resource ───────────────────────────────┐      │
│       │   ResourceQuota                                │      │
│       │=> Tunnel                                       │      │
│       │   ValidatingWebhookConfiguration               │      │
│       └────────────────────────────────────────────────┘      │
└───────────────────────────────────────────────────────────────┘
```
  
<!-- end_slide -->
-----

## k8s-insider - an operator help to access you kubernetes cluster network

```bash +exec
k8s-insider install --pod-cidr 10.244.0.0/16
k8s-insider create network
k8s-insider connect

## remove dns
resolvconf -d insider0 -m 0 -x
```

```
❯ kubectl get networks.k8s-insider.dev -A
NAMESPACE      NAME      AGE
kube-insider   default   6h51m

❯ kubectl get tunnels.k8s-insider.dev -A
NAMESPACE      NAME              AGE
kube-insider   default-bjk40r   6h49m
kubectl get services -n kube-insider
NAME     TYPE     CLUSTER-IP   EXTERNAL-IP PORT(S)        AGE
k8s-... NodePort  10.96.153.40 <none>      1234:31237/UDP 54m
```

<!-- end_slide -->                                                                                                                                     

# my shell env for k8s

- fish
  - starship - cross shell prompt
  - kubie kbs kubesess
- kdash
- k8s-insider


<!-- end_slide -->
-----

## sidecar
- Linkerd linkerd2 (Linkerd is a service mesh for Kubernetes.)
  - https://github.com/olix0r/kubert
  - CNCF 2023: Alex Leong, Five Years of Cloud Native Rust. [](https://www.youtube.com/watch?v=9Ro-LN2SmhY)
- Istio ztunnel

## service operators
- Stackable https://github.com/orgs/stackabletech/repositories
- Tembo Stacks: Making Postgres the Everything Database https://tembo.io/

## krustlet/krator
Leveraging State Machines to Build Operators in Rust - Kevin Flansburg, Moose Consulting

## utils
- mirrord https://mirrord.dev/
- kubectl plugins
  - kubectl-watch
  - krew-wasm
Qovery - Enable Developers Self-Service:  Terraform, Helm, Kubectl, and Docker
Shulker - The modern way of putting Minecraft in boxes [](https://shulker.jeremylvln.fr/)

<!-- end_slide -->
-----

- container related projects
  - youki
  - https://github.com/containers/conmon-rs (podman)
- wasmtime
- rust-vmm

helm related






conmon-rs

<!-- end_slide -->

# metrics

metrics -> prometheus
telemetry -> OpenTelemetry

<!-- end_slide -->

## sidecar

- Linkerd

<!-- end_slide -->


## kubectl plugins

<!-- end_slide -->

# Rust for other parts of Kubernetes.

* container / vmm
* wasm


<!-- end_slide -->


k8sfwd
k8s-insider

kubetui
kdash
kubectl-view-allocations

kubeconfig-bikeshed / kbs
kubesess
kubie

krew-wasm
krew-wasm-plugin-sdk-rust

ksnotify
