 namespace eval dotlrn_jabber {
   
    ad_proc -public applet_key {
    } {
        What's my applet key?
    } {
        return dotlrn_jabber
    }

    ad_proc -public my_package_key {
    } {
        What's my package key?
    } {
        return "dotlrn-jabber"
    }

    ad_proc -public package_key {
    } {
        What package does this applet deal with?
    } {
        return jabber
    }

    ad_proc -public get_pretty_name {
    } {
        return the pretty name of this applet.
    } {
        return Jabber
    }

    ad_proc -public add_applet {
    } {
        Add the forums applet to dotlrn - for one-time init
        Must be repeatable!
    } {
        if {![dotlrn_applet::applet_exists_p -applet_key [applet_key]]} {

            db_transaction {
                dotlrn_applet::mount \
                    -package_key [my_package_key] \
                    -url jabber \
                    -pretty_name [get_pretty_name]

                dotlrn_applet::add_applet_to_dotlrn \
                    -applet_key [applet_key] \
                    -package_key [my_package_key]
            }

        }
    }

    ad_proc -public remove_applet {
    } {
        remove the applet from dotlrn
    } {
        ad_return_complaint 1 "[applet_key] remove_applet not implemented!"
    }


#########################################################################################
#     I'll try to trick dotlrn and always just return the same package_id               # 
#########################################################################################


    ad_proc -public add_applet_to_community {
        community_id
    } {
        Add the forums applet to a dotlrn community
    } {
        # Just Mount the Jabber package under this communities URL
     
#	set community_package_id [dotlrn_community::get_package_id $community_id]

 #       set node_id [db_string  get_node_id "SELECT node_id FROM site_nodes WHERE  object_id = :community_package_id"  ]
  
  #      set new_jabber_node_id [site_node::new -name jabber -parent_id $node_id]
  #$community_package_id
   #     site_node::mount -node_id $new_jabber_node_id -object_id [apm_package_id_from_key jabber]

        # Create and Mount the Jabber package
        set package_id [dotlrn::instantiate_and_mount \
            -mount_point "jabber" \
            $community_id \
            [package_key] \
        ]


        # Now add this Community to our jb_conference_patry_map and create a default conference room
        
	#set room_name [jb_get_default_room_for_group  $community_id ] 
	set room_name "abvcfdr" 
	#Just a hack for some reason the dotlrn routins leave the dbatabase (postgres only) in an insecure
	#state we are not able to create new acs_objects (we can but the call won't return)
	
	if {[db_0or1row get_room_id "SELECT room_id FROM jb_conference_rooms WHERE name =  :room_name"]} {

	    set new_room_id $room_id

	} else {
	
	    set new_room_id null

	}

        #db_dml add_community_to_conference_party_list "INSERT INTO jb_conference_groups 
                                                      #  (group_id , conference_only_p , default_room_id) 
                                                      #   values (:community_id , 'f' , $new_room_id)" 


        set members [dotlrn_community::get_rel_segment_id \
			 -community_id $community_id \
			 -rel_type dotlrn_member_rel \
			]

        permission::grant -party_id $members -object_id $package_id -privilege write
        permission::grant -party_id $members -object_id $package_id -privilege write



 
	# Set up the jabber portlet for this portal/community

	set portal_id [dotlrn_community::get_portal_id \
			   -community_id $community_id \
			  ]


  	jabber_portlet::add_self_to_page -portal_id $portal_id -package_id $package_id
    }





    ad_proc -public remove_applet_from_community {
        community_id
    } {
        remove the applet from the given community
    } {
        ad_return_complaint 1 "[applet_key] remove_applet_from_community not implemented!"
    }

    ad_proc -public add_user {
        user_id
    } {
        Called when the user is initially added as a dotlrn user.
        For one-time init stuff.
    } {
    }

    ad_proc -public remove_user {
        user_id
    } {
        called when a user is removed from dotlrn.
    } {
    }
 
    ad_proc -public add_user_to_community {
        user_id community_id
    } {
        called when a user is added to a dotlrn community.
    } {
    }



   ad_proc -public remove_user_from_community {
        user_id community_id
    } {
        called when a user is removed from a dotlrn community.
    } {
    }


    ad_proc -public add_portlet {
        portal_id
    } {
        A helper proc to set up default params for templates.

        @param portal_id
    } {

        #we don't need this stuff here.
       # set args [ns_set create]
       # ns_set put $args package_id 0
       # ns_set put $args display_group_name_p f
       # ns_set put $args param_action overwrite

       # set type [dotlrn::get_type_from_portal_id -portal_id $portal_id]

        #if {[string equal $type user]} {
            # portal_id is a user portal template
         #   ns_set put $args display_group_name_p t
        #}

        jabber_portlet::add_self_to_page -portal_id $portal_id -package_id 0
	# we don't need a package_id here , this call makes the portlet available inside the admin space of dotlrn
	# adding a available portlet to a community actually creates a new instance.

    }

    ad_proc -public remove_portlet {
	{-portal_id:required}
    } {

	jabber_portlet::remove_self_from_page -portal_id $portal_id -package_id 0
	return
    }

    ad_proc -public clone {
        old_community_id
        new_community_id
    } {
        Clone this applet's content from the old community to the new one
    } {
        dotlrn_jabber::add_applet_to_community $new_community_id
    }

}
