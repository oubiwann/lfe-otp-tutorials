(defmodule tut01-callback
  (export all))

;;; callback implementation

(defun init (initial-state)
  `#(ok ,initial-state))

(defun handle_cast
  (('add state-data)
    `#(noreply ,(+ 1 state-data))))

(defun handle_call
  (('amount _caller state-data)
    `#(reply ,state-data ,state-data))
  ((message _caller state-data)
    `#(reply #(error "Unknown command.") ,state-data)))

(defun terminate (_reason _state-data)
  'ok)

(defun code_change (old-version state-data extra)
  `#(ok ,state-data))

