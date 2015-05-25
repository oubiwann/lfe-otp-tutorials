(defmodule tut00
  (export all))

(defun lambda-state (state-data)
  (lambda (msg)
    (case msg
      ('add
        (lambda-state (+ 1 state-data)))
      ('amount?
        state-data))))

(defun process-state (caller state-data)
  (receive
    ('add
      (process-state caller (+ 1 state-data)))
    ('amount?
        (! caller state-data)
        (process-state caller state-data))))
