(defmodule tut01
  (behaviour gen_server)
  ;; API
  (export (start 0)
          (echo 1))
  ;; gen_server callbacks
  (export (init 1)
          (handle_call 3)
          (handle_cast 2)
          (handle_info 2)
          (terminate 2)
          (code_change 3)))

(defun server-name ()
  'tut01)

;;;===================================================================
;;; API
;;;===================================================================

(defun start ()
  (let ((server-name `#(local ,(server-name)))
        (callback-module (MODULE))
        (init-args '())
        (genserver-opts '()))
  (gen_server:start
    server-name callback-module init-args genserver-opts)))

(defun echo (message)
  (gen_server:call
    (server-name) `#(msg ,message)))

;;;===================================================================
;;; gen_server callbacks
;;;===================================================================

(defun init (args)
  (let ((initial-state '()))
    `#(ok ,initial-state)))

(defun handle_call (message caller state)
  (lfe_io:format "~p~n" `(,message))
  `#(reply ok ,state))

(defun terminate (reason state)
  'ok)

(defun code_change (old-version state extra)
  `#(ok ,state))

