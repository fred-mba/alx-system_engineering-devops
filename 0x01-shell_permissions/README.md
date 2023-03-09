0-iam_betty: su betty ==> switches the current user to the user (betty).

1-who_am_i: whoami ==> prints the effective username of the current user.

2-groups: groups ==> prints all the groups the current user is part of.

3-new_owner: chown betty hello ==> changes the owner of the file (hello) to the user (betty).

4-empty: touch hello ==> creates an empty file called (hello).

5-execute: chmod u+x hello ==> adds execute permission to the owner of the file (hello).

6-multiple_permissions: ug+x,o+r hello ==> adds execute permission to the owner and the group owner, and read permission to other users, to the file(hello).

7-everybody: chmod ugo+x hello ==> adds execution permission to the owner, the group owner and the other users, to the file hello.

8-James_Bond: chomd 007 hello ==> sets NO permissions to the owner, NO permissions to the group, and all the permisions the world.

9-John_Doe: chomd 753 hello ==> sets the mode of the file hello to this format [-rwxr-x-wx 1 julien julien 23 Sep 20 14:25 hello].

10-mirror_permissions: chmod --reference=olleh hello ==> sets the mode of the file hello the same as olleh’s mode.

