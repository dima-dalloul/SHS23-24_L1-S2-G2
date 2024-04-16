; Examen 2022-2023
; Section 1 - Variations et pourcentages
; 1.1
(define (variation a b)
  ; retourne la variation du nombre sur lequel on applique le pourcetage
  ; 2 réels -> réel
  (* a (+ (/ b 100) 1)))
;(variation 10 5) ;renvoie 10.5
;(variation 12 -10) ;renvoie 10.8
;(variation 8.5 13) ;renvoie 9.605.

; 1.2
(define (pourcentage a b)
  ; renvoie le pourcentage de a vers b
  ; 2 réels -> 1 réel
  (if (= a 0)
      (display "Impossible de diviser par 0"))
  (/ (* (- b a) 100) a))
;(pourcentage 10 10.5); renvoie 5,
;(pourcentage 12 10.8); renvoie -10
;(pourcentage 8.5 9.605); renvoie 13

; 1.3
(define (apresNVariations VI n p)
  ; retourne la valeur de VI après n variations du pourcentage p
  ; 3 réels -> 1 réel
  (if (= n 0)
      VI
      (apresNVariations (variation VI p) (- n 1) p)))
;(apresNVariations 1 4 100) ;renvoie 16
;(apresNVariations 10 3 -50) ;renvoie 1.25
;(apresNVariations 1 4 100) ;renvoie 16
;(apresNVariations 10 3 -50) ;renvoie 1.25

; 1.4
(define (appliqueVariations n l)
  ; renvoie la valeur de n surlaquelle on a apoliqué
  ; successivement les pourcentages contenus dans la liste l
  ; 1 réel, liste de réels -> réel
  (cond
    ((null? (cdr l))
     (variation n (car l)))
    (else
     (appliqueVariations (variation n (car l)) (cdr l)))))
;(appliqueVariations 10 '(10 100 -50)) ;renvoie 11.

; 1.5
(define (pourcentagesDeVariation liste)
  ; renvoie la liste de variations entre un élément de la liste et l'élément suivant de la liste
  ; liste de réels -> liste de réels
  (if (>= (length liste) 2)
      (cons ((pourcentage (car liste) (cadr liste)) (pourcentagesDeVariation (cdr liste))))))


(pourcentagesDeVariation '(10 11 22 11)) ; renvoie '(10 100 -50).