ad_page_contract {

    The display logic for the Curriculum admin portlet
    
    @author Ola Hanssson (ola@polyxena.net)
    @creation-date 2003-06-11
    @cvs-id $Id$

} -properties {
    
}

array set config $cf
set list_of_package_ids $config(package_id)

if {[llength $list_of_package_ids] > 1} {
    # We have a problem!
    return -code error "There should be only one instance of curriculum for admin purposes"
}        

set package_id [lindex $list_of_package_ids 0]        

set url [lindex [site_node::get_url_from_object_id -object_id $package_id] 0]

ad_return_template 
