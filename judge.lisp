
(defpackage #:judge
  (:use :cl :weblocks
        :f-underscore :anaphora)
  (:import-from :hunchentoot #:header-in
		#:set-cookie #:set-cookie* #:cookie-in
		#:user-agent #:referer)
  (:documentation
   "A web application based on Weblocks."))

(in-package :judge)

(export '(start-judge stop-judge))

;; A macro that generates a class or this webapp

(defwebapp judge
    :prefix "/"
    :description "judge: A new application"
    :init-user-session 'judge::init-user-session
    :autostart nil                   ;; have to start the app manually
    :ignore-default-dependencies nil ;; accept the defaults
    :debug t
    )

;; Top level start & stop scripts

(defun start-judge (&rest args)
  "Starts the application by calling 'start-weblocks' with appropriate
arguments."
  (apply #'start-weblocks args)
  (start-webapp 'judge))

(defun stop-judge ()
  "Stops the application by calling 'stop-weblocks'."
  (stop-webapp 'judge)
  (stop-weblocks))

