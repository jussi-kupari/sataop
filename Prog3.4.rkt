#lang racket/base

;; Program 3.4 harmonic-sum

(provide harmonic-sum)

;; harmonic-sum
(define harmonic-sum
  (λ (n)
    (cond
      ((zero? n) 0)
      (else (+ (/ 1 n) (harmonic-sum (sub1 n)))))))

(module+ test
  (require rackunit)
  (check-equal? (harmonic-sum 0) 0)
  (check-equal? (harmonic-sum 3) (+ (/ 1 3) (/ 1 2) (/ 1 1)))
  )