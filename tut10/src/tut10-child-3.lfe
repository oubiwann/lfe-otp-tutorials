(defmodule tut10-child-3
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
(defun children-modules () '(tut10-grandchild-1 tut10-grandchild-2))

;;; supervisor implementation

(defun start_link ()
  (start_link '()))

(defun start_link (_args)
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

(defun get-child-spec (mod)
  (let* ((child-id mod)
         (start-mod mod)
         (start-func 'start_link)
         (start-args '())
         (start-data `#(,start-mod ,start-func ,start-args))
         (restart-type 'permanent)
         (shutdown-time 3000)
         (process-type 'worker)
         (upgrade-modules `(,mod)))
    `#(,child-id
       ,start-data
       ,restart-type
       ,shutdown-time
       ,process-type
       ,upgrade-modules)))
