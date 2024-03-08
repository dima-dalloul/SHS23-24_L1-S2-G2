;TD3 - 16/02/2024

;Pour récupérer l'entrée utilisateur en tant que String
;(symbol->string (read))

;Exercice 1
;a
(define (estVoyelle? c)
  ; renvoie vrai ssi c est une voyelle
  ; caractère -> booléen
  (or (char-ci=? c #\a)
      (char-ci=? c #\e)
      (char-ci=? c #\i)
      (char-ci=? c #\o)
      (char-ci=? c #\u)
      (char-ci=? c #\y)))

;(display (estVoyelle? #\b))(newline)
;(display (estVoyelle? #\i))(newline)

;b
(define (premierGroupe? verbe)
  ; renvoie vrai ssi le verbe est du premier groupe, càd finit avec -er
  ; string -> booléen
  (string=? "er"(substring verbe (- (string-length verbe) 2) (string-length verbe))))

;(display (premierGroupe? "chanter"))

;c
(define (conjugaison verbe)
  ; affiche la conjugaison du verbe donné en paramètre
  ; ce verbe est du premier groupe
  ; string -> plusieurs lignes d'affichage
  (if (premierGroupe? verbe)
      (let ((racine (substring verbe 0 (- (string-length verbe) 2))))
      (begin
        (display (if (estVoyelle? (string-ref verbe 0))
                       "j'"
                       "je "))
                   (display (string-append racine "e"))(newline)
        (display "tu ")(display (string-append racine "es"))(newline)
        (display "il/elle/on ")(display (string-append racine "e"))(newline)
        (display "nous ")(display (string-append racine "ons"))(newline)
        (display "vous ")(display (string-append racine "ez"))(newline)
        (display "ils/elles ")(display (string-append racine "ent"))(newline)))
      (begin
        (display "Le verbe donné n'est pas du premier groupe")(newline))))

;(conjugaison (symbol->string (read)))



;d
(define (genre)
  ; Programme permettant d'écrire correctement un groupe nominal composé d'un article
  ; défini et d'un nom, ce dernier et son genre étant saisis au clavier.
  ; pas d'entrées -> affichage dans console
  (display "Écrire un mot")(newline)
  (define mot (symbol->string (read)))
  (display "Genre ? (m ou f)")(newline)
  (define g (symbol->string (read)))
  (display (if (estVoyelle? (string-ref mot 0))
                "l'"
                (cond ((equal? g "m") "le ")
                      ((equal? g "f") "la "))))
  (display mot)(newline))

;(genre)


;Exercice 2
(define (max2 a b)
  ; retourne le plus grand entre a et b
  ; 2 réels -> 1 réel
  (if (> a b)
      a
      b))

(define (min2 a b)
  ; retourne le plus petit entre a et b
  ; 2 réels -> 1 réel
  (if (< a b)
      a
      b))

(define (moy2 a b)
  ; retourne la moyenne entre a et b
  ; 2 réels -> 1 réel
  (/ (+ a b) 2))

(define (max3 a b c)
  ; retourne le plus grand entre a, b et c
  ; 3 réels -> 1 réel
  (max2 (max2 a b) c))

(define (min3 a b c)
  ; retourne le plus petit entre a, b et c
  ; 3 réels -> 1 réel
  (min2 (min2 a b) c))

(define (moy3 a b c)
  ; retourne la moyenne entre a, b et c
  ; 3 réels -> 1 réel
  (/ (+ a b c) 3))
  
(define (meilleureNote a b c)
  ; retourne le maximum entre la moyenne des 3 notes de l'étudiant et entre la moyenne de
  ; sa plus grande note et sa plus faible note
  ; 3 réels -> 1 réel
  (define moyenne3Notes (moy3 a b c))
  (define plusGrandeNote (max3 a b c))
  (define plusPetiteNote (min3 a b c))
  (define moyPlusGrandePlusPetiteNote (moy2 plusGrandeNote plusPetiteNote))
  (display "La moyenne de l'étudiant est ")
  (display (max2 moyenne3Notes moyPlusGrandePlusPetiteNote)))

;(meilleureNote 10 15 10)

; Exercice 3
;a
(define (delta a b c)
  ; retourne le discriminant de l'équation de type ax² + bx + c = 0 
  ; réel <> 0, 2 réels -> 1 réel
  (- (* b b) (* 4 a c)))

(define (solution a b c delta negative)
  ; retourne la solution 1 d'une équation de type ax² + bx + c = 0
  ; réel <> 0, 2 réels, 1 réel <> 0, booléen -> réel
  (/ (+ (- b) (* (sqrt delta) (if negative -1 1))) (* 2 a)))

;(define d (delta 1 2 3))
;(display (solution 1 2 3 d #t))(newline)
;(display (solution 1 2 3 d #f))

;b
(define (solutionCommune)
  ; Programme permettant de vérifier si 2 telles équations saisies au clavier ont une
  ; solution en commun
  ; aucune entrée -> affichage sur console
  (display "Veuillez écrire a, b et c de la première équation ")
  (define a1 (read)) (define b1 (read)) (define c1 (read))
  (display "Veuillez écrire a, b et c de la seconde équation ")
  (define a2 (read)) (define b2 (read)) (define c2 (read))
  (define delta1 (delta a1 b1 c1))
  (define delta2 (delta a2 b2 c2))
  (cond
    ((or (< delta1 0) (< delta2 0)) (display "Aucune solution commune"))
    ((or (= (solution a1 b1 c1 delta1 #f) (solution a2 b2 c2 delta2 #f))
         (= (solution a1 b1 c1 delta1 #t) (solution a2 b2 c2 delta2 #f))
         (= (solution a1 b1 c1 delta1 #f) (solution a2 b2 c2 delta2 #t))
         (= (solution a1 b1 c1 delta1 #t) (solution a2 b2 c2 delta2 #t)))
     (display "Il y a au moins une solution commune"))
    (else (display "Aucune solution commune"))))

;(solutionCommune)

;Exercice 4
(define (exercice4)
  ; Programme qui simule une calculatrice
  ; 2 entiers entre 0 et 9, ainsi qu'une opération -> 1 réel
  (display "Écrire une opération de type a+b : ")
  (define entreeUtilisateur (read))
  (define strgUtilisateur (symbol->string entreeUtilisateur))
  (define a (string-ref strgUtilisateur 0))
  (define op (string-ref strgUtilisateur 1))
  (define b (string-ref strgUtilisateur 2))
  (display "Résultat : ")
  (display (calculatrice a op b)))

(define (calculatrice a op b)
  ; Calculatrice
  ; 2 entiers entre 0 et 9, ainsi qu'une opération -> 1 réel
  (cond ((char=? op #\+) (+ (nombre a) (nombre b)))
        ((char=? op #\-) (- (nombre a) (nombre b)))
        ((char=? op #\*) (* (nombre a) (nombre b)))
        ((char=? op #\:) (/ (nombre a) (nombre b)))))

(define (nombre n)
  ; renvoie le nombre correspondant au string/charactère a
  ; char -> entier
  ; solution 1 (string->number a))
  ; solution 2
  (cond ((char=? n #\0) 0)
        ((char=? n #\1) 1)
        ((char=? n #\2) 2)
        ((char=? n #\3) 3)
        ((char=? n #\4) 4)
        ((char=? n #\5) 5)
        ((char=? n #\6) 6)
        ((char=? n #\7) 7)
        ((char=? n #\8) 8)
        (else 9)))

;(exercice4)


; Exercise 5
(define (question x)
  (begin 
    (display "Est-ce que le nombre est plus grand que : ")
    (display x)
    (display " : (répondre oui/non) ")
    (cond ((symbol=? (read)'oui) true)(true false)))
  )

(define (result x)
  (string-append "C´est : "  (number->string x)))

(define (exercise5)
  ; program for the guessing game
  ; no parameter -> correct guess of the program
  (display 
   (result  
    (cond ((question 8)
           (cond ((question 12)
                  (cond ((question 14)
                         (cond ((question 15) 16)(true 15)))
                        (true (cond ((question 13) 14)(true 13)))))
                 (true 
                  (cond ((question 10)
                         (cond ((question 11) 12)(true 11)))
                        (true (cond ((question 9) 10)(true 9)))))))
          (true
           (cond ((question 4)
                  (cond ((question 6)
                         (cond ((question 7) 8)(true 7)))
                        (true (cond ((question 5) 6)(true 5)))))
                 (true 
                  (cond ((question 2)
                         (cond ((question 3) 4)(true 3)))
                        (true (cond ((question 1) 2)(true 1))))))))
    )
   ))
;(exercise5)