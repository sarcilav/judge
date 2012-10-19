(in-package :judge)

(defmodel problem
    ((title :col-type string :initarg :title :accessor problem-title)
     (description :col-type string :initarg :rating :accessor problem-description)
     (sample-input :col-type string :initarg :rating :accessor problem-sample-input)
     (sample-output :col-type string :initarg :rating :accessor problem-sample-output)
     (input :col-type string :initarg :rating :accessor problem-input)
     (output :col-type string :initarg :rating :accessor problem-output)))