(defmodule tut01-callback
  (export all))

;;; config functions

(defun unknown-command () #(error "Unknown command."))

;;; callback implementation

(defun init (initial-state)
  `#(ok ,initial-state))

(defun handle_cast
  (('increment state-data)
    `#(noreply ,(+ 1 state-data)))
  (('decrement state-data)
    `#(noreply ,(- state-data 1))))

(defun handle_call
  (('amount _caller state-data)
    `#(reply ,state-data ,state-data))
  ((message _caller state-data)
    `#(reply ,(unknown-command) ,state-data)))

(defun terminate (_reason _state-data)
  'ok)
