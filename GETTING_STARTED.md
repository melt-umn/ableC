Getting started
---------------

**Step 1: Environment**

To build and use AbleC, you will need the following dependencies:

 * Bash (our build script, among other things)
 * Java 8 or higher
 * Ant
 * GCC 4.7 or higher (first version to support C11. Earlier versions may work as long as no C11 features are used.)
 * Python (to run the ablec testsuite)
 * Nailgun (likewise)

This setup is achievable from Linux or Windows subsystem for Linux ("WSL") in Windows 10. MacOS sometimes has trouble with header files (system headers have Objective-C in them, which we cannot parse.)

**Step 2: Install Silver**

The [Silver install guide](http://melt.cs.umn.edu/silver/doc/install-guide/) can give full details, but the simplest approach is as follows:

1. Download [the latest development version of Silver](http://melt.cs.umn.edu/downloads/silver-dev/silver-latest.tar.gz).
2. Make sure you have a `~/bin/` directory (most distributions automatically put this in `PATH` once created and shell restarted).
3. Under `silver/support/bin` run `./install-silver-bin` to put the `silver` script in `~/bin`
4. (Optional, for AbleC test suite) Under `silver/support/nailgun` run `./install-sv-nailgun` to put some nailgun support scripts in `~/bin`.

**Step 3: Build AbleC**

Just run `./build` in this repository. This will produce `ableC.jar` which should function like a C compiler.

N.B. the currently released version will preprocess a `*.xc` file into a `*.c` one, or raise errors otherwise.

**Step 4: Run AbleC test suite**

```
cd testing
./runTests
```

There are presently a number of expected failures (this test suite tests conformance to C standards, etc, which AbleC is not perfect about yet.)

**Step 5: Use an extension with AbleC**

Our AbleC extensions are now distributed separately from AbleC. We have a convention of checking extensions out in a directory next to ableC.

```
$ ls
ableC extensions
$ cd extensions
$ git clone git@github.com:melt-umn/ableC-condition-tables.git
$ cd ableC-condition-tables
$ make all
```

This will build the extension, and test it.


## Where to go next

You can look at the [ableC tutorials](https://github.com/melt-umn/tutorials) for information about how to develop your own extensions.

Alternatively, we have developed several to experiment with::

* https://github.com/melt-umn/ableC-sqlite
* https://github.com/melt-umn/ableC-algebraic-data-types
* https://github.com/melt-umn/ableC-cilk
* https://github.com/melt-umn/ableC-interval
* https://github.com/melt-umn/ableC-vector
* https://github.com/melt-umn/ableC-halide
* https://github.com/melt-umn/ableC-closure
* https://github.com/melt-umn/ableC-templating
* https://github.com/melt-umn/ableC-string
* https://github.com/melt-umn/ableC-condition-tables

Additional extensions can be found at https://github.com/melt-umn.
Extension repository names are prefixed by ``ableC-`` so a
search will show them all.

Many of these extensions rely on the [silver-ableC](https://github.com/melt-umn/silver-ableC) extension to Silver in specifying their translation.
Setup information for silver-ableC can be found [here](https://github.com/melt-umn/silver-ableC/blob/develop/GETTING_STARTED.md).
