(defmodule billo-login-routes
  (export all))

;; Note that this module is intended to be used with a special YAWS deployment
;; where all third-party includes have been saved to a directory configured in
;; YAWS virtual host configuration.
(include-lib "html-macros.lfe")
(include-lib "lfest-macros.lfe")

(defroutes
  ('GET "/"
    (billo-login:validate arg-data))
  ('GET "/"
    (billo-login:validate arg-data))
  ;; When nothing matches, do this
  ('NOTFOUND
   (let* ((joined-path (++ "/" (string:join path "/")))
          (msg (++ "Unmatched route!~n~n"
                   "Path-info: ~p~n"
                   "joined path: ~p~n"
                   "arg-data: ~p~n~n"))
          (msg-args `(,path ,joined-path ,arg-data)))
    (io:format msg msg-args)
    (billo-login-content:four-oh-four
      (++ (strong "Unmatched Route: ") joined-path)))))

