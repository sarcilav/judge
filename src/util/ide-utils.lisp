(in-package :judge)

(defparameter drakma:*text-content-types* '(("application" . "json") ("text" . nil)))

(defparameter *ide-base-url* "http://ideone-rest.herokuapp.com/")

(defparameter *languages-list* (json:decode-json-from-string (drakma:http-request (concatenate 'string *ide-base-url* "languages"))))

(defun submission-details (token)
  (json:decode-json-from-string (drakma:http-request (concatenate 'string *ide-base-url* "submission/" token))))

(defun params->alist (source-code language input)
  `(("source_code" . ,source-code)
    ("language" . ,(princ-to-string language))
    ("input" . ,input)))

;; (defparameter *sample-source-code* "using namespace std;
;; #include <iostream>
;; int main()
;; {
;;   int n = 0;
;;   int temp;
;;   while(1)
;;     {
;;       ++n;
;;       cout << n << endl;
;;     }
;;   return 0;
;; }")

(defun submit (source-code language input)
  (drakma:http-request (concatenate 'string *ide-base-url* "submissions")
                       :method :post
                       :parameters (params->alist source-code language input)))

(defun clean-output (output)
  (string-trim "
" (coerce (remove-if (lambda (x) (eq x #\Return)) (coerce output 'list)) 'string)))

(defun compare-output-p (expected current)
  (let ((cleaned-expected (clean-output expected))
        (cleaned-current (clean-output current)))
    (string= cleaned-expected cleaned-current)))
         
(defun veredict (source-code language input output)
  (let* ((token (submit source-code language input))
         (status (submission-details token)))
    (loop until (not
                 (equal "wait for ideone"
                        (cdr (assoc :error status)))) do
         (progn
           (print "inside")
           (sleep 3.0)
           (setf status (submission-details token))))
    (if (equal (cdr (assoc :error status))
               "OK")
        (if (compare-output-p (cdr (assoc :output status))
                   output)
            "accepted"
            "wrong answer")
        (cdr (assoc :error status)))))

(defun evaluation (submit)
  (sb-thread:make-thread (lambda ()
                           (let* ((source-code (submit-source submit))
                                  (language (submit-language-id submit))
                                  (problem (problem-get (submit-problem-id submit)))
                                 (input (problem-input problem))
                                 (output (problem-output problem)))
                             (setf (submit-status submit) (veredict source-code language input output))
                             (submit-update submit)))))

