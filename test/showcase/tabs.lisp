(in-package :xul-test)

(define-component tabs-showcase ()
  ()
  (:render (comp)
	   (<:vbox (<:flex= 1)
		   (<:style= "overflow: auto")
		   (<:description "XUL Tabs")
		   (<:group-box
		     (<:description "This is the standard tabbox.  It looks fine.")
		     (<:group-box
		       (<:tab-box (<:flex= 1)
				  (<:tabs
				    (<:tab (<:label= "Default")
					   (<:label= "Tab")
					   (<:label= "Orientation"))
				    (<:tab-panels (<:flex= 1)
						  (<:label (<:value= "Default"))
						  (<:label (<:value= "Tab"))
						  (<:label (<:value= "Orientation")))))))
		   (<:group-box
		     (<:description "This one has been turned on its head so that the tabs are on the bottom")
		     (<:group-box
		       (<:tab-box (<:flex= 1)
				  (<:tab-panels (<:flex= 1)
						(<:style= "border-bottom: 0px solid")
						(<:label (<:value= "Tabs"))
						(<:label (<:value= "on the"))
						(<:label (<:value= "bottom")))
				  (<:tabs (<:flex= 1)
					  (<:class*= "tabs-bottom")
					  (<:tab (<:label= "Tabs")
						 (<:class*= "tab-bottom"))
					  (<:tab (<:label= "on the")
						 (<:class*= "tab-bottom"))
					  (<:tab (<:label= "bottom")
						 (<:class*= "tab-bottom")))))
		     (<:group-box
		       (<:description "And here are a couple with the tabs on the side.  They work, but
   they''ll need a bunch of style changes to make them look reasonable.")
		       (<:group-box
			 (<:hbox
			   (<:tab-box (<:flex= 1)
				      (<:orient= :horizontal)
				      (<:tabs (<:orient= :vertical)
					      (<:class*= "tabs-left")
					      (<:tab (<:label= "Tabs")
						     (<:class*= "tab-left"))
					      (<:tab (<:label= "on the")
						     (<:class*= "tab-left"))
					      (<:tab (<:label= "left")
						     (<:class*= "tab-left")))
				      (<:tab-panels (<:flex= 1)
						    (<:label (<:value= "Tabs"))
						    (<:label (<:value= "on the"))
						    (<:label (<:value= "left"))))
			   (<:spacer (<:flex= 1))
			   (<:tab-box (<:flex= 1)
				      (<:orient= :horizontal)
				      (<:dir= :reverse)
				      (<:tabs (<:orient= :vertical)
					      (<:class*= "tabs-")
					      (<:tab (<:label= "Tabs"))
					      (<:tab (<:label= "on the"))
					      (<:tab (<:label= "left")))
				      (<:tab-panels
					(<:flex= 1)
					(<:label (<:value= "Tabs"))
					(<:label (<:value= "on the"))
					(<:label (<:value= "left")))))))))))
