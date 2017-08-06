;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname CompoundData) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "universe.rkt" "teachpack" "2htdp")))))
;; Lecture 

;; Compund data 

;; A posn is
;;  (make-posn num num)

;; distance-to-0 : posn -> num
;; To compute how far as the crow flies p
;;   is from the origin
;(define (distance-to-0 p)
;  ... (posn-x p) ... (posn-y p) ...)
(define (distance-to-0 p)
  (sqrt (+ (expt (posn-x p) 2)
           (expt (posn-y p) 2))))

(check-expect (distance-to-0 (make-posn 0 0))
              0)
(check-within (distance-to-0 (make-posn 1 1))
              (sqrt 2)
              0.00001)
(check-expect (distance-to-0 (make-posn 3 4))
              5)
(check-expect (distance-to-0 (make-posn -3 -4))
              5)

;; ----------------------------------------

;; A snake is
;;  (make-snake sym num sym)

(define-struct snake (name weight food))

;; snake-skinny? : snake -> boolean
;;  To determine whether s is < 10 lbs
;(define (snake-skinny? s)
;  ... (snake-name s) .... (snake-weight s) .... (snake-food s)
;  ....)
(define (snake-skinny? s)
  (< (snake-weight s) 10))

(check-expect (snake-skinny? (make-snake 'Slimey 10 'rats))
              false)
(check-expect (snake-skinny? (make-snake 'Slinky 1 'donuts))
              true)
(check-expect (snake-skinny? (make-snake 'Smokey 20 'steak))
              false)

;; feed-snake : snake -> snake
;;  To feed s 5 lbs of food
;(define (feed-snake s)
;  .... (snake-name s) .... (snake-weight s) ... (snake-food s)
;  ....)
(define (feed-snake s)
  (make-snake (snake-name s) (+ 5 (snake-weight s)) (snake-food s)))

(check-expect (feed-snake (make-snake 'Slimey 10 'rats))
              (make-snake 'Slimey 15 'rats))
(check-expect (feed-snake (make-snake 'Slinky 1 'donuts))
              (make-snake 'Slinky 6 'donuts))

;; ----------------------------------------

;; A dillo is
;;  (make-dillo num bool)
(define-struct dillo (weight alive?))

;; run-over-with-car : dillo -> dillo
;;  To (unfortunately) kill d
;(define (run-over-with-car d)
;  ... (dillo-weight d) .... (dillo-alive? d)
;  ....)
(define (run-over-with-car d)
  (make-dillo (dillo-weight d) false))

(check-expect (run-over-with-car (make-dillo 5 true))
              (make-dillo 5 false))
(check-expect (run-over-with-car (make-dillo 6 false))
              (make-dillo 6 false))


;; feed-dillo : dillo -> dillo
;;  To feed d 2 lbs of food, if it's alive
;(define (feed-dillo d)
;  ... (dillo-weight d) .... (dillo-alive? d)
;  ....)
(define (feed-dillo d)
  (cond
    [(dillo-alive? d) (make-dillo (+ 2 (dillo-weight d)) true)]
    [else d]))

(check-expect (feed-dillo (make-dillo 5 true))
              (make-dillo 7 true))
(check-expect (feed-dillo (make-dillo 6 false))
              (make-dillo 6 false))