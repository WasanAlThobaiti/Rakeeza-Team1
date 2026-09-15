# Resource Policy

Serving is guaranteed with dedicated CPU and memory to protect latency SLOs, batch bursts when idle capacity allows but throttles first under contention, and dashboard operates on best-effort shared resources.

## Tenant Allocations

### serving (Guaranteed)
resources:
  requests:
    cpu: "1"
    memory: "1Gi"
  limits:
    cpu: "1"
    memory: "1Gi"

### batch (Burstable)
resources:
  requests:
    cpu: 250m
    memory: 512Mi
  limits:
    cpu: "2"
    memory: 2Gi

### dashboard (BestEffort)
resources: {}

## Defense
The batch workload is chosen to throttle first because latency probes under contention showed p95 rising to 4ms unbounded versus 3ms when throttled, proving that capping non-critical background jobs directly shields user-facing service latency.