;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HW0) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require 2htdp/image)
;; problem 1
;; number -> image
;;image1
;; creates image showing number 12 raised to the 37nd power
  ( define image1 
     (text(number->string (expt 12 37)) 12 "black"))
;;problem 2
;; number-> string
;;image2
;; creates image showing 12 raised to the 37nd power
 ( define image2
    ( overlay image1 (rectangle (image-width image1) (image-height image1) "outline" "blue" ) ) )
 ;; problem 3
 ;;image-> image
 ;; on-blue
 ;;takes any image and places on blue background
 ( define (on-blue im)
    (overlay im (rectangle (image-width im) (image-height im) "outline" "blue" )))
 ;; problem 4
 ;;2 numbers->number
 ;;distance
 ;;takes anu point and calculates distance between that point and origin
 ( define (distance x y)
    ( sqrt( + (sqr x) (sqr y))))
 ;;problem 5
 ;;string & number-> string
 ;;string-insert
 ;;consumes string and number and inserts " " at the position defined by number
 
 (define (string-insert str i)
   (string-append ( substring str 0 i) " " (substring str i )))
 ;;checking
 ( check-expect ( string-insert "Higuys" 2) "Hi guys")
 ( check-expect ( string-insert "NameJudy" 4) "Name Judy")
 ( check-expect ( string-insert "ComputerProgramming" 8 ) "Computer Programming")
 
 
  