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

(conjugaison (symbol->string (read)))