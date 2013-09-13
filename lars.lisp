(defun output-sym (i syms)
  (loop for x in (nth i '(() (2) (2 2) (2 2 2) (2 1) (1)
			  (1 2) (1 2 2) (1 2 2 2) (2 0)))
     do (write-string (nth x syms))))

(defun roman (number)
  (loop for divisor = 1000 then (truncate divisor 10)
     for syms on '("?" "?" "M" "D" "C" "L" "X" "V" "I") by #'cddr
     until (zerop divisor)
     do (output-sym (mod (truncate number divisor) 10) syms)))
