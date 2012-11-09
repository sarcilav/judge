(in-package :judge)

(setq *dispatch-table*
      (list
       (create-regex-dispatcher "^/$" 'home-index)
       (create-regex-dispatcher "^/problems/new$" 'problems-new)
       (create-regex-dispatcher "^/add-problem$" 'add-problem)
       ;;        (create-regex-dispatcher "^/$" 'controller-to-index)
       ;;        (create-regex-dispatcher "^/movies$" 'controller-index)
       ;;        (create-regex-dispatcher "^/movies/new" 'controller-new)
       ;;        (create-regex-dispatcher "^/movies/[0-9]+$" 'controller-show)
       ;;        (create-regex-dispatcher "^/movies/[0-9]+/edit" 'controller-edit)
       ;;        (create-regex-dispatcher "^/movies/[0-9]+/update" 'controller-update)
       ;;        (create-regex-dispatcher "^/movies/[0-9]+/delete" 'controller-delete)
       ;;        (create-regex-dispatcher "^/add-movie" 'controller-add-movie)
       (create-static-file-dispatcher-and-handler "/site.css" "static/application.css")))

;; ;; Controller that do not render views are below -- those that do are in views folder

;; (defun controller-to-index ()
;;   (redirect "/movies"))

(defun add-problem ()
  "Form processer for adding new problem."
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
                    :output output))
  (redirect "/"))

;; (defun controller-delete ()
;;   (movie-delete (movie-get (get-id-from-uri)))
;;   (redirect "/movies"))

;; (defun controller-update ()
;;   (let ((title (parameter "movie-title"))
;;  (rating (parameter "movie-rating"))
;;  (year (parse-integer (parameter "year")))
;;  (month (parse-integer (parameter "month")))
;;  (day (parse-integer (parameter "day")))
;;  (movie (movie-get (get-id-from-uri))))
;;     (setf (movie-title movie) title
;;    (movie-rating movie) rating
;;    (movie-release-date movie) (encode-date year month day))
;;     (movie-update movie))
;;   (redirect (conc "/movies/" (get-id-from-uri))))
