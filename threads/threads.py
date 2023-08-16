import os
import threading
import time
import sys

def print_process_id():
    print(threading.current_thread(), os.getpid())
    time.sleep(60)

def main(processes):
    for i in range(processes):
        threading.Thread(target=print_process_id).start()

if __name__ == '__main__':
    n = 3
    if len(sys.argv) > 1:
        n = int(sys.argv[1])
    main(n)