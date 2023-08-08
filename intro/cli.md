# CLI 

## What is a cli?

CLI is a command line program that accepts text input to execute operating 
system functions.

In linux, the command line uses the bash language

## Bash Features

### Echo command

Echo is a command that is useful for printing into the stdout (the terminal 
console), similar to Java's `System.out.println` or python's `print`

![echo](./assets/echo.png)

### Brace expansion

Brace expansion, generates a set of alternative combinations.

``` bash
$ echo a{p,c,d,b}e
# ape ace ade abe

$ echo {a,b,c}{d,e,f}
# ad ae af bd be bf cd ce cf
```

It also works with files

```bash
$ echo {1..10}
# 1 2 3 4 5 6 7 8 9 10
```

### Batch mode

To execute multiple commands from a single line, we can use batch mode. To
execute commands in batch mode they must be separated by `;` or on
separate lines.

```bash
$ echo "Hello world"; echo "Hello again"
```

Or

```bash
$ echo "Hello world"
  echo "Hello again"
```

In this case the commands will be executed sequentially. If any of the commands
fail, the others will be executed anyways.

### Concurrent mode

To execute multiple commands at the same time, we can use concurrent mode. To
execute commands in concurrent mode they must be separated by `&`.

```bash
$ echo "Hello world" & echo "Hello at the same time"
```

In this case the commands will be executed in parallel.

### Conditional execution

Sometimes, we want to run commands sequentially but ensuring each command
doesn't fail.

```bash
$ command_that_can_fail && echo "Success" || echo "Something went wrong"
```

### Sleep command

Sleep is a command that as the name says, it sleeps. Is useful when we want to 
wait some time.

```bash
sleep 30
```

Sleeps for 30 seconds

```bash
sleep 0.5h
```

Sleeps for half an hour