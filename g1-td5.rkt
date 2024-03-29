; TD 5 - 22/03/2024

; Exercise 2
(define (mirrorString word)
  ; returns the mirror of the given word (so that the word will be written backwards)
  ; string -> string
  (if (= (string-length word) 0) ""
      (string-append (mirrorString (substring word 1 (string-length word)))
                     (substring word 0 1))))

;(mirrorString "Hello")

; for a list, we can't use the same solutions as for a string :
; we can scroll from left to right, but not add to the end of the list ;
; we can add to the beginning of a list, but not browse from right to left

(define (mirrorList l)
  ; returns the mirror of l (a list containing all the elements of l in reverse order)
  ; list -> list
  (mirrorL l '()))

(define (mirrorL ll rl)
  ; returns a list containing the elements of ll in reverse order,
  ; then those of rl in the same order
  ; 2 lists -> list
  (if (null? ll) rl
      (mirrorL (cdr ll) (cons (car ll) rl))))

;(mirrorList '( 1 2 3 4 5 6))

;Exercise 3 
; Solution 1 - use mirror String
(define (palindrom1? word)
  ; returns true if the word is a palindrom (readable from both sides)
  ; String -> boolean
  (string=? word (mirrorString word)))

; Solution 2 - use of recursion
(define (palindrom2? word)
  ; returns true if the word is a palindrom (readable from both sides)
  ; String -> boolean
  (let ((lg (string-length word)))
        (or (< lg 2)
            (and (char=? (string-ref word 0) (string-ref word (- lg 1)))
                 (palindrome2? (substring word 1 (- lg 1)))))))

;(palindrome1? "laval")
;(palindrome1? "naval")
;(palindrome2? "laval")
;(palindrome2? "naval")

; Solution 1 use of mirror List
(define (palindromList1? l)
  ; returns true if the list is a palindrom (readable from both sides)
  ; List -> boolean
  (equal? l (mirrorList l)))

; Solution 2 use of recursion
(define (palindromList2? l)
  ; returns true if the list is a palindrom (readable from both sides)
  ; List -> boolean
  (equalList? l (mirrorList l)))

(define (equalList? l1 l2)
  ; returns true if l1 is equal to l2
  ; 2 lists -> boolean
  (or
   (and (null? l1) (null? l2))
   (and (not (null? l1))
        (not (null? l2))
        (char=? (car l1) (car l2))
        (equalList? (cdr l1) (cdr l2)))))
 
;(palindromList1? '(#\a #\b #\c #\d))
;(palindromList1? '(#\a #\b #\b #\a))
;(palindromList2? '(#\a #\b #\c #\d))
;(palindromList2? '(#\a #\b #\b #\a))

; Exercise 4
(define (insert n l)
  ; returns an ordered list with n inside it.
  ; we suppose that l is already sorted
  ; integer, ordered list of integers -> ordered list of integers
  (cond ((null? l) (list n))
        ((<= n (car l))
             (cons n l))
         (else (cons (car l) (insert n (cdr l))))))
(insert 5 '(2 3 4 4 5 5 9 10))

(define (sortList l)
  ; returns a list with the same elements as l, sorted in ascending order
  ; list of integers -> ordered list of integers
  (if (null? l) l
      (insert (car l) (sortList (cdr l)))))


(sortList '(2 5 3 10 4 4 5 5 9 10))