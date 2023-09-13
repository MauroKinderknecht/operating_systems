import random
import threading
import sys
import time

waiting = 0

def main(n):
    customers = threading.Semaphore(0)
    barber = threading.Semaphore(0)
    mutex = threading.Semaphore(1)
    threading.Thread(target=barber_func, args=(barber, customers, mutex)).start()
    for i in range(n):
        threading.Thread(target=customer, args=(i, barber, customers, mutex)).start()

def barber_func(barber, customers, mutex):
    while True:
        customers.acquire()
        mutex.acquire()
        global waiting
        waiting -= 1
        barber.release()
        mutex.release()
        print('Barber is cutting hair')
        time.sleep(3)

def customer(i, barber, customers, mutex):
    global waiting
    time.sleep(random.randint(1, 4))
    mutex.acquire()
    if waiting < 3:
        print('Customer %s is waiting' % i)
        waiting += 1
        customers.release()
        mutex.release()
        barber.acquire()
        print('Customer %s is getting a haircut' % i)
    else:
        print('Customer %s is leaving as no chairs are available' % i)
        mutex.release()

if __name__ == '__main__':
    n = 10
    if len(sys.argv) > 1:
        n = int(sys.argv[1])
    main(n)
