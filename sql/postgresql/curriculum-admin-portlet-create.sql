-- /curriculum-portlet/sql/postgresql/curriculum-admin-portlet-create.sql
--
-- Creates Curriculum portlet
--
-- @author Ola Hansson (ola@polyxena.net)
-- @creation-date 2003-06-11
-- @cvs-id $Id$
--

create function inline_0 ()
returns integer as '
declare
  ds_id 	portal_datasources.datasource_id%TYPE;
begin
	ds_id = portal_datasource__new(
        		''curriculum_admin_portlet'',
        		''Displays a Curriculum''
			);

RAISE NOTICE '' created new ds'';

	perform portal_datasource__set_def_param (
	 	ds_id,
		''t'',
   		''t'',
    		''shadeable_p'',
		''f''
	);

RAISE NOTICE '' set shadeable'';
	perform portal_datasource__set_def_param (
 	  	ds_id,
  		''t'',
	 	''t'',
    	 	''hideable_p'',
    	 	''f''
	);

RAISE NOTICE '' set hideable'';
	perform portal_datasource__set_def_param (
		ds_id,
		''t'',
 		''t'',
		''user_editable_p'',
 		''f''
	);

	perform portal_datasource__set_def_param (
 	       ds_id,
  	      ''t'',
	      ''t'',
	      ''shaded_p'',
	      ''f''
	);

	perform portal_datasource__set_def_param (
	        ds_id,
	        ''t'',
	        ''t'',
	        ''link_hideable_p'',
	        ''t''
	);

	perform portal_datasource__set_def_param (
		ds_id,
	        ''t'',
	        ''f'',
	        ''package_id'',
	        '' ''
	);


return 0;

end;' language 'plpgsql';



select inline_0();

drop function inline_0 ();

-- create the implementation
select acs_sc_impl__new (
        'portal_datasource',
        'curriculum_admin_portlet',
        'curriculum_admin_portlet'
);

-- add all the hooks
select acs_sc_impl_alias__new(
        'portal_datasource',
        'curriculum_admin_portlet',
        'GetMyName',
        'curriculum_admin_portlet::get_my_name',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'curriculum_admin_portlet',
        'GetPrettyName',
        'curriculum_admin_portlet::get_pretty_name',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'curriculum_admin_portlet',
        'Link',
        'curriculum_admin_portlet::link',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'curriculum_admin_portlet',
        'AddSelfToPage',
        'curriculum_admin_portlet::add_self_to_page',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'curriculum_admin_portlet',
        'Show',
        'curriculum_admin_portlet::show',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'curriculum_admin_portlet',
        'Edit',
        'curriculum_admin_portlet::edit',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'curriculum_admin_portlet',
        'RemoveSelfFromPage',
        'curriculum_admin_portlet::remove_self_from_page',
        'TCL'
);

-- Add the binding
select acs_sc_binding__new(
	'portal_datasource',
 	'curriculum_admin_portlet'
);
