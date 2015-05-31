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

(defun inc ()
  (gen_server:cast (server-name) 'increment))

(defun dec ()
  (gen_server:cast (server-name) 'decrement))

(defun amount? ()
  (gen_server:call (server-name) 'amount))

