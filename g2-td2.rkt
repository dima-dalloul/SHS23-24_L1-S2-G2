;TD2 - 09-02-2024

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
  
;(display (aireHexagoneRegulier (read)))

; Exercice 4
(define (moyennePonderee v1 v2 p1 p2)
  ; renvoie la moyenne pondérée de v1 et v2, avec pour poids respectifs p1 et p2
  ; réels > 0 -> réel
  (/ (+ (* v1 p1) (* v2 p2)) (+ p1 p2)))

;(display (moyennePonderee 2 4 2 4))


(define (exercice4b)
  ; fonction pour obtenir 6 valeurs de l'utilisateur et pour calculer
  ; la moyenne non pondérée puis la moyenne pondérée de ces aleurs
  ; 12 réels > 0 -> réel pour la moyenne non pondérée et réel pour moyenne pondérée
  (display "Veuillez écrire 6 valeurs")
  (define v1 (read)) (define v2 (read)) (define v3 (read))
  (define v4 (read)) (define v5 (read)) (define v6 (read))

  (display "Veuillez écrire 6 poids")
  (define p1 (read)) (define p2 (read)) (define p3 (read))
  (define p4 (read)) (define p5 (read)) (define p6 (read))

  (define moyenneNonPonderee1 (moyennePonderee (moyennePonderee (moyennePonderee v1 v2 1 1)
                                                                (moyennePonderee v3 v4 1 1)
                                                                1 1)
                                              (moyennePonderee v5 v6 1 1)
                                              2 1))
  (define moyenneNonPonderee2 (moyennePonderee (/ (+ v1 v2 v3) 3) (/ (+ v4 v5 v6) 3) 3 3))

  (display "Moyenne Non Pondérée : ")
  (display moyenneNonPonderee1)(newline)
  (display moyenneNonPonderee2)(newline)


  (define moyPond (moyennePonderee (moyennePonderee (moyennePonderee v1 v2 p1 p2)
                                                    (moyennePonderee v3 v4 p3 p4)
                                                    1 1)
                                   (moyennePonderee v5 v6 p5 p6)
                                   2 1))
  (display "Moyenne Pondérée : ")
  (display moyPond)(newline))
