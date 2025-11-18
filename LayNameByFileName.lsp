;; Sets first layout tab to be the same name as the drawing      ;;
;; Useful for batchplot operations to avoid renaming files       ;;
;; Will not work correctly on drawings with multiple layout tabs ;;

(defun c:LNByFile (/ text otext n ename x)
  (vl-load-com)
   (setq otext "otext")
   (setq text (strcat (vl-filename-base (getvar "dwgname"))))
   (not (vl-position "" (list otext text)))
   (vlax-for x (vla-get-layouts (vla-get-activedocument (vlax-get-acad-object)))
     (setq otext (vla-get-name x))
     (vl-catch-all-apply 'vla-put-name (list x (vl-string-subst text otext (vla-get-name x))))
   ) ;_ vlax-for
 (princ)
) ;_ defun

(princ "\\n Layout Name By File Name loaded")
(princ "\\n Type \"LNByFile\" to Invoke")  
  