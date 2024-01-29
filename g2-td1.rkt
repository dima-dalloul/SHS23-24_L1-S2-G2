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















