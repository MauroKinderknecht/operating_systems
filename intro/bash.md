# Bash

## What is Bash?

Bash, which stands for Bourne Again SHell, is a Unix shell and command
language. It is the default shell for most Linux distributions and macOS.
Bash scripts allow users to automate tasks and execute multiple commands in 
sequence.

## Writing a Bash Script

A Bash script is a plain text file containing a series of commands. To create a
Bash script:

1. Use a text editor like `nano` or `vim` to create a file, e.g., `myscript.sh`
2. Add your commands to the file
3. Save and close the file
4. Make the script executable with the command `chmod +x myscript.sh`
5. Run the script using `./myscript.sh`

## Bash Shebang

The shebang (`#!`) at the beginning of a script indicates the interpreter for
executing the script. For Bash scripts, the shebang is typically:

```bash
#!/bin/bash
```

## Variables

In Bash, variables are used to store data. To declare a variable:

```bash
#!/bin/bash

name="John"
```

To access the value of a variable, use $:

```bash
#!/bin/bash

echo $name
```

### Arguments

Arguments can be passed to a Bash script after the script name. Inside the
script, they are accessed as `$1`, `$2`, etc.

```bash
#!/bin/bash

echo "Hello, $1!"
```

Running `./myscript.sh Alice` would output "Hello, Alice!"


### Other special variables

One special variable,`$@` refers to all the arguments passed to a script or 
function. Unlike `$1`, `$2`, etc., which refer to specific arguments, `$@` 
refers to all of them at once.

```bash
#!/bin/bash

echo "Arguments received: $@"
```

If you run the script with `./myscript.sh arg1 arg2 arg3`, it will output
"Arguments received: arg1 arg2 arg3"

If you wanted to iterate through all arguments, you can use for loops to do it:

```bash
#!/bin/bash

for arg in "$@"
do
    echo "Processing argument: $arg"
done
```

There is another set of special variables, `$?`, `$!` and `$$` that refer to
proceses:

- `$?` stores the exit status of the previously executed command. This can be
used to check if a step in our bash script has finished successfully.
- `$!` stores the process id of the previously executed command. This can be
used to monitor or kill background processes in our script.
- `$$` stores the process id of the current shell.

```bash
#!/bin/bash
echo "Starting a background process..."
sleep 30 &
echo "The PID of the last background command is: $!"
```

## Boolean Operations and Tests

### Logical Operations

1. **Logical AND (`&&` or `-a`)**: Evaluates to true if both operands are true.

    ```bash
    #!/bin/bash

    if [ $a -eq 5 ] && [ $b -eq 10 ]
    then
        echo "Both conditions are true"
    fi
    ```

2. **Logical OR (`||` or `-o`)**: Evaluates to true if either operand is true.

    ```bash
    #!/bin/bash

    if [ $a -eq 5 ] || [ $b -eq 15 ]
    then
        echo "At least one condition is true"
    fi
    ```

3. **Logical NOT (`!`)**: Evaluates to true if the operand is false.

    ```bash
    #!/bin/bash

    if [ ! $a -eq 10 ]
    then
        echo "a is not 10"
    fi
    ```

### Integer Comparisons

1. **Equal (`-eq`)**: True if the integers are equal.

    ```bash
    #!/bin/bash

    if [ $a -eq $b ]
    then
        echo "a is equal to b"
    fi
    ```

2. **Not Equal (`-ne`)**: True if the integers are not equal.

    ```bash
    #!/bin/bash

    if [ $a -ne $b ]
    then
        echo "a is not equal to b"
    fi
    ```

3. **Greater Than (`-gt`)**: True if the first integer is greater than the second.

    ```bash
    #!/bin/bash

    if [ $a -gt $b ]
    then
        echo "a is greater than b"
    fi
    ```

4. **Less Than (`-lt`)**: True if the first integer is less than the second.

    ```bash
    #!/bin/bash

    if [ $a -lt $b ]
    then
        echo "a is less than b"
    fi
    ```

5. **Greater Than or Equal (`-ge`)**: True if the first integer is greater than or equal to the second.

    ```bash
    #!/bin/bash

    if [ $a -ge $b ]
    then
        echo "a is greater than or equal to b"
    fi
    ```

6. **Less Than or Equal (`-le`)**: True if the first integer is less than or equal to the second.

    ```bash
    #!/bin/bash

    if [ $a -le $b ]
    then
        echo "a is less than or equal to b"
    fi
    ```

### String Comparisons

1. **Equal (`=` or `==`)**: True if the strings are equal.

    ```bash
    #!/bin/bash

    if [ "$str1" = "$str2" ]
    then
        echo "str1 is equal to str2"
    fi
    ```

2. **Not Equal (`!=`)**: True if the strings are not equal.

    ```bash
    #!/bin/bash

    if [ "$str1" != "$str2" ]
    then
        echo "str1 is not equal to str2"
    fi
    ```

3. **String Null (`-z`)**: True if the string is null (empty).

    ```bash
    #!/bin/bash

    if [ -z "$str" ]
    then
        echo "str is null"
    fi
    ```

4. **String Not Null (`-n`)**: True if the string is not null.

    ```bash
    #!/bin/bash

    if [ -n "$str" ]
    then
        echo "str is not null"
    fi
    ```

### File Tests

There are many file test operators in Bash, but here are a few common ones:

1. **File Exists (`-e`)**: True if the file exists.

    ```bash
    #!/bin/bash

    if [ -e "filename" ]
    then
        echo "File exists"
    fi
    ```

2. **File is a Directory (`-d`)**: True if the file is a directory.

    ```bash
    #!/bin/bash

    if [ -d "dirname" ]
    then
        echo "It's a directory"
    fi
    ```

3. **File is Readable (`-r`)**: True if the file is readable.

    ```bash
    #!/bin/bash

    if [ -r "filename" ]
    then
        echo "File is readable"
    fi
    ```

## For loop

The for loop in Bash is used to iterate over a series of values. There are a
few different ways to use for loops in Bash:

- Iterating over a sequence of numbers:

```bash
#!/bin/bash

for i in {1..5}
do
    echo "Number $i"
done
```

- Iterating over command output:

```bash
#!/bin/bash

for file in $(ls)
do
    echo "File: $file"
done
```

- Iterating over an array:

```bash
#!/bin/bash

fruits=("apple" "banana" "cherry")
for fruit in "${fruits[@]}"
do
    echo "Fruit: $fruit"
done
```

## While loop

The while loop in Bash is used to execute a block of commands as long as a 
test condition is true.

```bash
#!/bin/bash

count=1
while [ $count -le 5 ]
do
    echo "Iteration $count"
    ((count++))
done
```

## If conditional

The if statement in Bash is used to execute a block of commands based o
whether a test condition is true or false.

```bash
#!/bin/bash

number=5
if [ $number -eq 5 ]
then
    echo "Number is 5"
fi
```

The if-else statement can be used to execute one block of commands if a test condition is true and another block if it's false.

```bash
#!/bin/bash

number=6
if [ $number -eq 5 ]
then
    echo "Number is 5"
else
    echo "Number is not 5"
fi
```

### `set` Command

The `set` command in Bash is used to set or unset shell options and positional 
parameters. It can change the values of shell options and set the positional 
parameters, or display the names and values of shell variables.

1. **Setting Shell Options**: The `set` command can be used to enable or 
    disableshell options. For example:
    - `set -e`: This option will cause the script to exit immediately if any
    command returns a non-zero exit status (an error).
    - `set -u`: Treats unset variables as an error when substituting.
    - `set -x`: Prints each command before it's executed, which is useful for
    debugging.

    You can combine options, like `set -eux`.

2. **Unsetting Shell Options**: You can disable options by prefixing them with
    a `+` instead of a `-`. For example:
    - `set +e`: Disables the behavior of exiting on error.

3. **Positional Parameters**: You can use `set` to set positional parameters.
    ```bash
    #!/bin/bash

    set -- "arg1" "arg2" "arg3"
    echo $1  # Outputs: arg1
    ```

4. **Displaying Options and Variables**: Running `set` without any options will
display a list of all variables (including environment variables) and functions.

### The `read` Command

The `read` command in Bash is used to read input from the user or a file. It's
commonly used in scripts to get input from the user, but it's also powerful 
when used in loops to process file content line by line.

1. **Basic Usage**: The simplest form is reading input into a variable.
    ```bash
    #!/bin/bash

    echo "Enter your name:"
    read name
    echo "Hello, $name!"
    ```

2. **Reading Multiple Inputs**: You can read multiple inputs by specifying
    multiple variables.
    ```bash
    #!/bin/bash

    echo "Enter first and last name:"
    read first_name last_name
    echo "Hello, $first_name $last_name!"
    ```

3. **Specifying a Prompt with `-p`**: Instead of using `echo`, you can specify
    a prompt directly with `read`.
    ```bash
    #!/bin/bash

    read -p "Enter your name: " name
    ```

4. **Silent Input with `-s`**: Useful for reading passwords without displaying
    them.
    ```bash
    #!/bin/bash

    read -sp "Enter your password: " password
    ```

5. **Setting a Timeout with `-t`**: You can specify a timeout, after which 
    `read` will give up.
    ```bash
    #!/bin/bash

    read -t 5 -p "You have 5 seconds to answer: " answer
    ```

6. **Reading Array with `-a`**: Reads input into an array.
    ```bash
    #!/bin/bash

    echo "Enter three numbers separated by space:"
    read -a numbers
    echo "First number: ${numbers[0]}"
    ```
