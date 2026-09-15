# Resource Policy

Serving is guaranteed enough resources for its latency-sensitive workload, the dashboard may burst opportunistically, and batch is capped so it throttles first during CPU contention.

## serving

```yaml
resources:
  requests:
    cpu: "1"
    memory: 3Gi
  limits:
    cpu: "1"
    memory: 3Gi
```

## batch

```yaml
resources:
  requests:
    cpu: 250m
    memory: 256Mi
  limits:
    cpu: 500m
    memory: 512Mi
```

## dashboard

No resource requests or limits.

## Evidence

The unlimited CPU neighbour produced a p95 latency of 6 ms, while the limited neighbour produced a p95 latency of 4 ms. This supports protecting serving and throttling background batch work first.
