#lang racket/base

;; Program 2.8 swapper

(provide swapper)

;; swapper : Item Item List -> List
;; Produces a list where the two items have changed places.
(define swapper
  (λ (x y ls)
    (cond
      ((null? ls) '())
      ((equal? (car ls) x) (cons y (swapper x y (cdr ls))))
      ((equal? (car ls) y) (cons x (swapper x y (cdr ls))))
      (else (cons (car ls) (swapper x y (cdr ls)))))))


;; Below are the alternative versions listed on page 69.

;; swapper.v2 : Item Item List -> List
;; Produces a list where the two items have changed places.
(define swapper.v2
  (λ (x y ls)
    (cond
      ((null? ls) '())
      (else (cons (swap-tester x y (car ls))
                  (swapper.v2 x y (cdr ls)))))))

;; swap-tester : Item Item Item
;; Produces the item to be consed in the swapper function
(define swap-tester
  (λ (x y a)
    (cond
      ((equal? a x) y)
      ((equal? a y) x)
      (else a))))

;; swapper.v3 : Item Item List -> List
;; Produces a list where the two items have changed places.
(define swapper.v3
  (λ (x y ls)
    (cond
      ((null? ls) '())
      (else
       (cons
        (cond
          ((equal? (car ls) x) y)
          ((equal? (car ls) y) x)
          (else (car ls)))    
        (swapper.v3 x y (cdr ls)))))))


(module+ test
  (require rackunit)
  
  ;; swapper
  (check-equal? (swapper 'cat 'dog '(my cat eats dog food)) '(my dog eats cat food))
  (check-equal? (swapper 'John 'mary '(John loves mary)) '(mary loves John))
  (check-equal? (swapper 'a 'n '(b n a n a n)) '(b a n a n a))
  (check-equal? (swapper 'a 'b '(c (a b) d)) '(c (a b) d))
  (check-equal? (swapper 'a 'b '()) '())

  ;; swap-tester
  (check-equal? (swap-tester 'cat 'mouse 'mouse) 'cat)
  (check-equal? (swap-tester 'cat 'mouse 'cat) 'mouse)
  (check-equal? (swap-tester 'cat 'mouse 'rat) 'rat)
  )