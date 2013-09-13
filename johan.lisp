(defun solve (num)
  (%solve num 1000 '(("" "" "M") ("M" "D" "C") ("C" "L" "X") ("X" "V" "I"))))

(defun %solve (num div syms)
  (let ((sym (car syms))
	(i (truncate num div))
	(n (mod num div)))
    (unless (< div 1)
      (print-digits i sym)
      (%solve n (/ div 10) (cdr syms)))))

(defun print-digits (num sym)
  (cond ((eq num 9)
	 (format t "~A~A" (third sym) (first sym)))
	((eq num 4)
	 (format t "~A~A" (third sym) (second sym)))
	((>= num 5)
	 (progn
	   (format t "~A" (second sym))
	   (print-digits (decf num 5) sym)))
	(t
	 (dotimes (_ num)
	   (format t "~A" (third sym))))))
