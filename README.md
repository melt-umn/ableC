AbleC: Reliably composable language extensions for C
====================================================

AbleC is a C11 compiler front-end that supports modular definition and reliable composition of language extensions.


Migration Status
----------------

AbleC is currently in the process of being released from our internal subversion repository.

Current migration status:

 - [X] Host language ported over
 - [X] Git repository built, published
 - [X] Regex extension ported over
 - [X] Conditional table extension ported over
 - [ ] Algebraic datatype extension ported over
 - [X] Matrix extension ported over
 - [X] Mex extension ported over
 - [ ] Create a Jenkins-updated combined download for AbleC + Silver + Copper, to make things easier to get started.

We hope to have the above done by April ~~18th~~ 22nd at the latest.

Using AbleC
-----------

**Step 1: Environment**

To build AbleC, you need the following packages:

 * Bash (many of our scripts will use it)
 * Java 6+
 * Ant
 * GCC 4.7+ (first version to support C11. Earlier versions will work as long as no C11 features are used.)
 * Nailgun (to run ablec testsuite)
 * Python (to run ablec testsuite)
 * Have `~/bin/` in your path (to install the `silver` script, most distros put it in your path automatically if it's there)

**Step 2: Silver**

The [Silver install guide](http://code.google.com/p/silver/wiki/InstallGuide) can give full details, but the simplest approach is as follows:

 1. Download [the latest development version of Silver](http://melt.cs.umn.edu/downloads/silver-dev/silver-latest.tar.gz).
 2. Under `silver/support/bin` run `install-silver-bin` to put the `silver` script in `~/bin`

**Step 3: Build AbleC**

Just run `./build` in this repository. This will produce `ableC.jar` which should function like a C compiler.

N.B. the currently released version will preprocess a `*.xc` file into a `*.c` one, or raise errors otherwise.

**Step 4: Test with an extension, like regex**

```
cd extensions/regex
./build
java -jar ableC.jar example1.xc
```

This should produce `example1.pp_out.c`.



