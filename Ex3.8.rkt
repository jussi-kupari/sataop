#lang racket/base

#|Exercise 3.8: list-front
Define a procedure list-front that takes as arguments a list of items ls and
a nonnegative integer num and returns the first num top-level items in ls.
If num is larger than the number of top-level items in Is, an error is signaled.
Test your procedure on:

(list-front '(a b c d e f g) 4) ==> (a b c d)
(list-front '(a b c) 4) ==> Error: length of (a b c) is less than 4.
(list-front '(a b c d e f g) 0) ==> ()
(list-front '() 3) ==> Error: length of () is less than 3. |#

(provide list-front)

;; list-front : List NonNegativeInt -> NonNegativeInt
;; Produce the first num items from given list; error if index is too large
(define list-front
  (λ (ls num)
    (cond
      ((< (length ls) num)
       (error "Error: length of list is less than given integer."))
      (else (list-front-helper ls num)))))

;; list-front-helper : List NonNegativeInt -> NonNegativeInt
;; Produce the first num items from given list
(define list-front-helper
  (λ (ls num)
    (cond
      ((zero? num) '())
      (else (cons (car ls) (list-front-helper (cdr ls) (sub1 num)))))))

;; ----- Alternative solution -----

;; list-front.v2 : List NonNegativeInt -> NonNegativeInt
;; Produce the first num items from given list
(define list-front.v2
  (λ (ls num)
    (cond
      ((and (null? ls) (> num 0))
       (error "Error: length of list is less than given integer."))
      ((zero? num) '())
      (else (cons (car ls) (list-front.v2 (cdr ls) (sub1 num)))))))

;; --------------------------------


(module+ test
  (require racket rackunit)
  ;; list-front-helper
  (check-equal? (list-front-helper '(a b c d e f g) 4) '(a b c d))

  ;; list-front
  (check-equal? (list-front '(a b c d e f g) 4) '(a b c d))
  (check-exn exn:fail? (thunk (list-front '(a b c) 4)))
  (check-equal? (list-front '(a b c d e f g) 0) '())
  (check-exn exn:fail? (thunk (list-front '() 3)))

  ;; list-front.v2
  (check-equal? (list-front.v2 '(a b c d e f g) 4) '(a b c d))
  (check-exn exn:fail? (thunk (list-front.v2 '(a b c) 4)))
  (check-equal? (list-front.v2 '(a b c d e f g) 0) '())
  (check-exn exn:fail? (thunk (list-front.v2 '() 3)))
  )