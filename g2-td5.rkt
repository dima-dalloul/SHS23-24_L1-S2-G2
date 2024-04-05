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

;(miroirListe '( 1 2 3 4 5 6))

; Exercice 3
; Solution 1 - utilisation de la fonction miroir String
(define (palindromeString1? mot)
  ; renvoie vrai si le mot est un palindrome, càd qu'on peut le lire dans les 2 sens
  ; liste de caractères -> booléen
  (string=? mot (miroirString mot)))

; Solution 2 - utilisation de la récursion
(define (palindromeString2? mot)
  ; renvoie vrai si le mot est un palindrome, càd qu'on peut le lire dans les 2 sens
  ; liste de caractères -> booléen
  (let ((lg (string-length mot)))
    (or (< lg 2)
        (and (char=? (string-ref mot 0) (string-ref mot (- lg 1)))
             (palindromeString2? (substring mot 1 (- lg 1)))))))

;(palindromeString1? "laval")
;(palindromeString1? "naval")
;(palindromeString1? "kayak")
;(palindromeString2? "laval")
;(palindromeString2? "naval")
;(palindromeString2? "kayak")

; Solution 1 - utilisation de miroir liste
(define (palindromeListe1? l)
  ; renvoie vrai si la liste est un palindrome
  ; liste de caractères -> booléem
  (equal? l (miroirListe l)))

; Solution 2 - utilisation de la récursion
(define (palindromeListe2? l)
  ; renvoie vrai si la liste est un palindrome
  ; liste de caractères -> booléem
  (listesEgales? l (miroirListe l)))

(define (listesEgales? l1 l2)
  ; renvoie vrai si l1 et l2 sont identiques
  ; 2 listes de caractèrs -> booléen
  (or
   (and (null? l1) (null? l2))
   (and
    (not (null? l1))
    (not (null? l2))
    (char=? (car l1) (car l2))
    (listesEgales? (cdr l1) (cdr l2)))))

;(palindromeListe1? '(#\a #\b #\c #\d))
;(palindromeListe1? '(#\a #\b #\b #\a))
;(palindromeListe2? '(#\a #\b #\c #\d))
;(palindromeListe2? '(#\a #\b #\b #\a))

; Exercice 4
(define (insere n l)
  ; renvoie uen liste dont les éléments sont n et ceux de l, triés dans l'ordre croissant
  ; on suppose que les éléments de la liste l sont déjà triés dans l'ordre croissant
  ; entier, liste d'entiers déjà triés -> liste d'entiers
  (cond ((null? l) (list n))
        ((<= n (car l)) (cons n l))
        (else (cons (car l) (insere n (cdr l))))))

;(insere 5 '(2 3 4 4))

(define (tri l)
  ; renvoie une liste ayant les mêmes éléments de l mais triés dans lordre croissant
  ; liste d'entiers - > liste d'entiers triés
  (if (null? l) l
      (insere (car l) (tri (cdr l)))))

;(tri '(10 2 5 3 9 4 4))

; Exercice 5
; Solution 1 : aucun support pour les chaîens de caractères avec accents
(define (phrase1 ch)
  ; renvoie une liste des mots de ch
  ; chaîne de caractères -> liste de chaînes
  (chercheMot1 ch))

(define (lettre? c)
  ; renvoie vrai ssi c est une lettre
  ; caractère -> booléen
  (and (char-ci>=? c #\a) (char-ci<=? c #\z)))

(define (chercheMot1 ch)
  ; renvoie la liste des mots de ch
  ; chaîne de caractères -> liste de chaînes
  (let ((lg (string-length ch)))
    (cond ((= lg 0) '())
          ((lettre? (string-ref ch 0)) (litMot1 (substring ch 0 1) (substring ch 1 lg)))
          (else (chercheMot1 (substring ch 1 lg))))))

(define (litMot1 c ch)
  ; renvoie la liste des mots de (string-append c ch)
  ; c est une lettre
   ; string non vide car une lettre, chaîne -> liste de chaînes
  (let ((lg (string-length ch)))
    (cond ((= lg 0) (list c))
          ((lettre? (string-ref ch 0)) (litMot1 (string-append c (substring ch 0 1)) (substring ch 1 lg)))
          (else (cons c (chercheMot1 (substring ch 1 lg)))))))

; Solution 2 : Accents acceptés
; Une liste de séparateurs est fournie à l'appel de phrase
(define (phrase2 ch l)
  ; renvoie la liste des mots de ch en considérant les caractères de l comme séparateurs
  ; chaîne, liste de caractères -> liste de chaînes
  (chercheMot2 ch l))

(define (appartient? c l)
  ; renvoie vrai ssi c est élément de l
  ; caractère, liste de caractères -> booléen
  (and (not (null? l))
       (or (char=? c (car l))
           (appartient? c (cdr l)))))

(define (chercheMot2 ch l)
  ; renvoie la liste des mots de ch en considérant les caractères de l comme séparateurs
  ; chaîne, liste de caractères -> liste de chaînes
  (let ((lg (string-length ch)))
    (cond ((= lg 0) '())
          ((appartient? (string-ref ch 0) l) (chercheMot2 (substring ch 1 lg) l))
          (else (litMot2 (substring ch 0 1) (substring ch 1 lg) l)))))

(define (litMot2 c ch l)
  ; renvoie la liste des mots de (string-append m ch) en considérant les caractères de l comme séparateurs
  ; m ne contient que des lettres
  ; chaîne non vide, chaîne, liste de caractères -> liste de chaines
  (let ((lg (string-length ch)))
    (cond ((= lg 0) (list c))
          ((appartient? (string-ref ch 0) l) (cons c (chercheMot2 (substring ch 1 lg) l)))
          (else (litMot2 (string-append c (substring ch 0 1)) (substring ch 1 lg) l)))))

; programme test
(phrase1 "Voici, par exemple, une belle phrase : des questions ?")
(phrase2 "Voici, par exemple, une belle phrase : des questions ?" '(#\space #\. #\, #\? #\! #\: #\;))
(phrase2 "Cette deuxième solution supporte aussi les signes diacritiques comme les lettres accentuées !" '(#\space #\. #\, #\? #\! #\: #\;))
(phrase1 "Ce n'est absolument pas le cas pour la première solution.")