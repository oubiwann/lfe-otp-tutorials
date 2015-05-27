(defmodule tut09-util
  (export all))

(defun get-version ()
  (lutil:get-app-version 'tut09))

(defun get-versions ()
  (++ (lutil:get-versions)
      `(#(tut09 ,(get-version)))))
