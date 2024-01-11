#lang racket/base

#|Exercise 3.12: n-tuple->integer
Define a procedure n-tuple->integer that converts a nonempty n-tuple of
digits into the number having those digits. Test your program on the following:

(n-tuple->integer '(3 1 4 6)) ==> 3146
(n-tuple->integer '(0)) ==> 0
(n-tuple->integer '()) ==> Error: bad argument () to n-tuple->integer
(+ (n-tuple->integer '(1 2 3)) (n-tuple->integer '(3 2 1))) ==> 444 |#

(provide n-tuple->integer)

;; n-tuple->integer : N-tuple -> Integer
;; Convert an n-tuple into the corresponding number; error for empty tuple.
(define n-tuple->integer
  (λ (ntpl)
    (cond
      ((null? ntpl)
       (error "Error: bad argument '() to n-tuple->integer"))
      (else (convert ntpl)))))

;; convert : N-tuple -> Integer
;; Convert a non-empty n-tuple into the corresponding number.
(define convert
  (λ (ntpl)
    (cond
      ((null? ntpl) 0)
      (else
       (+ (* (car ntpl) (expt 10 (length (cdr ntpl))))
          (convert (cdr ntpl)))))))


(module+ test  
  (require rackunit racket)
  
  (check-equal? (n-tuple->integer '(3 1 4 6)) 3146)
  (check-equal? (n-tuple->integer '(0)) 0)
  (check-exn exn:fail? (thunk (n-tuple->integer '())))
  (check-equal? (+ (n-tuple->integer '(1 2 3)) (n-tuple->integer '(3 2 1))) 444)
  )