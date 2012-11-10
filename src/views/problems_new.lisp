(in-package :judge)

(defun problems-new ()
  (standard-page
    (:h1 "New Problem")
    (:div :id "new-problem"
          (:form :action "/add-problem" :method "post"
                 (:div
                  (:label "Username")
                  (:br)
                  (:input :name "username" :type "text"))

                 (:div
                  (:label "Password")
                  (:br)
                  (:input :name "password" :type "password"))

                 (:div
                  (:label "Title")
                  (:br)
                  (:input :name "problem-title" :size "30" :type "text"))

                 (:div
                  (:label "Description")
                  (:br)
                  (:textarea :name "problem-description"))

                 (:div
                  (:label "Sample Input")
                  (:br)
                  (:textarea :name "problem-sample-input")
                  (:br)
                  (:label "Sample Output")
                  (:br)
                  (:textarea :name "problem-sample-output"))

                 (:div
                  (:label "Input")
                  (:br)
                  (:textarea :name "problem-input")
                  (:br)
                  (:label "Output")
                  (:br)
                  (:textarea :name "problem-output"))

                 (:div
                  (:input :name "commit" :type "submit" :value "Save Changes"))))))

