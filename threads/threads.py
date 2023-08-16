import os
import threading
import time
import sys

def read_shared_resource(name):
    s.acquire()
    print('Reading shared resource from %s' % name)
    time.sleep(2)
    s.release()


def print_process_id():
    name = threading.current_thread().name.split(' ')[0]
    print(name, "PID:", os.getpid())
    read_shared_resource(name)

def main(processes, semaphores):
    global s
    s = threading.Semaphore(semaphores)
    for i in range(processes):
        threading.Thread(target=print_process_id).start()

if __name__ == '__main__':
    n = 3
    s = 2
    if len(sys.argv) > 1:
        n = int(sys.argv[1])
    if len(sys.argv) > 2:
        s = int(sys.argv[2])
    main(n, s)