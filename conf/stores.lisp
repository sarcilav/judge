
(in-package :judge)

;;; Multiple stores may be defined. The last defined store will be the
;;; default.
(defstore *judge-store* :prevalence
  (merge-pathnames (make-pathname :directory '(:relative "data"))
		   (asdf-system-directory :judge)))

