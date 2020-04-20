AbleC: Reliably composable language extensions for C
====================================================

AbleC is a C11 compiler front-end that supports modular definition and reliable composition of language extensions. AbleC is implemented using [Silver](https://github.com/melt-umn/silver).

## Authors
- Travis Carlson, University of Minnesota, carl4980@umn.edu
- Lucas Kramer, University of Minnesota, krame505@umn.edu,
  ORCID: https://orcid.org/0000-0001-6719-6894
- Eric Van Wyk, University of Minnesota, evw@umn.edu,
  ORCID: https://orcid.org/0000-0002-5611-8687

Past contributors include Ted Kaminski.

## Releases
- Release 0.1.0: made in April, 2020

## Related publications

ableC is the topic of our paper "Reliable and Automatic Composition of
Language Extensions to C: The ableC Extensible Language Framework"
that appeared at OOPSLA 2017. See DOI http://doi.acm.org/10.1145/3138224.

Getting started
---------------

**Step 1: Environment**

To build and use AbleC, you will need the following dependecies:

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


## Websites and repositories

Software downloads, documentation, and related papers are available on the
Melt group web site at http://melt.cs.umn.edu/.

Actively-developed versions of this software are available on GitHub at
https://github.com/melt-umn/ableC.

Archival versions of this software are permanently available on the Data
Repository of the University of Minnesota at https://doi.org/10.13020/D6VQ25.

Other software and artifacts are also archived there and can be
reached from this persistent link: http://hdl.handle.net/11299/206558.


## Acknowledgements
We are very grateful to the National Science Foundation, the McKnight
Foundation, DARPA, the University of Minnesota, and IBM for funding
different aspects of our research and the development of Silver and
Copper.


## Licensing 
ableC is distributed under the GNU Lesser General Public
License.  See the file LICENSE for details of this licenses.  More
information can be found at http://www.gnu.org/licenses/.
