(in-package :judge)

(setq *dispatch-table*
      (list
       (create-regex-dispatcher "^/$" 'home-index)
       ;; problems actions
       (create-regex-dispatcher "^/problems/new$" 'problems-new)
       (create-regex-dispatcher "^/add-problem$" 'add-problem)

       ;;submit actions
       (create-regex-dispatcher "^/submit$" 'submit-problem)
       (create-regex-dispatcher "^/add-submit$" 'add-submit)
       (create-regex-dispatcher "^/submits$" 'submits-table)
       
       ;;static
       (create-static-file-dispatcher-and-handler "/site.css" "static/application.css")))

;; ;; Controller that do not render views are below -- those that do are in views folder


(defun add-problem ()
  "Form processer for adding a new problem."
  (when (equal (user-username (current-user (parameter "username") (parameter "password"))) "sarcilav")
    (let ((title (parameter "problem-title"))
          (description (parameter "problem-description"))
          (sample-input (parameter "problem-sample-input"))
          (sample-output (parameter "problem-sample-output"))
          (input (parameter "problem-input"))
          (output (parameter "problem-output")))
      (problem-create :title title
                      :description description
                      :sample-input sample-input
                      :sample-output sample-output
                      :input input
                      :output output)))
  (redirect "/"))

(defun add-submit ()
  "Form processor for adding a new submit."
  (let ((problem-id (parameter "problem-id"))
        (language-id (parameter "language-id"))
        (source-code (parameter "source"))
        (user (current-user (parameter "username") (parameter "password"))))
    (evaluation (submit-create :problem-id problem-id
                   :language-id language-id
                   :user-id (user-id user)
                   :source source-code
                   :status "pending"
                   :submitted-at (universal-time-to-timestamp (get-universal-time)))))
  (redirect "/submits"))