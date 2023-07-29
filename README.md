# badarith

`badarith` provides a tool and a library (`libbadmath`) designed
to perform badly implemented arithmetic operations.

> NOTE: this is intended to be a simple example of the workings of a shared library, and a bad one at that.
> It is not meant to be a serious project, only to help others in understanding that subject.

`badarith` depends on the provided `libbadmath` library to perform its calculations.
`libbadmath` is designed not only to be used by `badarith`, but to be useful to other projects as well.
To that end, we promise to keep backwards compatibility within the same major version of the library.
`libbadmath` adheres to [semantic versioning](http://semver.org/),
making it easy for developers to know whether their programs will work with newer library versions.

## License

Both `libbadmath` and `badarith` are licensed under the MIT license.

## Getting Started

### Installing from source

After unpacking the source tarball, enter the source directory and execute:

```sh
make
sudo make install
```

The default `prefix` is `/usr/local`,
but `Makefile` supports most of the standard targets and conventions as those prescribed for GNU programs.
As such, it will honor `prefix` and will suport staged installs, by honoring `DESTDIR` also, for example.
