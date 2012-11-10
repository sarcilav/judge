(in-package :judge)

(defmodel problem
    ((title :col-type string :initarg :title :accessor problem-title)
     (description :col-type string :initarg :description :accessor problem-description)
     (sample-input :col-type string :initarg :sample-input :accessor problem-sample-input)
     (sample-output :col-type string :initarg :sample-output :accessor problem-sample-output)
     (input :col-type string :initarg :input :accessor problem-input)
     (output :col-type string :initarg :output :accessor problem-output)))

(defmodel submit
    ((problem-id :col-type integer :initarg :problem-id :accessor submit-problem-id)
     (language-id :col-type integer :initarg :language-id :accessor submit-language-id)
     (user-id :col-type integer :initarg :user-id :accessor submit-user-id)
     (source :col-type text :initarg :source :accessor submit-source)
     (status :col-type string :initarg :status :accessor submit-status)
     (submitted-at :col-type timestamp :initarg :submitted-at :accessor submit-at)))

(defmodel user
    ((username :col-type string :initarg :username :accessor user-username)
     (hashed-password :col-type string :initarg :hashed-password :accessor user-hashed-password)))