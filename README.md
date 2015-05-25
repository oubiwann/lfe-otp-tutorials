# LFE OTP Tutorials

## Introduction

This repository contains the code for the series of LFE tutorials on OTP which
were announced with [this blog post](http://blog.lfe.io/tutorials/2015/05/23/1720-new-series-lfe-otp-tutorials/),
with more being linked from there as they are completed.

## Getting Started

* Make sure Erlang is installed and ``erl`` is in your ``$PATH``.
* Make sure ``git `` is installed.
* Download the code: ``git clone https://github.com/oubiwann/lfe-otp-tutorials.git``

Each tutorial is its own mini-project, complete with source code, ``Makefile``,
etc. As such, there are initial steps you will take with each tutorial (e.g.,
downloading dependencies and compileing the source).


## Intro to OTP: Servers

### 0 - Closures and Message-passing Processes

```bash
$ cd tut00
$ make repl
```

### 1 - Simple Echo Server

```bash
$ cd tut01
$ make repl
```

```lisp
> (set `#(ok ,pid) (tut01:start))
#(ok <0.32.0>)
> (tut01:echo pid "What's up?")
#(msg "What's up?")
ok
```

### 2 - (Local) Named Servers

```bash
$ cd tut02
$ ln -s ../tut01/deps .
$ make repl

TBD

### 3 - (global) Named Servers

```bash
$ cd tut03
$ ln -s ../tut03/deps .
$ make repl

TDB

### 4 - Splitting API and Callbacks

```bash
$ cd tut04
$ ln -s ../tut04/deps .
$ make repl

```lisp
> (tut04:start)
#(ok <0.32.0>)
> (tut04:echo "Another test ...")
#(msg "Another test ...")
ok
```

### 5 - State

```bash
$ cd tut04
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

## Distributed LFE

### Two Nodes, Same Machine

### Two Nodes, Same LAN

### Two Nodes, Same Internet

### All Together Now

## Finite State Machines

TBD

## Events

TBD

## Supervisors

TBD

## Applications

TBD

## Hot-Swapping Code

TBD

## Releases

TBD

## A Complete Example

In the next set of tutorials we will be using what we've learned in all the
previous tutorials to build -- from the ground up -- a complete distributed
application. Each decision -- from architecture to behaviour options -- will be
discussed with nothing left out or gloseed over. By the end of this next series
you will have everything you need to build your own distributed applications in
LFE.
