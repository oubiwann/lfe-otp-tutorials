(defmodule tut01-server
  (behaviour gen_server)
  (export all))

;;; config functions

(defun server-name () (MODULE))
(defun callback-module () 'tut01-callback)
(defun initial-state () 0)
(defun genserver-opts () '())
(defun register-name () `#(local ,(server-name)))

;;; gen_server implementation

(defun start ()
  (gen_server:start (register-name)
                    (callback-module)
                    (initial-state)
                    (genserver-opts)))

;;; our server API

(defun add ()
  (gen_server:cast (server-name) 'add))

(defun amount? ()
  (gen_server:call (server-name) 'amount))

(defun stop ()
  (gen_server:call (server-name) 'stop))
