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

9-divide_and_rule: echo "$((POWER\DIVIDE))" ==> prints the result of POWER divided by DIVIDE, followed by a new line.

10-love_exponent_breath: echo "$((BREATH**LOVE))" displays the result of BREATH to the power LOVE.

11-binary_to_decimal: echo $((2#$BINARY)) ==> converts a number stored in BINARY environment from base 2 to base 10. The syntax for conversion is $((base_of_interest#numbertoconvert)) 

12-combinations: echo {a..z}{a..z} | tr ' ' '\n' | grep -v oo ==> is a piped code to print all possible combinations of two letters, in the sorted order from a-z except oo.Without the piped tr, the command returns empty, hence the tr deletes the oo characters and outputs them all on new line.

13-print_float: printf "%.2f\n" $NUM prints a number in NUM variable to 2decimal places followed by a new line. Trying echo in place of printf will only output the typed input.
