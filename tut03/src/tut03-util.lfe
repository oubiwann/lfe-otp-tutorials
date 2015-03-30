(defmodule tut03-util
  (export all))

(defun app-name () 'tut03)

(defun get-version ()
  (lutil:get-app-version (app-name)))

(defun get-versions ()
  (++ (lutil:get-versions)
      `(#(,(app-name) ,(get-version)))))
