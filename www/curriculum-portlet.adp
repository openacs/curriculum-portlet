<if @shaded_p@ false>

<if @one_instance_p@ true>
  <include src="/packages/curriculum/lib/user-curriculums" package_id="@list_of_package_ids@" />
</if>
<else>

<list name="list_of_package_ids">
  <include src="/packages/curriculum/lib/user-curriculums" package_id="@list_of_package_ids:item@" template="/packages/curriculum/lib/summary" />
</list>

</else>

</if>
<else>
  #new-portal.when_portlet_shaded#
</else>
