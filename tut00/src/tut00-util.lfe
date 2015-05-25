(defmodule tut00-util
  (export all))

(defun get-version ()
  (lutil:get-app-version 'tut00))

(defun get-versions ()
  (++ (lutil:get-versions)
      `(#(tut00 ,(get-version)))))
