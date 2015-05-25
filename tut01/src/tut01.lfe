(defmodule tut01
  (behaviour gen_server)
  (export all))

;;; config functions

(defun server-name () (MODULE))
(defun callback-module () 'tut01-callback)
(defun initial-state () 0)
(defun register-name () `#(local ,(server-name)))

;;; gen_server implementation

(defun start ()
  (let ((init-args (initial-state))
        (genserver-opts '()))
    (gen_server:start (register-name)
                      (callback-module)
                      init-args
                      genserver-opts)))

;;; our server API

(defun add ()
  (gen_server:cast (server-name) 'add))

(defun amount? ()
  (gen_server:call (server-name) 'amount))

