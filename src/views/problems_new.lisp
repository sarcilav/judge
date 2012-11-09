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
                  (:input :name "problem-description" :type "textarea"))

                 (:div
                  (:label "Sample Input")
                  (:input :name "problem-sample-input" :type "textarea"))

                 (:div
                  (:label "Sample Output")
                  (:input :name "problem-sample-output" :type "textarea"))

                 (:div
                  (:label "Input")
                  (:input :name "problem-input" :type "textarea")

                  (:label "Output")
                  (:input :name "problem-output" :type "textarea"))

                 (:div
                  (:input :name "commit" :type "submit" :value "Save Changes"))))))

