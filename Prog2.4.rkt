#lang racket/base

#|Program 2.4 remove-1st|#

(provide (all-defined-out))

(module+ test
  (require rackunit))

;; remove-1st : Item List -> List
;; Produce the list with first occurrence of item removed
(define remove-1st
  (λ (item ls)
    (cond
      ((null? ls) '())
      ((equal? (car ls) item) (cdr ls))
      (else (cons (car ls)
                  (remove-1st item (cdr ls)))))))

;; Note! in Racket eq? seems to also work on numbers not just symbols

;; remq-1st : Symbol List -> List
;; Produce the list with first occurrence of symbol removed
(define remq-1st
  (λ (symbol ls)
    (cond
      ((null? ls) '())
      ((eq? (car ls) symbol) (cdr ls))
      (else (cons (car ls)
                  (remq-1st symbol (cdr ls)))))))

;; remv-1st : Symbol|Number List -> List
;; Produce the list with first occurrence of the symbol|number removed
(define remv-1st
  (λ (sorn ls) ; sorn is symbol-or-number
    (cond
      ((null? ls) '())
      ((eq? (car ls) sorn) (cdr ls))
      (else (cons (car ls)
                  (remv-1st sorn (cdr ls)))))))

(module+ test
  (check-equal? (remove-1st 'fox '(hen fox chick cock)) '(hen chick cock))
  (check-equal? (remove-1st 'fox '(hen fox chick fox cock)) '(hen chick fox cock))
  (check-equal? (remove-1st 'fox '(hen (fox chick) cock)) '(hen (fox chick) cock))
  (check-equal? (remove-1st 'fox '()) '())
  (check-equal? (remove-1st '(1 2) '(1 2 (1 2) ((1 2)))) '(1 2 ((1 2))))
  )