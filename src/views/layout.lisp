(in-package :judge)

(defmacro standard-page (&body body)
  `(with-html-output-to-string (*standard-output* nil :prologue t :indent t)
     (:html
      (:head
       (:meta :http-equiv "Content-Type" :content "text/html;charset=utf-8")
       (:title "Online Judge!")
       (:link :type "text/css" :rel "stylesheet" :href "/site.css"))
      (:body
       (:div :id "main" :class "wrapper"
             (:h1 :class "title" "Online Judge!")
             (:div :id "links" 
                   (:a :href "/" "Problems") "|"
                   (:a :href "/submit" "Submit") "|"
                   (:a :href "/submits" "Score Board"))

             ,@body)))))