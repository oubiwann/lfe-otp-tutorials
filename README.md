# LFE OTP Tutorials

## Getting Started

* Make sure Erlang is installed and ``erl`` is in your ``$PATH``.
* Make sure ``git `` is installed.
* Download the code: ``git clone https://github.com/oubiwann/lfe-otp-tutorials.git``

Each tutorial is its own mini-project, complete with source code, ``Makefile``,
etc. As such, there are initial steps you will take with each tutorial (e.g.,
downloading dependencies and compileing the source).

## Intro to OTP: Servers

### 1 - Simple Echo Server

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

### 2 - Splitting API and Callbacks

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

### 3 - State

```bash
$ cd tut03
$ ln -s ../tut01/deps .
$ make repl
```

```lisp
> (tut03:start)
#(ok <0.32.0>)
> (tut03:echo "Testing the 3rd ...")
Passed message: #(msg "Testing the 3rd ...")
New State: #(state 1)
ok
> (tut03:echo "Testing ...")
Passed message: #(msg "Testing ...")
New State: #(state 2)
ok
> (tut03:echo "Testing ...")
Passed message: #(msg "Testing ...")
New State: #(state 3)
ok
> (tut03:echo "Testing ...")
Passed message: #(msg "Testing ...")
New State: #(state 4)
ok
> (tut03:echo "Testing ...")
Passed message: #(msg "Testing ...")
New State: #(state 5)
ok
> (tut03:echo "Testing ...")
Passed message: #(msg "Testing ...")
New State: #(state 6)
ok
```

## Supervisors

TBD

## Applications

TBD

## Finite State Machines

TBD

## Events

TBD

