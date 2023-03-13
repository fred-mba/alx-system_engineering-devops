## Shell_redirections Keynotes

0-hello_world: echo "Hello, World" ==> Prints “Hello, World”, followed by a new line to the standard output.

1-confused_smiley: echo "\"(Ôo)'" displays a confused smiley "(Ôo)'. The backslash (\) ==> prevents the next character from being interpreted as a special character.

2-hellofile: less /etc/passwd ==> Displays the content of the /etc/passwd file

3-twofiles: cat /etc/passwd /etc/hosts ==> Displays the content of the duos.

4-lastlines: tail -n 10 /etc/passwd ==> Displays the last 10 lines of /etc/passwd file.

5-firstlines: head -n 10 /etc/passwd ==> Displays the last 10 lines of /etc/passwd.

6-third_line: head -3 iacta | tail +3 ==> displays the third line of the file iacta.

7-file: echo "Best School">"\*\\'"Best School"\'\\*$\?\*\*\*\*\*:)" ==> creates a file named exactly \*\\'"Best School"\'\\*$\?\*\*\*\*\*:) containing the text Best School ending by a new line

8-cwd_state: ls -la > ls_cwd_content ==> writes the command ls -la into the file. The (>) allows overwrite rights for exiting file, and if the file don't exist, it's created.

9-duplicate_last_line:cat iacta | tail -1 >> iacta ==> displays the contents of the file iacta, pipes the result to tail which picks only the last line through -1 and overwrites it on the same file.

10-no_more_js: find . -name (*.js) -type f -delete ==> Find all .js named files that are in the working directory and subdirectories, then delete them out. the -delete command must come at the end. The (rm -r *.js) would not be effective on the sub-directories. 

11-directories:ls -Rl | grep ^d | wc -l ==> The first command input lists all directories in the long format. Using -R flag, the sub-directories are included. The result is pipped in grep for examination. The (^d) flag examines each directory from the beggining. The qualified directories are sent to wc -l for counting.

12-newest_files: ls -t | head ==> displays newest files in the current directory. The -t flag sorts the files in basis of time.

13-unique: sort | uniq -u ==> takes lists of inputs and prints words that appear exactly once. The -u flag prints exactly unique lines.

14-findthatword: grep "root" /etc/passwd ==> displays lines containing the pattern “root” from the file /etc/passwd. grep command examines data it receives from input and outputs lines contains specific pattern.

15-countthatword: grep "bin" /etc/passwd | wc -l ==> The output from grep command, is piped and counted down to the command wc -l displaying the number of lines containing the pattern "bin". 

16-whatsnext: grep -A3 root /etc/passwd ==> displays lines containing "root" pattern and three lines after them. -A1 will print one line after the pattern, A2 will print two lines after the pattern, and likewise for -A3.

17-hidethisword: grep -v "bin" /etc/passwd ==> Know us "negative matching with grep": prints only lines that don't match the pattern given.

18-letteronly:

19-AZ:

20-hiago:

21-reverse:

22-users_and_homes:

