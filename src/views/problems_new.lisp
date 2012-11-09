(in-package :judge)

(defun problems-new ()
  (standard-page
    (:h1 "New Problem")
    (:div :id "new-problem"
          (:form :action "/add-problem" :method "post"
                 (:div
                  (:label "Title")
                  (:input :name "problem-title" :size "30" :type "text"))

                 (:div
                  (:label "Description")
                  (:textarea :name "problem-description"))

                 (:div
                  (:label "Sample Input")
                  (:textarea :name "problem-sample-input")

                  (:label "Sample Output")
                  (:textarea :name "problem-sample-output"))

                 (:div
                  (:label "Input")
                  (:textarea :name "problem-input")

                  (:label "Output")
                  (:textarea :name "problem-output"))

                 (:div
                  (:input :name "commit" :type "submit" :value "Save Changes"))))))

