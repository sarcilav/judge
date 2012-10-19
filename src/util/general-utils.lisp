(in-package :judge)

(defun symb (a b)
  (intern (format nil "~a-~a" (symbol-name a) (symbol-name b))))

(defun mkstr (obj)
  (if (stringp obj) obj
      (write-to-string obj)))

(defun num-list (x y)
  (if (< y x)
      (loop for i from x downto y collect i)
      (loop for i from x upto y collect i)))

(defun drop-table (name)
  "Drops the table completely, deletes all entries. Use only when redefining models completely."
  (with-connection (db-params)
    (query (conc "DROP TABLE " name))))