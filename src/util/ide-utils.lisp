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

(defun evaluation (source-code language input output)
  (let ((token (submit source-code language input)))))
    
        