(defmodule tut09-app
  (behaviour application)
  (export all))

(defun start (_type _args)
  (tut09-sup:start_link))

(defun stop (_state)
  'ok)
