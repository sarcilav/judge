(in-package :judge)

(defun home-index ()
  (standard-page
    (:h1 "All problems")
    (:table :id "definition" :border "1" :width "100%" :align "center"
            (:thead
             (:tr
              (:th "Problem title")
              (:th "Description")
              (:th "Sample Input")
              (:th "Sample Output")))
            (:tbody
             (all-problems-rows)))
    (:a :href "problems/new" "Add new problem")))

