#lang Scheme
(define (make_list_of_size n e)
  (cond ((= n 0) '())        
        (else (append (list e)(make_list_of_size (- n 1) e))
         )
    )
  )

(define (zeros list)
  (cond
    ((null? list) 0)
    ((= (car list) 0 ) (+ 1 (zeros (cdr list))))
    (else (zeros (cdr list)))
    )
  )

(define (power a b)
  (define (innerPower a b result)
    (if (= b 0) result
        (innerPower (* a a)
               (quotient b 2)
               (if (odd? b) (* result a) result))))
  (innerPower a b 1)
 )

(define (remove list1 param) 
( cond
    ((null? list1) '())
    ((equal? (car list1) param) (remove (cdr list1) param)) 
    (else (cons (car list1) (remove (cdr list1) param)))
))

(define largest
(lambda (listNum)
  (let ((num (car listNum)))
    (if (null? (cdr listNum)) num
      (let ((max (largest(cdr listNum))))
           (if (> max num) max num)
        )
      )
    )
  )  
  )