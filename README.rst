
About ``auto``
----------------------------------------------------------------

I am a Mac OS X program that watches for changes to a directory tree.  Whenever I see a change, I run a program.  For example, I can run ``make`` whenever you change your source code.

I am a Python script.  I use the `Mac OS X FSEvents library <http://developer.apple.com/library/mac/#documentation/Darwin/Reference/FSEvents_Ref/FSEvents_h/index.html>`_ to detect filesystem changes.

Usage
================================================================

    ``auto`` *path* *childProgram* [*childArg1* *childArg2* ...]

I run *childProgram*, passing in the *childArgN* arguments given.
Then I watch for any change to the directory tree rooted at *path*.
Whenever I see a change, I run *childProgram* with its arguments
again.

I wait 100 milliseconds after seeing a change before running the
program. Additional changes in that period won't make me run the
program extra times.

For example, I can run ``make`` whenever the current directory tree changes:

    ``auto . make``

Note that if `make` makes any changes to the current directory tree, I will immediately run it again.  If `make` is fast and idempotent, this shouldn't cause any trouble.  However, it's usually better to put your source code in a separate subdirectory from your build products.

For example, if you keep your source code in subdirectory `src`, I can run `make install` whenever the `src` tree changes:

    ``auto src make install``

I don't use the shell automatically, so if you need it, you have to ask for it:

    ``auto src sh -c 'cd build && make -f ../Makefile install'``

