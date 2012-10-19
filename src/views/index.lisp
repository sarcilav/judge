(in-package :judge)

(defun home-index ()
  (standard-page
    (:h1 "All problems")
    (:table :id "problems"
     (:thead
      (:tr
       (:th "Problem title")
       (:th "Description")
       (:th "Sample Input")
       (:th "Sample Output")))
     (:tbody
      (all-movie-rows)))
    (:a :href "movies/new/" "Add new movie")))
      