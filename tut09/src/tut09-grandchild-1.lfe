(defmodule tut09-grandchild-1
  (behaviour gen_server)
  (export all))

;;; config functions

(defun server-name () (MODULE))
(defun callback-module () (MODULE))
(defun initial-state () 0)
(defun genserver-opts () '())
(defun register-name () `#(local ,(server-name)))
(defun unknown-command () #(error "Unknown command."))

;;; gen_server implementation

(defun start_link ()
  (gen_server:start_link (register-name)
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

(defun handle_info
  ((`#(EXIT ,caller normal) state-data)
   `#(noreply ,state-data))
  ((`#(EXIT ,caller ,reason) state-data)
   `#(noreply ,state-data))
  ((msg state-data)
   `#(noreply ,state-data)))

(defun terminate (_reason _state-data)
  'ok)
