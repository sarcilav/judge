(in-package :judge)

(defmacro html-to-stout (&body body)
  "Outputs HTML to standard out. Thanks Inaimathi for this tip!"
  `(with-html-output (*standard-output* nil :indent t) ,@body))

(defun get-id-from-uri ()
  "Returns the ID from the URI request."
  (car (cl-ppcre:all-matches-as-strings "[0-9]+" (request-uri *request*))))

;; (defun movies-path (movie)
;;   "Given a <Movie>, return the RESTful URI -- e.g. 'movies/3'"
;;   (concatenate 'string "movies/" (write-to-string (movie-id movie))))

(defun all-problems-rows ()
  (dolist (problem (problem-get-all))
    (html-to-stout
     (:tr
      (:td (fmt "~a" (problem-title problem)))
      (:td (fmt "~a" (problem-description problem)))
      (:td (fmt "~a" (problem-sample-input problem)))
      (:td (fmt "~a" (problem-sample-output problem)))))))


(defun selector-form (name options &optional selected)
  (html-to-stout
   (:select :name name
            (mapcar
             #'(lambda (x) (if (equal selected (car x))
                          (htm (:option :selected "selected" :value (car x) (fmt "~A" (mkstr (cadr x)))))
                          (htm (:option :value (car x) (fmt "~A" (mkstr (cadr x)))))))
             options))))

(defun problems-id-title (problems)
  (loop for problem in problems
       collect (list (problem-id problem) (problem-title problem))))