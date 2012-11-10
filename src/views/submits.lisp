(in-package :judge)

(defun submits-table ()
  (standard-page
    (:h1 "All submits")
    (:table :class "submits" :border "1" :width "100%" :align "center"
            (:tr
             (:th "Username")
             (:th "Language")
             (:th "Status"))
            (:tbody
             (all-submits-rows)))))
