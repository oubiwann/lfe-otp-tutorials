(defmodule tut08-util
  (export all))

(defun get-version ()
  (lutil:get-app-version 'tut08))

(defun get-versions ()
  (++ (lutil:get-versions)
      `(#(tut08 ,(get-version)))))
