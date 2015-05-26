(defmodule tut01-callback
  (export all))

;;; config

(defun unknown-command () #(error "Unknown command."))

;;; callback implementation

(defun init (initial-state)
  `#(ok ,initial-state))

(defun handle_cast
  (('add state-data)
    `#(noreply ,(+ 1 state-data))))

(defun handle_call
  (('amount _caller state-data)
    `#(reply ,state-data ,state-data))
  (('stop _caller state-data)
    `#(stop shutdown ok state-data))
  ((message _caller state-data)
    `#(reply ,(unknown-command) ,state-data)))

(defun terminate (_reason _state-data)
  'ok)
