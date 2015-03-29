# LFE OTP Tutorials

## Getting Started

* Make sure Erlang is installed and ``erl`` is in your ``$PATH``.
* Make sure ``git `` is installed.
* Download the code: ``git clone https://github.com/oubiwann/lfe-otp-tutorials.git``

Each tutorial is its own mini-project, complete with source code, ``Makefile``,
etc. As such, there are initial steps you will take with each tutorial (e.g.,
downloading dependencies and compileing the source).

## 1 - Echo Server: Intro to OTP

```bash
$ cd tut01
$ make repl
```

```lisp
> (tut01:start)
#(ok <0.32.0>)
> (tut01:echo "Hey there")
#(msg "Hey there")
ok
```

## 2 - Splitting API and Callbacks

```bash
$ cd tut02
$ ln -s ../tut01/deps .
$ make repl
```

```lisp
> (tut02:start)
#(ok <0.32.0>)
> (tut02:echo "Another test ...")
#(msg "Another test ...")
ok
```

