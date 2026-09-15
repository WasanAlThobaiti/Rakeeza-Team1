#!/usr/bin/env bash
set -u

CLUSTER="${CLUSTER:-aidc}"
POD="${POD:-serving}"
PORT=18441
PF_PID=""

fail() { echo "GREEN CHECK: FAIL ($1)"; [ -n "$PF_PID" ] && kill "$PF_PID" 2>/dev/null; exit 1; }

command -v kubectl >/dev/null || fail "kubectl not on PATH"

phase=$(kubectl get pod "$POD" -o jsonpath='{.status.phase}' 2>/dev/null \
  || fail "pod $POD not found")
[ "$phase" = "Running" ] || fail "pod status is $phase, expected Running"

ready=$(kubectl get pod "$POD" -o jsonpath='{.status.containerStatuses[0].ready}' 2>/dev/null \
  || fail "cannot read ready condition")
[ "$ready" = "true" ] || fail "container not ready"

kubectl port-forward "pod/$POD" "$PORT:8000" >/dev/null 2>&1 &
PF_PID=$!
sleep 2

res=$(curl -s "http://127.0.0.1:$PORT/health" 2>/dev/null || true)
kill "$PF_PID" 2>/dev/null
wait "$PF_PID" 2>/dev/null || true

echo "GREEN CHECK: PASS"
