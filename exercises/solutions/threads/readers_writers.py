import threading
import sys
import time
import random

readers = 0

def main(n, m):
    mutex = threading.Semaphore(1)
    write = threading.Semaphore(1)
    for i in range(n):
        threading.Thread(target=reader, args=(i, mutex, write)).start()
    for i in range(m):
        threading.Thread(target=writer, args=(i, write)).start()

def reader(i, mutex, write):
    while True:
        time.sleep(random.randint(1, 10))
        global readers
        mutex.acquire()
        readers += 1
        if readers == 1:
            write.acquire()
        mutex.release()
        print('Reader %s is reading' % i)
        time.sleep(2)
        mutex.acquire()
        readers -= 1
        if readers == 0:
            write.release()
        mutex.release()

def writer(i, write):
   while True:
    time.sleep(random.randint(1, 10))
    write.acquire()
    print('Writer %s is writing' % i)
    time.sleep(4)
    write.release()

if __name__ == '__main__':
    n = 4
    m = 2
    if len(sys.argv) > 1:
        n = int(sys.argv[1])
    if len(sys.argv) > 2:
        m = int(sys.argv[2])
    main(n, m)
