#lang racket/base

#|Exercise 2.11
The definition of member? given in this section uses an or expression in the
else clause. Rewrite the definition of member? so that each of the two subexpressions of the or expression
is handled in a separate cond clause. Compare the resulting definition with the definition of remove-1st.|#

(module+ test
  (require rackunit))

;; member.v2? : Item List -> Boolean
;; Produces true if item is in the list
(define member.v2?
  (λ (item ls)
    (cond
      ((null? ls) #f)
      ((equal? (car ls) item) #t)
      ;Leaving out the answer (#t) in the cond branch also works
      ;Perhaps because the answer is the resulting boolean value 
      ;((equal? (car ls) item))
      (else (member.v2? item (cdr ls))))))

(module+ test
  (check-true (member.v2? 'cat '(dog hen cat pig)))
  (check-false (member.v2? 'fox '(dog hen cat pig)))
  (check-false (member.v2? 2 '(1 (2 3) 4)))
  (check-true (member.v2? '(2 3) '(1 (2 3) 4)))
  (check-false (member.v2? 'cat '()))
  )