# HPA Failure Analysis

1. CPU-based HPA fails for the real vLLM engine because inference is mainly GPU-bound. CPU usage can stay low even while the GPU is busy and requests are waiting, so CPU does not represent the real serving load.

2. I would use `vllm_num_requests_waiting` (queue depth) instead. It directly shows when requests are waiting because the engine cannot serve them immediately.

3. I would start with a target of about 4 waiting requests and then tune it by watching p95 latency, queue depth, GPU utilization, and replica count under load.
