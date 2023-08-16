import os
import threading
import time

def print_process_id():
    print(threading.current_thread(), os.getpid())
    time.sleep(30)

threading.Thread(target=print_process_id).start()
threading.Thread(target=print_process_id).start()
threading.Thread(target=print_process_id).start()
threading.Thread(target=print_process_id).start()