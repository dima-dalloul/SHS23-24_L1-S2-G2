;G2 - TD2 - 09-02-2024

; Exercice 1
(define (exercice1)
  (define anneeEnCours 2024)
  (display "Veuillez écrire votre année de naissance")
  (define x (read))
  (newline)
  (display "Avez-vous fêté votre anniversaire cette année? (oui/non)")
  (define anniv (read))
  (newline)
  (cond
    ((equal? anniv 'oui)
     (display  "Vous avez ")(display (- anneeEnCours x)) (display " ans"))
    ((equal? anniv 'non)
     (display  "Vous avez ")(display (- (- anneeEnCours x) 1)) (display " ans"))))

;Exercice 2
(define (exercice2)
  (display "Veuillez entrer 2 entiers non nuls ")
  (define A (read))
  (define B (read))

  (define ajout (+ A B))
  (define soustraction (- A B))
  (define mult (* A B))
  (define division (quotient A B))
  (define reste (remainder A B))

  ; Affichage en une ligne
  (display "A= ")
  (display A)
  (display ", B= ")
  (display B)
  (display ", A+B= ")
  (display ajout)
  (display ", A-B= ")
  (display soustraction)
  (display ", A*B= ")
  (display mult)
  (display ", A/B= ")
  (display division)
  (display ", reste de A/B= ")
  (display reste)

  ; Affichage en une colonne
  (newline)
  (display "A= ")
  (display A)
  (newline)
  (display "B= ")
  (display B)
  (newline)
  (display "A+B= ")
  (display ajout)
  (newline)
  (display "A-B= ")
  (display soustraction)
  (newline)
  (display "A*B= ")
  (display mult)
  (newline)
  (display "A/B= ")
  (display division)
  (newline)
  (display "reste de A/B= ")
  (display reste))

;Exercice 3
(define (aireTriangle b h)
  ; renvoie laiire dun triangle en prenant son hauteur h et sa base b
  ; 2 réels >= 0 -> 1 réel >= 0
  (/ ( * b h) 2))

(define (aireTriangleEquilateral c)
  ; renvoie l'aire d'un triangle équilatéral ayant pour côté c
  ; 1 réel >= 0 -> 1 réel >= 0
  (aireTriangle c (* (/ (sqrt 3) 2) c)))

(define (aireHexagoneRegulier c)
  ; renvoie l'aire d'un hexagone régulier ayant pour côté c
  ; 1 réel >= 0 -> 1 réel >= 0
(* 6 (aireTriangleEquilateral c)))
  
(display (aireHexagoneRegulier (read)))
