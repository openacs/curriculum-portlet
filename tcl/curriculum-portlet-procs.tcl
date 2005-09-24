ad_library {

    Procedures to support the Curriculum portlet.

    @author Ola Hansson (ola@polyxena.net)
    @creation-date 2003-06-11
    @cvs-id $Id$

}

namespace eval curriculum_portlet {

    ad_proc -private get_my_name {
    } {
        return "curriculum_portlet"
    }

    ad_proc -private my_package_key {
    } {
        return "curriculum-portlet"
    }

    ad_proc -public get_pretty_name {
    } {
        return "#curriculum.Curriculum_1#"
    }

    ad_proc -public link {
    } {
        return ""
    }

    ad_proc -public add_self_to_page {
        {-portal_id:required}
        {-package_id:required}
        {-param_action:required}
    } {
        Adds a curriculum PE to the given portal or appends the given
        curriculum_package_id to the params of the curriculum pe already there

        @param portal_id The page to add self to
        @param package_id the id of the curriculum package for this community

        @return element_id The new element's id
    } {
        return [portal::add_element_parameters \
            -portal_id $portal_id \
            -portlet_name [get_my_name] \
            -key package_id \
            -value $package_id \
            -pretty_name [get_pretty_name] \
            -force_region [parameter::get_from_package_key \
                               -package_key [my_package_key] \
                               -parameter "curriculum_portlet_force_region"] \
            -param_action $param_action
        ]
    }

    ad_proc -public remove_self_from_page {
        {-portal_id:required}
        {-package_id:required}
    } {
        Removes a curriculum PE from the given page or just the passed
        in curriculum_package_id parameter from the portlet
        (that has other curriculum_package_ids)

        @param portal_id The page to remove self from
        @param package_id
    } {
        portal::remove_element_parameters \
            -portal_id $portal_id \
            -portlet_name [get_my_name] \
            -key package_id \
            -value $package_id
    }

    ad_proc -public show {
        cf
    } {
    } {
        portal::show_proc_helper \
            -package_key [my_package_key] \
            -config_list $cf \
            -template_src "curriculum-portlet"
    }

}
