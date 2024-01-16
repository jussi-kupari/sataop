#lang racket/base

;; Program 3.7 list-ref

(provide =list-ref=)

;; list-ref is already defined in racket/base
;; so I will call this =list-ref=

;; =list-ref= : List NonNegativeInt -> Any
;; Produce the item from the list according to index.
(define =list-ref=
  (λ (ls n)
    (cond
      ((null? ls)
       (error "Error: =list-ref=: Index out of range for list" ls))
      ((zero? n) (car ls))
      (else (=list-ref= (cdr ls) (sub1 n))))))

;; =list-ref=.v2 : List NonNegativeInt -> Any
;; Produce the item from the list according to index.
(define =list-ref=.v2
  (λ (ls n)
    (cond
      ((<= (length ls) n)
       (error "Error: =list-ref=.v2: Index out of range for list" ls))
      ((zero? n) (car ls))
      (else (=list-ref=.v2 (cdr ls) (sub1 n))))))

;; =list-ref=.v3 : List NonNegativeInt -> Any
;; Produce the item from the list according to index.
(define =list-ref=.v3
  (λ (ls n)
    (cond
      ((<= (length ls) n)              ; check this only once
       (error "Error: =list-ref=: Index out of range for list" ls))
      (else (list-ref-helper ls n))))) ; use helper

;; list-ref-helper : List NonNegativeInt -> Any
;; Produce the item from the list according to index.
(define list-ref-helper
  (λ (ls n)
    (if
      (zero? n)
      (car ls)
      (list-ref-helper (cdr ls) (sub1 n)))))



(module+ test
  ;; I don't know from where to import 'thunk' functions to racket/base
  ;; so using full lang# racket for the test module
  (require racket rackunit)
  
  (check-equal? (=list-ref= '(a b c d e f) 3) 'd)
  (check-equal? (=list-ref= '(a b c d e f) 0) 'a)
  (check-exn exn:fail? (thunk (=list-ref= '(a b c) 3))) ; error
  (check-equal? (=list-ref= '((1 2) (3 4) (5 6)) 1) '(3 4))
  (check-exn exn:fail? (thunk (=list-ref= '() 0))) ; error

  (check-equal? (=list-ref=.v2 '(a b c d e f) 3) 'd)
  (check-equal? (=list-ref=.v2 '(a b c d e f) 0) 'a)
  (check-exn exn:fail? (thunk (=list-ref=.v2 '(a b c) 3))) ; error
  (check-equal? (=list-ref=.v2 '((1 2) (3 4) (5 6)) 1) '(3 4))
  (check-exn exn:fail? (thunk (=list-ref=.v2 '() 0))) ; error

  (check-equal? (=list-ref=.v3 '(a b c d e f) 3) 'd)
  (check-equal? (=list-ref=.v3 '(a b c d e f) 0) 'a)
  (check-exn exn:fail? (thunk (=list-ref=.v3 '(a b c) 3))) ; error
  (check-equal? (=list-ref=.v3 '((1 2) (3 4) (5 6)) 1) '(3 4))
  (check-exn exn:fail? (thunk (=list-ref=.v3 '() 0))) ; error
  )