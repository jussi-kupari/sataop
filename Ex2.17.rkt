#lang racket/base

#|Exercise 2.17: remove-2nd
Define a procedure reinove-2nd that removes the second occurrence of a given
item a from a list of items ls. You may use the procedure remove-1st in
defining remove-2nd. Test your procedure on:

(remove-2nd 'cat '(my cat loves cat food)) ==> (my cat loves food)
(remove-2nd 'cat '(my cat loves food)) ==> (my cat loves food)
(remove-2nd 'cat '(my cat and your cat love cat food)) ==> (my cat and your love cat food)
|#

(provide remove-2nd)

(require
  (only-in "Prog2.4.rkt" remove-1st))

;; remove-2nd : Any List -> List
;; Removes the second occurrence of the item in the list
(define remove-2nd
  (λ (item ls)
    (cond
      ((null? ls) '())
      ((equal? (car ls) item)
       (cons (car ls) (remove-1st item (cdr ls))))
      (else (cons (car ls) (remove-2nd item (cdr ls)))))))

(module+ test
  (require rackunit)
  
  (check-equal? (remove-2nd 'cat '(my cat loves cat food)) '(my cat loves food))
  (check-equal? (remove-2nd 'cat '(my cat loves food)) '(my cat loves food))
  (check-equal? (remove-2nd 'cat '(my cat and your cat love cat food)) '(my cat and your love cat food))
  (check-equal? (remove-2nd 'cat '()) '())
  )