;G2 - TD1 - 26/01/2024

;Exercice 2
(define mot "abracadabra")

; extraire "abra¨
(substring mot 0 4)
(substring mot 7 11)

; extraire "ra"
(substring mot 2 4)
(substring mot 9 11)

; extraire "r"
(substring mot 2 3)

; extraire le caractère b
(string-ref mot 1)


; Exercice 3
(define ch "Bonjour le groupe G2")
; Tester si un mot est doublé
(string=? 
 (substring ch 0 (quotient (string-length ch) 2))
 (substring ch (quotient (string-length ch) 2) (string-length ch)))

; Doubler un mot
(string-append ch ch)

; Exercice 4
; carre
(define (carre x y)
  (and (and (< x 5) (> x -5))   ; axe des abcisses
       (and (< y 5) (> y -5))))  ; axe des ordonnées

;cercle
(define (cercle x y)
  (< (+ (* x x) (* y y)) 25))

;Demi-plan
(define (demiplan x y)
  (< y x))

;Octogone
(define (octogone x y )
  (and (and (> x -6) (< x 6))   ;axe des abcisses
       (and (> y -6) (< y 6))  ; axe des ordonnées
       (and (and (< y (+ x 9)) (> y (- x 9)))  ; pente à 1
            (and (< y (+ (- x) 9)) (> y (- (- x) 9))))))  ; pente à -1

;Lignes verticales
(define (vertical x)
  (and (< (remainder (- x 1) 4) 1)
       (> x 0)))  ; x supérieur à 0

;Triangle Rectangle
(define (trianglerectangle x y)
  (and (and (> x -5) (> y -3))   ; lignes horizontale et erticale
       (< (* 13 y) (- 33 (* x 9)))))   ; hypothénuse
   
; Exercice 5
(define (exo5 x1 x2 x3 x4 y1 y2 y3 y4)
  (not                     ; s'assurer quil ny a pas d'intersection
    (or (or (> x1 x4) (> x3 x2))
        (or (> y2 y3) (> y4 y1)))))