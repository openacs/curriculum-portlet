-- packages/curriculum-portlet/sql/curriculum-portlet-create.sql
--
-- @author Ola Hansson (ola@polyxena.net)
-- @creation-date 2003-06-13
-- @cvs-id $Id$
--

declare
  ds_id portal_datasources.datasource_id%TYPE;
begin
  ds_id := portal_datasource.new(
    name             => 'curriculum_portlet',
    description      => 'Displays the curriculum'
  );

  -- 4 defaults procs

  -- shadeable_p 
  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 't',
	key => 'shadeable_p',
	value => 't'
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


  -- curriculum-specific procs

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
            impl_name => 'curriculum_portlet',
            impl_pretty_name => 'Curriculum Portlet',
            impl_owner_name => 'curriculum_portlet'
	);

end;
/
show errors

declare
	foo integer;
begin

	-- add all the hooks
	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'curriculum_portlet',
	       'GetMyName',
	       'curriculum_portlet::get_my_name',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'curriculum_portlet',
	       'GetPrettyName',
	       'curriculum_portlet::get_pretty_name',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'curriculum_portlet',
	       'Link',
	       'curriculum_portlet::link',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'curriculum_portlet',
	       'AddSelfToPage',
	       'curriculum_portlet::add_self_to_page',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'curriculum_portlet',
	       'Show',
	       'curriculum_portlet::show',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'curriculum_portlet',
	       'Edit',
	       'curriculum_portlet::edit',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'curriculum_portlet',
	       'RemoveSelfFromPage',
	       'curriculum_portlet::remove_self_from_page',
	       'TCL'
	);

end;
/
show errors

declare
	foo integer;
begin

	-- Add the binding
	acs_sc_binding.new (
	    contract_name => 'portal_datasource',
	    impl_name => 'curriculum_portlet'
	);
end;
/
show errors

@curriculum-admin-portlet-create.sql
