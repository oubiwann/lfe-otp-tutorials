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

```lisp
> (set st (tut00:lambda-state 0))
#Fun<tut00.0.29422318>
> (set st (funcall st 'add))
#Fun<tut00.0.29422318>
> (funcall st 'amount?)
1
```

```lisp
> (set st (spawn 'tut00 'process-state `(,(self) 0)))
<0.35.0>
> (! st 'add)
add
> (! st 'amount?)
amount?
> (c:flush)
Shell got 1
ok
```

### 1 - Converting simple server to ``gen_server``

```bash
$ cd tut01
$ make repl
```

```lisp
> (tut01:start))
#(ok <0.32.0>)
> (tut01:add)
ok
> (tut01:amount?)
1
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
