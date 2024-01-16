#lang racket/base

#|Exercise 3.13
If ls is a list of length 1000, how much "cdring" in ls is necessary in each
of the three programs for list-ref presented in this section in order to find
(list-ref ls 4)? Which of the three programs is most efficient?

;; Define the different versions of list-ref

;; =list-ref= : List NonNegativeInt -> Any
;; Produce the item from the list according to index.
(define =list-ref=  ;4 
  (λ (ls n)
    (cond
      ((null? ls)
       (error "Error: =list-ref=: Index out of range for list" ls))
      ((zero? n) (car ls))
      (else (=list-ref= (cdr ls) (sub1 n))))))

;; =list-ref=v2 : List NonNegativeInt -> Any
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
      ((<= (length ls) n)              
       (error "Error: =list-ref=: Index out of range for list" ls))
      (else (list-ref-helper ls n))))) ; use helper

;; list-ref-helper : List NonNegativeInt -> Any
;; Produce the item from the list according to index.
(define list-ref-helper
  (λ (ls n)
    (if
      (zero? n)
      (car ls)
      (list-ref-helper (cdr ls) (sub1 n))))) |#

#| Answer:

;; =list-ref=
This function cdr's once every recursive round of the function until n hits zero or the list becomes empty.
For a list of length 1000, this is 5 rounds of cdr (4, 3, 2, 1, 0) to find the answer.
Total: 5 rounds to find the answer.

;; =list-ref=.v2.v2
This function uses the function length every round of recursion in addition to the cdr of
recursing in the main function. For a list of length 1000, this means extra 1001 rounds of cdr (1000..0)
for the first round of recursion only.
Total: 1001 + 1000 + 999 + 998 + 997 + 5 cdr operations to find the answer.

;; =list-ref=.v3
This function also uses length and has the extra 1001 cdr operations in using that, but only
for the first round. After that, this function uses the list-ref-helper that uses one round of cdr
for each round of recursion.
Total: 1001 + 5 cdr operations to find the answer.

In conclusion, =list-ref= is the most efficient, but after the first round =list-ref=.v3 is
as efficient. =list-ref=.v2.v2 is the most inefficient, many cdr operations per round depending on
the length of the remaining list. |#