(in-package :xul-test)

(define-component radio-buttons-showcase ()
  ((tab-state :initform "(no input yet)"
	      :accessor tab-state)
   (access-state :initform "(no input yet)"
	      :accessor access-state)
   (state-state :initform "(no input yet)"
		:accessor state-state)
   (images-state :initform "(no input yet)"
		 :accessor images-state)
   (orient-state :initform "(no input yet)"
		 :accessor orient-state))
  (:render (comp)
	   (<:vbox 
	     (<:style= "overflow: auto")
	     (<:description "XUL Radio-Buttons")
	     (<:hbox
	       (render-radio-buttons-tab comp)
	       (render-radio-buttons-access comp)
	       (render-radio-buttons-state comp))
	     (<:hbox
	       (render-radio-buttons-orientation comp)
	       (render-radio-buttons-images comp)))))

(defun render-radio-buttons-tab (comp)
  (<:group-box
    (<:flex= 1)
    (<:caption (<:label= "tabbing"))
    (<:vbox
      (<:description "These tab oddly")
      (flet ((tab-radio-button (number)
	       (<:radio (<:flex= 1)
			   (when (equalp (tab-state comp)
					 number)
			     (<:selected= t))
			   (<:tabindex= number)
			   (<:label= number)
			   (on-command=* (setf (tab-state comp) number)))))
	(mapcar #'tab-radio-button (list 1 2 3 4 5 6)))
      (<:hbox (<:pack= :center)
	      (princ-to-string (tab-state comp))))))

(defun render-radio-buttons-access (comp)
  (<:group-box
    (<:flex= 1)
    (<:caption (<:label= "accesskeys"))
    (<:vbox
      (<:description "These have access keys")
      (flet ((access-radio-button (label access-key)
	       (<:radio (<:flex= 1)
			   (when (equalp (access-state comp)
					 label)
			     (<:selected= t))
			   (<:label= label)
			   (<:accesskey= access-key)
			   (on-command=* (setf (access-state comp) label)))))
	(mapcar (lambda (args)
		  (apply #'access-radio-button args))
		'(("Animal" "A")
		  ("Bear" "B")
		  ("Cat" "C")
		  ("Dog" "D")
		  ("Deer" "E")
		  ("Fish" "F"))))
      (<:hbox (<:pack= :center)
	      (princ-to-string (access-state comp))))))

(defun render-radio-buttons-state (comp)
  (<:group-box
    (<:caption (<:label= "These show states"))
    (<:hbox 
      (<:radio (<:flex= 1)
		  (<:label= "Selected")
		  (<:selected= t)
		  (on-command=* (setf (state-state comp) "Selected")))
      (<:radio (<:flex= 1)
		  (<:label= "Normal")
		  (when (equalp (state-state comp) "Normal")
		    (<:selected= t))
		  (on-command=* (setf (state-state comp) "Normal")))
      (<:radio (<:flex= 1)
		  (<:label= "Disabled")
		  (when (equalp (state-state comp) "Disabled")
		    (<:selected= t))
		  (<:disabled= t)
		  (on-command=* (setf (state-state comp) "Disabled"))))
    (<:hbox (<:pack= :center)
	    (<:description (princ-to-string (state-state comp))))))

(defun render-radio-buttons-orientation (comp)
  (<:group-box
    (<:flex= 1)
    (<:caption (<:label= "orientation"))
    (<:vbox
      (<:description "These show different orientation.")
      (<:radio (<:label= "Left")
		  (on-command=* (setf (orient-state comp)
				      "A radio-button to the left of the label")))
      (<:radio (<:label= "Right")
		  (<:dir= :reverse)
		  (on-command=* (setf (orient-state comp)
				      "A radio-button to the right of the label")))
      (<:radio (<:label= "Above")
		  (<:orient= :vertical)
		  (<:dir= :forward)
		  (on-command=* (setf (orient-state comp)
				      "A radio-button above the label")))
      (<:radio (<:label= "Below")
		  (<:orient= :vertical)
		  (<:dir= :reverse)
		  (on-command=* (setf (orient-state comp)
				      "A radio-button below the label")))
      (<:radio (on-command=* (setf (orient-state comp)
				      "A radio-button with no label"))))
    (<:hbox (<:pack= :center)
	    (princ-to-string (orient-state comp)))))

(defun render-radio-buttons-images (comp)
  (<:group-box
    (<:flex= 1)
    (<:caption (<:label= "images"))
    (let ((image (asdf:system-relative-pathname :cl-xul-test
						"test/showcase/images/folder_yellow_open.png")))
      (<:vbox
	(<:description "These have images.")
	(<:radio (<:label= "Left")
		    (src= image)
		    (on-command=* (setf (images-state comp) "A radio-button to the left of the label")))
	(<:radio (<:label= "Right")
		    (<:dir= :reverse)
		    (src= image)
		    (on-command=* (setf (images-state comp) "A radio-button to the right of the label")))
	(<:radio (<:label= "Above")
		    (<:dir= :forward)
		    (<:orient= :vertical)
		    (src= image)
		    (on-command=* (setf (images-state comp) "A radio-button above the label")))
	(<:radio (<:label= "Below")
		    (<:dir= :reverse)
		    (<:orient= :vertical)
		    (src= image)
		    (on-command=* (setf (images-state comp) "A radio-button below the label"))))
      (<:hbox (<:pack= :center)
	      (princ-to-string (images-state comp))))))
