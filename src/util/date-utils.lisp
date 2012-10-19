(in-package :judge)

(defmacro with-date (date &body body)
  "Decodes date and binds to year, month and day variables."
  `(multiple-value-bind (year month day) (decode-date ,date)
     ,@body))

(defun print-date (date)
  "Given a date (postmodern style) decode and return a string"
  (with-date date
    (with-output-to-string (s)
      (format s "~4,'0d-~2,'0d-~2,'0d" year month day))))

(defmacro def-date-getter (element)
  `(defun ,(symb 'get element) (date)
     ,(conc "Given a date object, return the " (string element))
     (with-date date
       ,element)))

(def-date-getter day)
(def-date-getter month)
(def-date-getter year)