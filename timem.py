import sys
import time
import subprocess

def print_usage():
    print("Usage: timem [count] command args ...")
    print("             [count] - number of times to run. If negative the output is silenced.")

if len(sys.argv) < 3:
    print_usage()
    exit()

try:
    num = int(sys.argv[1])
except ValueError:
    print("ERROR: [count] must be a number.")
    exit()

if num < 0:
    start = time.perf_counter()

    for _ in range(-num):
        subprocess.check_output(sys.argv[2:])

    end = time.perf_counter()
else:
    start = time.perf_counter()

    for _ in range(num):
        subprocess.run(sys.argv[2:])

    end = time.perf_counter()


print(f"Ran '{' '.join(sys.argv[2:])}' {abs(num)} times" + (" with silenced input" if num < 0 else ""))

total = end - start
total_s = int(total)
total_ms = int(total * 1000) % 1000
per = total / abs(num)
per_s = int(per)
per_ms = int(per * 1000) % 1000
max_len = max(len(str(total_s)), len(str(per_s)))
print(f"Total  : {' ' * (max_len - len(str(total_s)))}{total_s}s {' ' * (3 - len(str(total_ms)))}{total_ms}ms")
print(f"Per run: {' ' * (max_len - len(str(per_s)))}{per_s}s {' ' * (3 - len(str(per_ms)))}{per_ms}ms")



