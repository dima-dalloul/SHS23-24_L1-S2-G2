; TD 5 - 22/03/2024

; Exercice 2
(define (miroirString mot)
  ; renvoie le miroir de mot (mot écrit à l'envers)
  ; string -> string
  (if (= (string-length mot) 0) ""
      (string-append (miroirString (substring mot 1 (string-length mot)))
                     (substring mot 0 1))))

;(miroirString "Bonjour")

; Pour une liste, on ne peut pas s'inspirer des solutions trouvées pour une chaîne :
; on peut parcourir de gauche à droite, mais pas ajouter en fin de liste ;
; on peut ajouter en début de liste, mais pas parcourir de droite à gauche
(define (miroirListe l)
  ; renvoie le miroir de l (une liste contenant tous les éléments de l dans l'ordre inverse)
  ; liste -> liste
  (miroirL l '()))

(define (miroirL lg lr)
  ; renvoie une liste contenant les éléments de ld dans l'ordre inverse,
  ; puis ceux de lr dans le même ordre
  ; 2 listes -> liste
  (if (null? lg) lr
      (miroirL (cdr lg) (cons (car lg) lr))))

(miroirListe '( 1 2 3 4 5 6))