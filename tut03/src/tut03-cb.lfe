(defmodule tut03-cb
  (behaviour gen_server)
  (export (init 1)
          (handle_call 3)
          (handle_cast 2)
          (handle_info 2)
          (terminate 2)
          (code_change 3)))

(include-lib "tut03/include/tut03.lfe")

(defun init (args)
  (let ((initial-state (make-state)))
    `#(ok ,initial-state)))

(defun handle_call (message caller state)
  (lfe_io:format "Passed message: ~p~n" `(,message))
  (let* ((new-count (+ 1 (state-count state)))
         (new-state (set-state state count new-count)))
    (lfe_io:format "New State: ~p~n" `(,new-state))
    `#(reply ok ,new-state)))

(defun terminate (reason state)
  'ok)

(defun code_change (old-version state extra)
  `#(ok ,state))

