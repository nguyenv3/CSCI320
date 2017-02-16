#lang racket
(define (length list)
  (cond ((null? list) 0)
        (else(+ 1 (length (cdr list))))
        )
  )


(define (remove list1 param) 
 (cond
    ((null? list1) '())
    ((equal? (car list1) param) (remove (cdr list1) param)) 
    (else (cons (car list1) (remove (cdr list1) param)))
   )
 )

(define (quicksort lst)
  (cond
    ((null? lst) '())
    (else (append (quicksort (partition1 (cdr lst) (car lst))) (cons (car lst) (quicksort (partition2 (cdr lst) (car lst))))))
    )
  )

(define (partition1 lst high)
  (cond ((null? lst) '())
    ((> (car lst) high) (partition1 (cdr lst) high))
    (else (cons (car lst) (partition1 (cdr lst) high)))
    )
  )

(define (partition2 lst low)
  (cond
    ((null? lst) '())
    ((<= (car lst) low) (partition2 (cdr lst) low))
    (else (cons (car lst) (partition2 (cdr lst) low)))
    )
  )  
  
(define (permutation? list1 list2)
  (cond ((null? list1) (if(null? list2) #t #f))
        ((equal? (quicksort list1) (quicksort list2)) #t)
        (else #f)        
        )
  )

(define (simplify_poly poly)
  (cond
    ((null? poly) '())
    ((pair? poly) (simplify poly))
    (else (remove (cons (simplify (car poly)) (simplify_poly (cdr poly))) 0))    
    )
  )
  
(define (simplify poly)
  (cond
    ((null? poly) '())
    ((not (pair? poly)) poly)
    ((equal? '* (car poly)) (cond
                             ((equal? 0 (car (cdr poly))) 0)
                             ((equal? 0 (car (cdr (cdr poly)))) 0)
                             ((equal? 1 (car (cdr poly))) (simplify (car (cdr (cdr poly)))))
                             ((equal? 1 (car (cdr (cdr poly)))) (simplify (car (cdr poly))))
                             (else poly)
                             )
                           )
    ((equal? '+ (car poly)) (cond
                              ((equal? 0 (car (cdr poly))) (car (cdr (cdr poly))))
                              ((equal? 0 (car (cdr (cdr poly)))) (car (cdr poly)))
                              (else poly)
                              )
                            )
    ((equal? 'x (car (cdr poly))) (cond
                                    ((equal? 0 (car poly)) 0)
                                    ((equal? 0 (car (cdr (cdr poly)))) 1)
                                    ((equal? 1 (car poly)) 1)
                                    ((equal? 1 (car (cdr (cdr poly)))) (remove poly 1))
                                    (else poly)
                                    )
                                  )
    )
  )
                              