#lang racket/base

#|Exercise 2.23
Identify what is printed on the screen and what is returned in each of the following:

a.
(begin
  (writeln "(* 3 4) = " (* 3 4))
  (= (* 3 4) 12))

b.
(begin
  (writeln "(cons 'a '(b c)) has the value " (cons 'a '(b c)))
  (writeln "(cons 'a '(b c)) has the value " '(a b c))
  (writeln "(cons 'a '(b c)) has the value (a b c)")
  (cons 'a '(b c)))

c.
(begin
  (writeln "Hello, how are you?")
  (writeln "Fine, thank you. How are you? " 'Jack)
  (writeln "Just great! It is good to see you again, " 'Jill)
  "Good-bye. Have a nice day.") |#

;; writeline is the same as writeln in the book.
(require (only-in "Prog7.5.rkt" writeline))

(module+ test
  (require rackunit)
  
  ;; a. Returns #true
  (check-true
   (begin
     (writeline "(* 3 4) = " (* 3 4))
     (= (* 3 4) 12))
   #true)
  
  #| a. Prints
     (* 3 4) = 12
     #true |#
  

  ;; b. Returns '(a b c)
  (check-equal?
   (begin
     (writeline "(cons 'a '(b c)) has the value " (cons 'a '(b c)))
     (writeline "(cons 'a '(b c)) has the value " '(a b c))
     (writeline "(cons 'a '(b c)) has the value (a b c)")
     (cons 'a '(b c)))
   '(a b c))

  #| b. Prints
     (cons 'a '(b c)) has the value (a b c)
     (cons 'a '(b c)) has the value (a b c)
     (cons 'a '(b c)) has the value (a b c)
     '(a b c) |#
  

  ;; c. Returns "Good-bye. Have a nice day."
  (check-equal?
   (begin
     (writeline "Hello, how are you?")
     (writeline "Fine, thank you. How are you? " 'Jack)
     (writeline "Just great! It is good to see you again, " 'Jill)
     "Good-bye. Have a nice day.")
   "Good-bye. Have a nice day.")

  #| c. Prints
     Hello, how are you?
     Fine, thank you. How are you? Jack
     Just great! It is good to see you again, Jill
     "Good-bye. Have a nice day." |# 
  )