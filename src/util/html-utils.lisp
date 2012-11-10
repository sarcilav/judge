(in-package :judge)

(defmacro html-to-stout (&body body)
  "Outputs HTML to standard out. Thanks Inaimathi for this tip!"
  `(with-html-output (*standard-output* nil :indent t) ,@body))

(defun get-id-from-uri ()
  "Returns the ID from the URI request."
  (car (cl-ppcre:all-matches-as-strings "[0-9]+" (request-uri *request*))))


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
                           (htm (:option :selected "selected" :value (car x) (fmt "~A" (mkstr (cdr x)))))
                           (htm (:option :value (car x) (fmt "~A" (mkstr (cdr x)))))))
              options))))

(defun problems-id-title (problems)
  (loop for problem in problems
     collect (cons (problem-id problem) (problem-title problem))))

(defun get-language-name (id)
  (cdr (assoc (intern (princ-to-string id) :keyword) *languages-list*)))

(defun all-submits-rows ()
  (dolist (submit (submit-get-all))
    (html-to-stout
      (:tr
       (:td (fmt "~a" (user-username (user-get (submit-user-id submit)))))
       (:td (fmt "~a" (get-language-name (submit-language-id submit))))
       (:td (fmt "~a" (submit-status submit)))))))
