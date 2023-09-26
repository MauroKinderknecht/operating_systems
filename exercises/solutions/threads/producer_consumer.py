import threading
import sys
import time

buffer = []

def main(n, m, s):
    empty = threading.Semaphore(s)
    full = threading.Semaphore(0)
    mutex = threading.Semaphore(1)

    for i in range(n):
        threading.Thread(target=producer, args=(i, empty, full, mutex)).start()
    for i in range(m):
        threading.Thread(target=consumer, args=(i, empty, full, mutex)).start()

def producer(i, empty, full, mutex):
    while True:
        item = i
        time.sleep(2)
        empty.acquire()
        mutex.acquire()
        buffer.append(item)
        print('Producer %s produced item %s' % (i, item))
        mutex.release()
        full.release()

def consumer(i, empty, full, mutex):
    while True:
        time.sleep(3)
        full.acquire()
        mutex.acquire()
        item = buffer.pop(0)
        print('Consumer %s consumed item %s' % (i, item))
        mutex.release()
        empty.release()

if __name__ == '__main__':
    n = 10
    m = 2
    s = 8
    if len(sys.argv) > 1:
        n = int(sys.argv[1])
    if len(sys.argv) > 2:
        m = int(sys.argv[2])
    if len(sys.argv) > 3:
        s = int(sys.argv[3])
    main(n, m, s)