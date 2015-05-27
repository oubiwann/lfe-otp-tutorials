(defmodule tut10-sup
  (behaviour supervisor)
  (export all))

;;; config functions

(defun server-name () (MODULE))
(defun callback-module () (MODULE))
(defun init-args () '())
(defun register-name () `#(local ,(server-name)))
(defun max-terminations () 3)
(defun termination-window () 3600)
(defun restart-strategy () 'one_for_one)
(defun restart-data () `#(,(restart-strategy)
                          ,(max-terminations)
                          ,(termination-window)))
(defun children-modules () '(#(child-1 tut10-child-1 worker)
                             #(child-2 tut10-child-2 worker)
                             #(child-3 tut10-child-3 supervisor)))

;;; supervisor implementation

(defun start ()
  (start_link))

(defun start_link ()
  (supervisor:start_link (register-name)
                         (callback-module)
                         (init-args)))

(defun stop ()
  (exit (whereis (server-name)) 'shutdown))

;;; callback implementation

(defun init (_args)
  `#(ok #(,(restart-data)
          ,(get-children))))

(defun get-children ()
  (lists:map #'get-child-spec/1 (children-modules)))

(defun get-child-spec
  ((`#(,child-id ,mod ,process-type))
   (let* ((start-mod mod)
          (start-func 'start_link)
          (start-args '())
          (start-data `#(,start-mod ,start-func ,start-args))
          (restart-type 'permanent)
          (shutdown-time 3000)
          (upgrade-modules `(,mod)))
     `#(,child-id
        ,start-data
        ,restart-type
        ,shutdown-time
        ,process-type
        ,upgrade-modules))))

