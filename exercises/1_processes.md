# Exercise 1 - Processes

## 1 - Prioridad de proceso

Crear un script que reciba como entrada un proceso y lo ejecute con prioridad
10.

## 2 - Estado de los procesos

Crear un script que ejecute el comando `ps aux` y lo guarde en un archivo
llamado `snapshot.txt`.

## 3 - Top 5

Crear un script que ejecute el comando `ps aux` y guarde los primeros 5
elementos en un archivo llamado `top5.txt`.

## 4 - Printer

Crear un script que reciba dos argumentos, un string s y un numero n e
imprima s cada n segundos.

## 5 - Port killer

Crear un script que verifique si un puerto está en uso y, en caso afirmativo,
muestre qué proceso lo está utilizando. Si el usuario presiona enter lo mata,
si presiona cualquier otra tecla no.

## 6 - Memory monitor

Crear un script que, utilizando el comando `ps aux`, obtenga los 10 procesos que
mas memoria utilizan y los guarde en un archivo `memory.txt`

## 7 - Printer

Crear un script que use el script printer.sh del ejercicio 4 en background con prioridad 19 e imprima en consola el id del proceso. Luego de 20 segundos
cambiar la prioridad a 5 y esperar a que el usuario presione enter para matar el proceso de printer.sh.

## 8 - Process finder

Crear un script que busque procesos por nombre y muestre su PID, usuario y uso de memoria.

## 9 - Process killer 

Crear un script que busque procesos por nombre y lo mate.

## 10 - CPU Alert

Crear un script que alerte si el uso de la CPU supera el 80% utilizando `top`.

