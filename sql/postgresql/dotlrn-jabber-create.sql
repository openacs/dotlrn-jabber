--  Copyrigth (C) 2003 Bjoern Kiesbye
--  Author Bjoern Kiesbye
--  email: Kiesbye@theservice.de Bjoern_kiesbye@web.de 
--  This is free software distributed under the terms of the GNU Public
--  License version 2 or higher.  Full text of the license is available
--  from the GNU Project: http://www.fsf.org/copyleft/gpl.html

--  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
--  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
--  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
--  details.
--

--
-- /jabber-portlet/sql/postgresql/calendar-full-portlet-create.sql
--

-- Creates Jabber portlet

-- Copyright (C) 2004 Bjoern Kiesbye
-- @author Bjoern Kiesbye (kiesbye@theservice.de bjoern_kiesbye@web.de)
-- @creation-date 2004-07-18
-- ported to postres 2004-07-18


create function jabber_inline_0()
returns integer as '
begin

    perform acs_sc_impl__new (
        ''dotlrn_applet'',
        ''dotlrn_jabber'',
        ''dotlrn_jabber''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_jabber'',
        ''GetPrettyName'',
        ''dotlrn_jabber::get_pretty_name'',
        ''TCL''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_jabber'',
        ''AddApplet'',
        ''dotlrn_jabber::add_applet'',
        ''TCL''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_jabber'',
        ''RemoveApplet'',
        ''dotlrn_jabber::remove_applet'',
        ''TCL''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_jabber'',
        ''AddAppletToCommunity'',
        ''dotlrn_jabber::add_applet_to_community'',
        ''TCL''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_jabber'',
        ''RemoveAppletFromCommunity'',
        ''dotlrn_jabber::remove_applet_from_community'',
        ''TCL''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_jabber'',
        ''AddUser'',
        ''dotlrn_jabber::add_user'',
        ''TCL''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_jabber'',
        ''RemoveUser'',
        ''dotlrn_jabber::remove_user'',
        ''TCL''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_jabber'',
        ''AddUserToCommunity'',
        ''dotlrn_jabber::add_user_to_community'',
        ''TCL''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_jabber'',
        ''RemoveUserFromCommunity'',
        ''dotlrn_jabber::remove_user_from_community'',
        ''TCL''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_jabber'',
        ''AddPortlet'',
        ''dotlrn_jabber::add_portlet'',
        ''TCL''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_jabber'',
        ''RemovePortlet'',
        ''dotlrn_jabber::remove_portlet'',
        ''TCL''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_jabber'',
        ''Clone'',
        ''dotlrn_jabber::clone'',
        ''TCL''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_jabber'',
        ''ChangeEventHandler'',
        ''dotlrn_jabber::change_event_handler'',
        ''TCL''
    );

    perform acs_sc_binding__new (
        ''dotlrn_applet'',
        ''dotlrn_jabber''
    );

    return 0;

end;' language 'plpgsql';

select jabber_inline_0();
drop function jabber_inline_0();


