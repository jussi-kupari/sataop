#lang racket/base

;; Program 3.5 list-of-zeros

(provide list-of-zeros)

;; list-of-zeros : Integer -> List
(define list-of-zeros
  (λ (n)
    (cond
      ((zero? n) '())
      (else (cons 0 (list-of-zeros (sub1 n)))))))

(module+ test
  (require rackunit)
  (check-equal? (list-of-zeros 0) '())
  (check-equal? (list-of-zeros 3) (cons 0 (cons 0 (cons 0 '()))))
  (check-equal? (list-of-zeros 5) '(0 0 0 0 0))
  )