# xAI with HUMAIN — 500 MW Saudi AI Data Centre

Source: xAI/HUMAIN announcement cited in the case sheet (CNBC and DCD,
19 Nov 2025). Published capacity: 500 MW for Grok; first cluster about
18,000 GB300 GPUs.

Assumptions
PUE 1.25; 10% of IT power for switches/storage; 20% headroom; GB300
NVL72 = 72 GPUs, 20 TB and 120 kW/rack; 30-day month; 65% average draw;
$0.08/kWh; 125 output tokens/s/GPU; $450,000/MW/month excluding electricity.

1. Racks and GPUs
500 / 1.25 = 400 MW IT
400 × 0.90 × 0.80 = 288 MW compute
288 / 0.120 = 2,400 NVL72 racks
2,400 × 72 = 172,800 GPUs

Our Final Answer: 2,400 racks and 172,800 GB300 GPUs.

2. Largest open model served
Use Kimi K2: 1T parameters.
FP8 weights ≈ 1 TB. Allow ≈0.3 TB for 32 long-context conversations,
so ≈1.3 TB per copy.
Each rack has ≈20 TB, so approximately 15 copies/rack.
15 × 2,400 ≈ 36,000 copies.

Our Final Answer: Kimi K2, approximately 36,000 memory-sized copies.

3. Largest model trained in six months
The sheet provides H100 peak compute, so we use 989 TFLOPS/GPU as a
course-level compute proxy, at 40% sustained performance.
Total six-month compute ≈ 1.08×10^27 operations.
Training requirement = 6×N×20N = 120N².
N = sqrt(1.08×10^27 / 120) ≈ 3.0×10^12.

Our Final Answer: approximately a 3-trillion-parameter model theoretically.
Actual capacity would be lower because distributed training does not
scale perfectly.

4. Monthly electricity
500 MW × 65% = 325 MW average.
325 × 720 h = 234,000 MWh = 234,000,000 kWh.
234,000,000 × $0.08 = $18.72 million/month.

Our Final Answer: approximately $18.72M/month
(or $11.23M at $0.048/kWh industrial rate).

5. Cost per million output tokens
Non-electric cost = 500 × $450,000 = $225M/month.
Total = $225M + $18.72M = $243.72M/month.
Maximum output capacity = 172,800 × 125 × 2,592,000
= 55.9872 trillion tokens/month.

At 30% sold: cost ≈ $14.51 per million tokens.
At 80% sold: cost ≈ $5.44 per million tokens.

Gap
The announcement does not say when the full 500 MW will actually be
energized and available for AI compute. We therefore treat 500 MW as
planned connection capacity, not confirmed operating capacity.