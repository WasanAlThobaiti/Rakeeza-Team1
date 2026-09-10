# HPA Failure Analysis on GPU Engine

## 1. Why CPU Scaling Fails
The vLLM engine offloads batch inference to the GPU. While GPU VRAM and execution queues saturate under 32 concurrent requests, CPU utilization remains low (~4-5%). A CPU-based HPA sees 5% usage vs a 50% target and fails to trigger scale-out, leaving single-replica deployments vulnerable to request queuing and timeout outages.

## 2. Replacement Metric
We should deploy scaling based on engine queue depth (`vllm_num_requests_waiting`) or KV-cache utilization (`vllm_gpu_cache_usage_perc`). Queue depth directly measures backpressure and unfulfilled demand before latency degrades.

## 3. Target Number & Tuning
Start with a target of `vllm_num_requests_waiting > 5` per pod. Tune by monitoring p95 completion latency under peak load; if queue wait time exceeds prompt processing target budgets, lower the threshold.
