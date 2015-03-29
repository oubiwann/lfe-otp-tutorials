(defmodule tut02
  (behaviour gen_server)
  (export (start_link 0)
          (echo 1)))

(defun server-name ()
  'tut02)

(defun start ()
  (let ((server-name `#(local ,(server-name)))
        (callback-module 'tut02-cb)
        (init-args '())
        (genserver-opts '()))
  (gen_server:start
    server-name callback-module init-args genserver-opts)))

(defun echo (message)
  (gen_server:call
    (server-name) `#(msg ,message)))

