import sys
import time
import subprocess

if len(sys.argv) < 3:
    print("Usage: timem [count] command args ...")
    exit()

try:
    int(sys.argv[1])
except ValueError:
    print("ERROR: [count] must be a number.")
    exit()

start = time.perf_counter()

for _ in range(int(sys.argv[1])):
    subprocess.run(sys.argv[2:])

end = time.perf_counter()

print(f"Ran '{' '.join(sys.argv[2:])}' {sys.argv[1]} times")

total = end - start
total_s = int(total)
total_ms = int(total * 1000) % 1000
print(f"Total  : {total_s}s {' ' * (3 - len(str(total_ms))) + str(total_ms)}ms")
per = total / int(sys.argv[1])
per_s = int(per)
per_ms = int(per * 1000) % 1000
print(f"Per run: {per_s}s {' ' * (3 - len(str(per_ms))) + str(per_ms)}ms")



