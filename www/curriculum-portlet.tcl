ad_page_contract {

    The logic for the curriculum portlet.

    @author Ola Hansson (ola@polyxena.net)
    @creation-date 2003-06-11
    @cvs-id $Id$

} -query {
}

array set config $cf

set shaded_p $config(shaded_p)
set list_of_package_ids $config(package_id)
set one_instance_p [ad_decode [llength $list_of_package_ids] 1 1 0]

ad_return_template 
