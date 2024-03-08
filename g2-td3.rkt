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

(solutionCommune)