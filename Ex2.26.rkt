#lang racket/base
#|Exercise 2.26
In the return table built for the invocation of swapper in this section, the
computation did not stop when the terminating condition was true and the first
cond clause returned (). Instead, the variables in the table were evaluated one
by one until the value of the first was obtained to provide the value of the
original invocation. This program behaved in this way because after each invocation
of swapper, a cons still had to be completed. There was still an operation to perform
after swapper was invoked. Do a similar analysis, building the return tables, on
the two procedures last-item in Program 2.2 and member? in Program 2.3. In the first
case, consider (last-item '(a b c)), and in the second case, consider (member? 'c '(a b e d)).
In these two examples, there is no procedure waiting to be done after the recursive
invocations of the procedure. Such programs are called iterative. We shall
discuss the behavior of iterative programs more thoroughly in the chapter on
numerical recursion.

;; last-item : List -> Any
;; Produces the last element in the list
(define last-item
  (λ (ls)
    (cond
      ((null? (cdr ls)) (car ls))
      (else (last-item (cdr ls))))))

;; member? : Item List -> Boolean
;; Produces true if item is in the list
(define member?
  (λ (item ls)
    (cond
      ((null? ls) #f)
      (else (or (equal? (car ls) item)
                (member? item (cdr ls)))))))

|#

(require (only-in "Prog2.2.rkt" last-item)
         (only-in "Prog2.3.rkt" member?))


(last-item '(a b c))    ; Answer-1
(last-item '(b c))      ; Answer-2
(last-item '(c))        ; Answer-3

(member? 'c '(a b e d)) ; Answer-1
(member? 'c '(b e d))   ; Answer-2
(member? 'c '(e d))     ; Answer-3
(member? 'c '(d))       ; Answer-4
(member? 'c '())        ; Answer-5