(ql:quickload "drakma")
(ql:quickload "cl-json")
(defparameter drakma:*text-content-types* '(("application" . "json") ("text" . nil)))

(defparameter *base-url* "http://ideone-rest.herokuapp.com/")

(defparameter *languages-list* (json:decode-json-from-string (drakma:http-request (concatenate 'string *base-url* "languages"))))

(defun submission-details (token)
  (json:decode-json-from-string (drakma:http-request (concatenate 'string *base-url* "submission/" token))))

(defun params->alist (source-code language input)
  `(("source_code" . ,source-code)
    ("language" . ,(princ-to-string language))
    ("input" . ,input)))

(defparameter *sample-source-code* "using namespace std;
#include <iostream>
int main()
{
  int n = 0;
  int temp;
  while(1)
    {
      ++n;
      cout << n << endl;
    }
  return 0;
}")

(defun submit (source-code language input)
  (drakma:http-request (concatenate 'string *base-url* "submissions")
                       :method :post
                       :parameters (params->alist source-code language input)))