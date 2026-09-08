Serving is guaranteed dedicated CPU resources to satisfy its strict p95 latency SLO, Dashboard bursts within bounded limits during sporadic user refreshes, and Batch runs as BestEffort, acting as the first tenant to throttle during contention.

resources:
  # Serving (QoS: Guaranteed)
  - name: serving
    resources:
      requests:
        cpu: "2"
        memory: 2Gi
      limits:
        cpu: "2"
        memory: 2Gi

  # Dashboard (QoS: Burstable)
  - name: dashboard
    resources:
      requests:
        cpu: 100m
        memory: 128Mi
      limits:
        cpu: 500m
        memory: 256Mi

  # Batch (QoS: BestEffort)
  - name: batch
    resources: {}

Our measured p95 latency spiked catastrophically with an unbounded neighbour, whereas limiting background tasks protected the serving SLO completely with zero operational penalty since batch backfills have no strict deadline.
