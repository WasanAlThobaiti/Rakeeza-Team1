import time, urllib.request

lat = []
fails = 0
end = time.time() + 30
while time.time() < end:
    t0 = time.time()
    try:
        urllib.request.urlopen("http://serving:8000/health", timeout=5).read()
        lat.append(time.time() - t0)
    except Exception:
        lat.append(5.0)
        fails += 1
    time.sleep(0.05)

lat.sort()
if lat:
    print(f"LATENCY n={len(lat)} fails={fails} p50={lat[len(lat)//2]*1000:.0f}ms p95={lat[int(len(lat)*0.95)]*1000:.0f}ms")
else:
    print(f"LATENCY n=0 fails={fails} (nothing answered at all)")
