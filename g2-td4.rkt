;TD4 - 08/03/2024

;Exercice 1
(define (sommePremiersEntiers n)
  (if (= n 0) 0
  (+ n (sommePremiersEntiers (- n 1)))))

(define (exercice1)
  (display "Entrer un entier supérieur à 0 : ")
  (define n (read))
  (display "La somme des ") (display n) (display " premiers entiers est ")
  (display  (sommePremiersEntiers n)))

;(exercice1)

; Exercice 2
(define (sommePremiersPairs n)
  (cond ((= n 0) 0)
        ((= (remainder n 2) 0) (+ n (sommePremiersPairs (- n 2))))
        (else (sommePremiersPairs (- n 1)))))

(define (exercice2)
  (display "Entrer un entier supérieur à 0 : ")
  (define n (read))
  (display "La somme des ") (display n) (display " premiers entiers pairs est ")
  (display  (sommePremiersPairs n)))