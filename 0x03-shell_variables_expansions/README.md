## Shell Variables and Expansions-Keynotes

0-alias: alias ls="rm *" ==> assigns variable ls the rm * command, which can be accessed by typing ls as temporally alternative.

1-hello_you: echo hello "$USER" ==> prints hello user where the user is the current Linux user. echo "hello $USER" will print the same output

2-path: export PATH=/action:$PATH ==> The directory (/action) is added to the path, so it's the first location searched. export command transfers the path from child to the parent.

3-paths:

4-global_variables: printenv ==> lists global(environment) variables.

5-local_variables: set ==> The build-in fuction (set) without any option lists all local and global variables and functions.

6-create_local_variable: BEST="School" ==> creates a new local variable. Variable are case sensitive and written in uppercase by default. 

7-create_global_variable: export BEST="School" ==> creates a new local variable. The variable is tranfered to the parent sub-shell. Any changes made in the child process does not affect the parent shell. 

8-true_knowledge: echo "$((128 + TRUEKNOWLEDGE))" ==> prints the result of the addition of 128 with the value stored in the environment variable TRUEKNOWLEDGE, followed by a new line.

9-divide_and_rule:

10-love_exponent_breath:

11-binary_to_decimal:

12-combinations:

13-print_float:
