(in-package :judge)

(defmodel problem
    ((title :col-type string :initarg :title :accessor problem-title)
     (description :col-type string :initarg :description :accessor problem-description)
     (sample-input :col-type string :initarg :sample-input :accessor problem-sample-input)
     (sample-output :col-type string :initarg :sample-output :accessor problem-sample-output)
     (input :col-type string :initarg :input :accessor problem-input)
     (output :col-type string :initarg :output :accessor problem-output)))

(defmodel submit
    ((language_id :col-type integer :initarg :language_id :accessor submit-language-id)
     (user_id :col-type integer :initarg :user_id :accessor submit-user-id)
     (source :col-type text :initarg :source :accessor submit-source)
     (status :col-type string :initarg :status :accessor submit-status)
     (submitted_at :col-type date :initarg :submitted_at :accessor submit-at)))
