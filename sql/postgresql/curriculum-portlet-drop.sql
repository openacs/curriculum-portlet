-- /curriculum-portlet/sql/postgresql/curriculum-portlet-drop.sql
--
-- Drops curriculum portlet
--
-- @author Ola Hansson (ola@polyxena.net)
-- @creation-date 2003-06-11
-- @cvs-id $Id$
--

create function inline_0 ()
returns integer as '
declare  
  ds_id portal_datasources.datasource_id%TYPE;
begin

  select datasource_id into ds_id
    from portal_datasources
    where name = ''curriculum_portlet'';

--  Exception handling?


    if not found then
        raise notice ''No datasource_id found here '', ds_id ;
	ds_id := null;        
    end if;

      
  if ds_id is NOT null then
    perform portal_datasource__delete(ds_id);
  end if;

return 0;

end;' language 'plpgsql';

select inline_0 ();

drop function inline_0 ();


-- drop the hooks
select acs_sc_impl_alias__delete (
	       'portal_datasource',
	       'curriculum_portlet',
	       'GetMyName'
);

select acs_sc_impl_alias__delete (
	       'portal_datasource',
	       'curriculum_portlet',
	       'GetPrettyName'
	);


select acs_sc_impl_alias__delete (
	       'portal_datasource',
	       'curriculum_portlet',
	       'Link'
);

select acs_sc_impl_alias__delete (
	       'portal_datasource',
	       'curriculum_portlet',
	       'AddSelfToPage'
);

select acs_sc_impl_alias__delete (
	       'portal_datasource',
	       'curriculum_portlet',
	       'Show'
);

select acs_sc_impl_alias__delete (
	       'portal_datasource',
	       'curriculum_portlet',
	       'Edit'
);

select acs_sc_impl_alias__delete (
	       'portal_datasource',
	       'curriculum_portlet',
	       'RemoveSelfFromPage'
);

-- Drop the binding
select acs_sc_binding__delete (
	'portal_datasource',
	'curriculum_portlet'
);

-- drop the impl
select acs_sc_impl__delete (
		'portal_datasource',
		'curriculum_portlet'
);

\i curriculum-admin-portlet-drop.sql
