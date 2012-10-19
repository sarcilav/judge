(in-package :cl-user)

(print ">>> Building system....")

(load (make-pathname :directory *build-dir* :defaults "judge.asd"))

(ql:quickload :judge)

;;; Redefine / extend heroku-toplevel here if necessary.

(print ">>> Done building system")