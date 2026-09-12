# Integration note: team-01 (v1, go-live)

- **base_url** (client form, ends in `/v1` - paste into an OpenAI client): `https://t07.aidc.nadir.sh/v1`
- **service root** (no `/v1` - the runbook triage curls and `verify.sh` build paths from this): `https://t07.aidc.nadir.sh`
- **model id:** Qwen/Qwen2.5-1.5B-Instruct-AWQ
- **auth:** bearer key, handed over in person to on-call
- **modalities:** text in, text out, tool calls per the OpenAI schema.
- **example call:** curl -s https://t07.aidc.nadir.sh/v1/chat/completions -H "Authorization: Bearer test-key" -H 'Content-Type: application/json' -d '{"model":"Qwen/Qwen2.5-1.5B-Instruct-AWQ","messages":[{"role":"user","content":"hello"}]}'
- **SLOs we publish:** availability 99% over the window · TTFT p95 < 500 ms (tier 1) · error rate < 1%
- **limits, declared honestly:** max_tokens clamp 2048 · concurrency knee ~4
- **on-call:** Ream · Slack #team-01 · response within 15 minutes during the window
