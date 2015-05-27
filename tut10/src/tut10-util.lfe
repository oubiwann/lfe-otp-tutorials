(defmodule tut10-util
  (export all))

(defun get-version ()
  (lutil:get-app-version 'tut10))

(defun get-versions ()
  (++ (lutil:get-versions)
      `(#(tut10 ,(get-version)))))
