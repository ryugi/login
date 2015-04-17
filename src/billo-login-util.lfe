(defmodule billo-login-util
  (export all))

(defun get-version ()
  (lutil:get-app-version 'billo-login))

(defun get-versions ()
  (++ (lutil:get-versions)
      `(#(billo-login ,(get-version)))))
