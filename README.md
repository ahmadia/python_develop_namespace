Example of supporting development of directory-decomposed namespace
packages with optional setuptools support 

Please read this file in its entirety before executing any of the
included scripts.

This directory contains the package `foo` and `foo-bar`, an extension
to `foo` that provides the optional `bar` module. 

There are two mechanisms in which these packages can be installed.  In
the first, the user installs `foo`, then `foo-bar`, as system
packages.  In the second, the packages are installed as *development*
packages.  That is, the path is modified with a `.pth` file pointing
back to the development directory these packages live in, allowing
development changes in a version-controlled directory to be quickly
tested.

These packages **must not be installed as eggs in order to work
correctly**.  This means that when using the install command, at least
the `--root` flag and probably also:
`--single-version-externally-managed`.

There are two install scripts provided, `develop.sh` and `install.sh`,
as well as the test script: `test.py`

If you have `pip` installed, you can test how these work on your
system by running these scripts, which will install to your `--user` directory:

```
./install.sh
./test.py
```

or

```
./develop.sh
./test.py
# make changes to foo-bar/foo/bar/bar.py and re-run test.py
```

Note that the install tools themselves don't rely on setuptools,
however the `__init__.py` files will prefer using setuptools if
available to adjust the namespace path, as this appears to work more
robustly with `setuptools` development mode, which would otherwise be
unsupported.

A final caution: **These installation modes are not compatible, and
running one installer may not override the other**.   If after running
one of the installers, you see unwanted behavior,  you can delete
the offending directory displayed when you execute `./test.py` or
modify the `easy-install.pth` file described by the installer to
correct this.
