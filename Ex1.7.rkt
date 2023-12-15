#lang racket/base

#|Exercise 1.7
Consider a list ls containing n values. If a evaluates to any value, how many
values does the list obtained by evaluating (cons a ls) contain?|#

#|cons creates a new list by appending a at the start of the original ls.
The original ls contained n values and the new list contains n + 1 values|#