-- packages/curriculum-portlet/sql/oracle/curriculum-portlet-drop.sql
--
-- @author Ola Hansson (ola@polyxena.net)
-- @creation-date 2003-06-13
-- @cvs-id $Id$
--

declare  
  ds_id portal_datasources.datasource_id%TYPE;
begin

  begin 
    select datasource_id into ds_id
      from portal_datasources
     where name = 'curriculum-portlet';
   exception when no_data_found then
     ds_id := null;
  end;

  if ds_id is not null then
    portal_datasource.delete(ds_id);
  end if;

end;
/
show errors;



declare
	foo integer;
begin

	-- add all the hooks
	foo := acs_sc_impl.delete_alias (
	       'portal_datasource',
	       'curriculum_portlet',
	       'GetMyName'
	);

	foo := acs_sc_impl.delete_alias (
	       'portal_datasource',
	       'curriculum_portlet',
	       'GetPrettyName'
	);


	foo := acs_sc_impl.delete_alias (
	       'portal_datasource',
	       'curriculum_portlet',
	       'Link'
	);

	foo := acs_sc_impl.delete_alias (
	       'portal_datasource',
	       'curriculum_portlet',
	       'AddSelfToPage'
	);

	foo := acs_sc_impl.delete_alias (
	       'portal_datasource',
	       'curriculum_portlet',
	       'Show'
	);

	foo := acs_sc_impl.delete_alias (
	       'portal_datasource',
	       'curriculum_portlet',
	       'Edit'
	);

	foo := acs_sc_impl.delete_alias (
	       'portal_datasource',
	       'curriculum_portlet',
	       'RemoveSelfFromPage'
	);

	-- Drop the binding
	acs_sc_binding.delete (
	    contract_name => 'portal_datasource',
	    impl_name => 'curriculum_portlet'
	);

	-- drop the impl
	foo := acs_sc_impl.delete (
		'portal_datasource',
		'curriculum_portlet'
	);
end;
/
show errors
