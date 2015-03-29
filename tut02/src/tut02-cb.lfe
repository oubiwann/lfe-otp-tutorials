(defmodule tut02-cb
  (behaviour gen_server)
  (export (init 1)
          (handle_call 3)
          (handle_cast 2)
          (handle_info 2)
          (terminate 2)
          (code_change 3)))

(defun init (args)
  (let ((initial-state '()))
    `#(ok ,initial-state)))

(defun handle_call (message caller state)
  (lfe_io:format "~p~n" `(,message))
  `#(reply ok ,state))

(defun handle_cast (message state)
  `#(noreply ,state))

(defun handle_info (info state)
  `#(noreply ,state))

(defun terminate (reason state)
  'ok)

(defun code_change (old-version state extra)
  `#(ok ,state))

