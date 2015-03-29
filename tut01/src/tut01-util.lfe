(defmodule tut01-util
  (export all))

(defun get-version ()
  (lutil:get-app-version 'tut01))

(defun get-versions ()
  (++ (lutil:get-versions)
      `(#(tut01 ,(get-version)))))
