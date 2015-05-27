(defmodule tut10-app
  (behaviour application)
  (export all))

(defun start (_type _args)
  (tut10-sup:start_link))

(defun start_phase
  (('phase_1 'normal _args)
   (io:format "Start phase 1 ...~n"))
  (('phase_2 'normal _args)
   (io:format "Start phase 2 ...~n"))
  (('phase_3 'normal _args)
   (io:format "Start phase 3 ...~n"))
  ((phase type _args)
   (io:format "Unknown start phase (type): ~p (~p)~n" `(,phase ,type))))

(defun stop (_state)
  'ok)
