;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname finaltest.practice) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct painting (title artist year price))
(define pa1 (make-painting "Impression Sunrise" "Claude Oscar Monet" 1894 201.59))
(define pa2 (make-painting "Don Quixote" "Pablo Picasso" 1955 51.78))
;;;;list-of-paintings is either
;;empty or
;;cons (cons painting list-of-paintings )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;priceless: painting-> boolean
  ;purpose: check if the price of the given painting is less than 50
;ex
;(priceLess pa1) false
(define (priceLess p)
  ;p:painting
  ( < (painting-price p) 50))
;;;;;;;;;;;;;;;;;
;byArtist: painting artist->boolean
;purpose:checks if the painting is by the given artist
;ex
;(byArtist pa1 "Claude Oscar Monet") true
;(byArtis pa2 "Claude Oscar Monet")false
(define (byArtist p art)
  ;p:painting
  ;art:artist
  ( string=? art (painting-artist p)))
;;;;;;;;;;;;;;;;;;
;countPaintingPriceLess70: list-of-paintings->list-of-paintings
;purpose:return the list of paintings that have price less than 70
(define (countPaintingPriceLess70 lp)
  ;lp:list-of-paintings
  ( cond [(empty? lp) 0]
         [(cons? lp) (cond [( < (painting-price (first lp)) 70) (cons (first lp) (painting-artist (rest lp)))]
                           [else (painting-artist (rest lp))])]))
(define (listAllPaintingsBy lp art)
  ;lp: list-of-paintings
  ;art: artist
  (cond [(empty? lp) empty]
        [(cons? lp) (cond [(string=? art (painting-artist (first lp))) (cons (first lp) (listAllPaintingsBy (rest lp) art))]
                          [else (listAllPaintingsBy (rest lp) art)])]))
(define-struct poster( title artist year size price))
(define po1 (make-poster "Woman with Pears" "Pablo Picasso" 1909 "M" 22.99 ))
;list-of-galleryitems is either
;empty or
;cons either painting or poster
(define (count lg)
  ;lg:list-of-galleryitems
  ( cond [(empty? lg) 0]
         [(cons? lg) ( + 1 (count (rest lg)))]))
(define (totalPrice lg)
  ;lg:list-of-galleryitems
  (cond [(empty? lg) 0]
        [(cons? lg) (cond [(painting? (first lg)) (cons (painting-price (first lg)) (totalPrice (rest lg)))]
                          [(poster? (first lg)) (cons (poster-price (first lg)) (totalPrice (rest lg)))])]))

  