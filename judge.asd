(asdf:defsystem #:judge
  :serial t
  :description "Online Judge Using Common Lisp"
  :depends-on (#:hunchentoot
               #:cl-who
               #:postmodern
               #:simple-date
               #:drakma
               #:json
               )
  :components ((:file "package")
               (:module :src
                        :serial t
                        :components
                        ((:module :util
                                  :serial t
                                  :components ((:file "general-utils")
                                               (:file "date-utils")
                                               (:file "heroku-utils")
                                               (:file "html-utils")
                                               (:file "model-utils")))
                         (:file "model")
                         (:module :views
                                  :serial t
                                  :components ((:file "layout")
                                               (:file "index")
                                               (:file "new")
                                               (:file "show")
                                               (:file "edit")))
                         (:file "controllers")))))
