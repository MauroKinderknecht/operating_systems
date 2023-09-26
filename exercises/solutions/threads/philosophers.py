import threading
import sys
import time
import random

def main(n):
    forks = [threading.Semaphore(1) for _ in range(n)]
    for i in range(n):
        threading.Thread(target=philosopher, args=(i, forks)).start()

def philosopher(i, forks):
    while True:
        time.sleep(random.randint(3, 6)) # Think
        forks[i].acquire()
        forks[(i + 1) % len(forks)].acquire()
        print('Philosopher %s is eating' % i)
        time.sleep(random.randint(1, 3)) # Eat
        forks[i].release()
        forks[(i + 1) % len(forks)].release()


if __name__ == '__main__':
    n = 5
    if len(sys.argv) > 1:
        n = int(sys.argv[1])
    main(n)
