(defmodule tut02-util
  (export all))

(defun get-version ()
  (lutil:get-app-version 'tut02))

(defun get-versions ()
  (++ (lutil:get-versions)
      `(#(tut02 ,(get-version)))))
