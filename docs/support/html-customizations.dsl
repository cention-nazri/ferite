<!DOCTYPE style-sheet PUBLIC "-//James Clark//DTD DSSSL Style Sheet//EN" [
<!ENTITY dbstyle PUBLIC "-//Norman Walsh//DOCUMENT DocBook HTML Stylesheet//EN" CDATA DSSSL>
]>

<style-sheet>
<style-specification use="docbook">
<style-specification-body>

;; my own customizations for HTML output:
(define %use-id-as-filename% #t)
(define %html-ext% ".html")

(define %admon-graphics-path%
  ;; Path to admonition graphics
  "figures/")

(define %admon-graphics%
  ;; Use graphics in admonitions?
  #t)

(define %indent-programlisting-lines%
  ;; Indent lines in a 'ProgramListing'?
  "  ")

(define %shade-verbatim%  
  ;; Should verbatim environments be shaded?
  #t)

(define ($shade-verbatim-attr$)
  ;; Attributes used to create a shaded verbatim environment.
  (list
   (list "BORDER" "0")
   (list "BGCOLOR" "#f0f0f0")
   (list "CELLPADDING" "5")
   (list "CELLSPACING" "1")
   (list "WIDTH" "90%")
   (list "ALIGN" "CENTER")))

(define %root-filename%
  ;; Name for the root HTML document
  "index")

(define %body-attr% 
  ;; What attributes should be hung off of BODY?
  (list
   (list "BGCOLOR" "#FFFFFF")
   (list "TEXT" "#0000A0")
   (list "LINK" "#2020D0")
   (list "VLINK" "#000060")
   (list "ALINK" "#5050F0")))

(define %css-decoration%
  ;; Enable CSS decoration of elements
  #t)

(define %stylesheet%
  ;; Name of the stylesheet to use
  "stylesheet.css")

(define biblio-number
  ;; Enumerate bibliography entries
  #t)

</style-specification-body>
</style-specification>
<external-specification id="docbook" document="dbstyle">
</style-sheet>
