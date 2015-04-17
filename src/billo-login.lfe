(defmodule billo-login
  (export all))

(defun validate (arg-data)
  (lfest-text-resp:ok (io_lib:format "~p~n" (list arg-data))))

(defun out (arg-data)
  "This is called by YAWS when the requested URL matches the URL specified in
  the YAWS config (see ./etc/yaws.conf) with the 'appmods' directive for the
  virtual host in question.

  In particular, this function is intended to handle all traffic for this
  app."
  (lfest:out-helper arg-data #'billo-login-routes:routes/3))
