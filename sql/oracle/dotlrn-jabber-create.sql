-- This is the sql code to integrate a Jabber applet into dotlrn
-- author Bjoern Kiesbye bkiesbye@sussdorff-roy.com


declare
	foo integer;
begin
	-- create the implementation
	foo := acs_sc_impl.new (
		'dotlrn_applet',
		'dotlrn_jabber',
		'dotlrn_jabber'
	);

	-- add all the hooks

	-- GetPrettyName
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_jabber',
	       'GetPrettyName',
	       'dotlrn_jabber::get_pretty_name',
	       'TCL'
	);

	-- AddApplet
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_jabber',
	       'AddApplet',
	       'dotlrn_jabber::add_applet',
	       'TCL'
	);

	-- RemoveApplet
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_jabber',
	       'RemoveApplet',
	       'dotlrn_jabber::remove_applet',
	       'TCL'
	);

	-- AddAppletToCommunity
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_jabber',
	       'AddAppletToCommunity',
	       'dotlrn_jabber::add_applet_to_community',
	       'TCL'
	);

	-- RemoveAppletFromCommunity
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_jabber',
	       'RemoveAppletFromCommunity',
	       'dotlrn_jabber::remove_applet_from_community',
	       'TCL'
	);
	-- AddUser
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_jabber',
	       'AddUser',
	       'dotlrn_jabber::add_user',
	       'TCL'
	);

	-- RemoveUser
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_jabber',
	       'RemoveUser',
	       'dotlrn_jabber::remove_user',
	       'TCL'
	);

	-- AddUserToCommunity
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_jabber',
	       'AddUserToCommunity',
	       'dotlrn_jabber::add_user_to_community',
	       'TCL'
	);

	-- RemoveUserFromCommunity
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_jabber',
	       'RemoveUserFromCommunity',
	       'dotlrn_jabber::remove_user_from_community',
	       'TCL'
	);

    -- AddPortlet
    foo := acs_sc_impl.new_alias (
        impl_contract_name => 'dotlrn_applet',
        impl_name => 'dotlrn_jabber',
        impl_operation_name => 'AddPortlet',
        impl_alias => 'dotlrn_jabber::add_portlet',
        impl_pl => 'TCL'
    );

    -- RemovePortlet
    foo := acs_sc_impl.new_alias (
        impl_contract_name => 'dotlrn_applet',
        impl_name => 'dotlrn_jabber',
        impl_operation_name => 'RemovePortlet',
        impl_alias => 'dotlrn_jabber::remove_portlet',
        impl_pl => 'TCL'
    );

    -- Clone
    foo := acs_sc_impl.new_alias (
        impl_contract_name => 'dotlrn_applet',
        impl_name => 'dotlrn_jabber',
        impl_operation_name => 'Clone',
        impl_alias => 'dotlrn_jabber::clone',
        impl_pl => 'TCL'
    );

    -- Change Event Handler

    foo := acs_sc_impl.new_alias(
        impl_contract_name => 'dotlrn_applet',
        impl_name => 'dotlrn_jabber',
        impl_operation_name => 'ChangeEventHandler',
        impl_alias => 'dotlrn_jabber::change_event_handler',
        impl_pl => 'TCL'
    );


	-- Add the binding
	acs_sc_binding.new (
	    contract_name => 'dotlrn_applet',
	    impl_name => 'dotlrn_jabber'
	);
end;
/
show errors;
