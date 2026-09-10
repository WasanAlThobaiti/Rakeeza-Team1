# Week 4: Production LLM Serving & Go-Live Operations

This directory contains the configurations, scripts, and verification assets for Week 4's deployment of the `Qwen/Qwen2.5-1.5B-Instruct-AWQ` inference service on Kubernetes.

## System Overview

* **Deployment Namespace:** `team`
* **Model ID:** `Qwen/Qwen2.5-1.5B-Instruct-AWQ`
* **Internal Service Port:** `8000` mapped to NodePort `30800` (`team-serving`)
* **Public Ingress Endpoint:** `https://t07.aidc.nadir.sh`
* **Authentication:** Bearer token stored in secret `serving-keys` (`test-key`)

---

## Directory Structure

* `my-integration-note.md`: Integration contract detailing endpoints, model capabilities, authentication requirements, and on-call contact details.
* `prometheus-scrape.yaml`: ConfigMap and deployment manifests for scraping vLLM metrics (`/metrics`) on a 15-second interval.
* `verify.sh`: Outside-in verification script testing authenticated completions, `/health` readiness, and Prometheus metric accumulation.
* `deployment.yaml` & `service.yaml`: Kubernetes manifests managing the vLLM deployment and `team-serving` service routing.

---

## Operations & Verification

### 1. Apply Monitoring & Service Routing
```bash
kubectl apply -f prometheus-scrape.yaml
kubectl patch svc team-serving -p '{"spec":{"type":"NodePort","ports":[{"name":"http","port":8000,"targetPort":8000,"nodePort":30800}]}}'
