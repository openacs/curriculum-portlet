-- packages/curriculum-portlet/sql/curriculum-admin-portlet-create.sql
--
-- @author Ola Hansson (ola@polyxena.net)
-- @creation-date 2003-06-11
-- @cvs-id $Id$
--

declare
  ds_id portal_datasources.datasource_id%TYPE;
begin
  ds_id := portal_datasource.new(
    name             => 'curriculum_admin_portlet',
    description      => 'Displays the curriculum_admin'
  );

  -- 4 defaults procs

  -- shadeable_p 
  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 't',
	key => 'shadeable_p',
	value => 'f'
);	

  -- shaded_p 
  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 't',
	key => 'shaded_p',
	value => 'f'
);	

  -- hideable_p 
  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 't',
	key => 'hideable_p',
	value => 't'
);	

  -- user_editable_p 
  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 't',
	key => 'user_editable_p',
	value => 'f'
);	

  -- link_hideable_p 
  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 't',
	key => 'link_hideable_p',
	value => 't'
);	


  -- curriculum_admin-specific procs

  -- package_id must be configured
  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 'f',
	key => 'package_id',
	value => ''
);	


end;
/
show errors


declare
	foo integer;
begin
	-- create the implementation
	foo := acs_sc_impl.new (
            impl_contract_name => 'portal_datasource',
            impl_name => 'curriculum_admin_portlet',
            impl_pretty_name => 'Curriculum Admin Portlet',
            impl_owner_name => 'curriculum_admin_portlet'
	);

	-- add all the hooks
	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'curriculum_admin_portlet',
	       'GetMyName',
	       'curriculum_admin_portlet::get_my_name',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'curriculum_admin_portlet',
	       'GetPrettyName',
	       'curriculum_admin_portlet::get_pretty_name',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'curriculum_admin_portlet',
	       'Link',
	       'curriculum_admin_portlet::link',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'curriculum_admin_portlet',
	       'AddSelfToPage',
	       'curriculum_admin_portlet::add_self_to_page',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'curriculum_admin_portlet',
	       'Show',
	       'curriculum_admin_portlet::show',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'curriculum_admin_portlet',
	       'Edit',
	       'curriculum_admin_portlet::edit',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'curriculum_admin_portlet',
	       'RemoveSelfFromPage',
	       'curriculum_admin_portlet::remove_self_from_page',
	       'TCL'
	);

	-- Add the binding
	acs_sc_binding.new (
	    contract_name => 'portal_datasource',
	    impl_name => 'curriculum_admin_portlet'
	);
end;
/
show errors
