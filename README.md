httpio_bbc
==========

HTTP resources as random-access file-like objects

httpio is a small Python library that allows you to access files
served over HTTP as file-like_ objects (which is to say that they
support the interface of the standard library's BufferedIOBase_
class). It differs from libraries like ``urllib`` and ``requests`` in
that it supports ``seek()`` (which moves an internal pointer), and
that ``read()`` makes a request with the ``Range`` header set. It also
supports caching of contents using a configurable block size, and will
reuse TCP connections where possible.

This is a fork of the original project at https://github.com/barneygale/httpio,
maintained by BBC R&D's Cloudfit Production team, with some additional
functionality we needed, and applying our (opinionated!) CI and repo management
processes.

Installation
------------

This fork isn't published to PyPI, but it can be installed directly
from the repo, either by cloning the repo and running `make install`
or directly with `pip install git+ssh://git@github.com/bbc/httpio`
(note that the versioning won't work in the latter case, it will be v0.0.0).

Alternatively for internal users the package is also published to
R&D Artifactory in the ap-python repo.

Usage
-----

```python

    import zipfile
    import httpio_bbc as httpio

    url = "http://some/large/file.zip"
    with httpio.open(url) as fp:
        zf = zipfile.ZipFile(fp)
        print(zf.namelist())
```

Development
-----------

This repository uses a library of makefiles, templates, and other tools for
development tooling and CI workflows.
To discover operations that may be run against this repo, run `make` in the top
level of the repo.

Testing
-------

To run the unittests for this package in a docker container, run `make test` in
the top level of the repository.

Continuous Integration
----------------------

This repository includes [GitHub Actions workflows](./.github/workflows/) for CI. The shared workflows are centrally managed and should not be modified.

A Makefile is provided at the top-level of the repository to run common tasks.
Run `make`` in the top directory of this repository to see what actions are available.
