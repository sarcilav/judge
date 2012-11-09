(in-package :judge)

(defun submit-problem ()
  (standard-page
    (:h1 "New Submission")
    (:div :id "new-submit"
          (:form :action "/add-submission" :method "post"
                 (:div
                  (:label "Problem")
                  (selector-form "problem-id" (problems-id-title (problem-get-all))))

                 (:div
                  (:label "language")
                  (selector-form "language-id" *languages-list*))

                 (:div
                  (:label "Code")
                  (:textarea :name "source"))
                 
                 (:div
                  (:input :name "commit" :type "submit" :value "Submit"))))))

