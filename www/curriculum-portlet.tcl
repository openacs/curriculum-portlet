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

if {[llength $list_of_package_ids] > 1} {
    # We have a problem!
    return -code error "There should be only one instance of curriculum for admin purposes"
}        

ad_return_template 
