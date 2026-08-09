# AWS EKS DevSecOps Platform

An AWS EKS platform built and evolved in five phases, each adding a
production-relevant capability: infrastructure foundation → pipeline
security → SRE reliability → GitOps/Kubernetes hardening →
compliance-as-code.

This project demonstrates secure, cloud-native platform engineering
using Terraform, Kubernetes, and GitHub Actions — built as a hands-on
complement to hands-on DevSecOps/Cloud/SRE work.

## Status
In progress — currently building **Phase 1: Infrastructure Foundation**

## Phases
- [x] VPC (network foundation)
- [x] EKS cluster + managed node group
- [x] IRSA (IAM Roles for Service Accounts)
- [ ] Sample application deployment
- [ ] Observability (Prometheus/Grafana)
- [ ] Basic CI/CD pipeline

*Full architecture diagram and phase-by-phase writeups coming as each
phase is completed.*

## Stack
Terraform · AWS (EKS, VPC, IAM) · Kubernetes · Helm · GitHub Actions

## Author
Jonathan Munoz — LinkedIn: www.linkedin.com/in/jonathan-munoz-usaf27
