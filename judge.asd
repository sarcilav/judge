;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Base: 10 -*-
(defpackage #:judge-asd
  (:use :cl :asdf))

(in-package :judge-asd)

(defsystem judge
    :name "judge"
    :version "0.0.1"
    :maintainer ""
    :author ""
    :licence ""
    :description "judge"
    :depends-on (:weblocks)
    :components ((:file "judge")
		 (:module conf
		  :components ((:file "stores"))
		  :depends-on ("judge"))
		 (:module src
		  :components ((:file "init-session"))
		  :depends-on ("judge" conf))))

