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

; (exercice2) 

; Exercice 3
(define (puissance x n)
  ; retourne la nème puissance de x
  ; réel, entier >= 0 -> réel
  (cond (( = n 0) 1)
        ((= x 0) 0)
        (else (* x (puissance x (- n 1))))))

(define (puissanceGlobale x n)
  ; retourne x élevé à la nème puissance
  ; réel, entier -> réel
  (if (>= n 0) (puissance x n)
      (/ 1 (puissance x (- n)))))

(define (approximationRacine x n)
  ; retourne une approximation tendant vers l'entier le plus grand inférieur ou égal à la nème racine de x
  ; réel >= 0, entier >=0 -> réel >=0
  (approxRacine x n 1))

(define (approxRacine x n y)
  ; renvoie une approximation à 1 près par valeur inférieure de la nème racine de x
  ; il faut que y soit AU PLUS égal à cette valeur + 1
  ; réel >= 0, entier >=0, entier >= 1 -> réel >=0
  (if (> (puissanceGlobale y n) x) (- y 1)
      (approxRacine x n (+ y 1))))

;(puissance 2 3)
;(puissanceGlobale 2 -4)
;(approximationRacine 32.768 3)


; Exercice 4
(define (pgcd a b)
  ; retourne le plus grand commun diviseur entre a et b
  ; 2 entiers -> entier
  (if (< a b)
      (pgcdRecursion a b a)
      (pgcdRecursion a b b)))

(define (pgcdRecursion a b c)
  ; retourne le plus grand commun diviseur entre a et b, c sert pour la récusion
  ; 3 entiers -> entier
  (if (and (= (remainder a c) 0)
           (= (remainder b c) 0))
           c
           (pgcdRecursion a b (- c 1))))
;(pgcd 4 8)
;(pgcd 500 350)


;Exercise 5
(define (fibonacci n)
  ; fonction pour calculer la suite Fibonacci
  ; entier -> entier
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else
         (+ (fibonacci (- n 1)) (fibonacci (- n 2))))))

;(fibonacci 10)
;(fibonacci 100)

; Exercise 6
(define (u n)
  ; Séquence u
  ; entier -> réel
  (if (= n 0) 1
      (+ (* 3 (v (- n 1))) 4)))

(define (v n)
  ; Séquence v
  ; entier -> réel
  (if (= n 0) 0
      (/ 1 (u (- n 1)))))

;(u 3)
;(v 8)