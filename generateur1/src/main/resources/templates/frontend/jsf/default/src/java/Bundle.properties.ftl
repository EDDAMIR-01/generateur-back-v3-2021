PersistenceErrorOccured=A persistence error occurred.
Create=Create
View=View
Edit=Edit
Delete=Delete
Close=Close
Cancel=Cancel
Save=Save
SelectOneMessage=Select One...
Home=Home
Maintenance=Maintenance
AppName=GeneratedJsf

<#list pojos as pojo>
${pojo.name}Created=${pojo.name} was successfully created.
${pojo.name}Updated=${pojo.name} was successfully updated.
${pojo.name}Deleted=${pojo.name} was successfully deleted.
Create${pojo.name}Title=Create New ${pojo.name}
Create${pojo.name}SaveLink=Save
Create${pojo.name}ShowAllLink=Show All ${pojo.name} Items
Create${pojo.name}IndexLink=Index
<#list pojo.fieldsSimple as fieldSimple>
Create${pojo.name}Label_${fieldSimple.name}=${fieldSimple.name?cap_first}:
Create${pojo.name}Title_${fieldSimple.name}=${fieldSimple.name?cap_first}
</#list>
<#list pojo.fieldsGeneric as fieldGeneric>
Create${pojo.name}Label_${fieldGeneric.name}=${fieldGeneric.name?cap_first}:
Create${pojo.name}Title_${fieldGeneric.name}=${fieldGeneric.name?cap_first}
</#list>
Edit${pojo.name}Title=Edit ${pojo.name}
Edit${pojo.name}SaveLink=Save
Edit${pojo.name}ViewLink=View
Edit${pojo.name}ShowAllLink=Show All ${pojo.name} Items
Edit${pojo.name}IndexLink=Index
<#list pojo.fieldsSimple as fieldSimple>
Edit${pojo.name}Label_${fieldSimple.name}=${fieldSimple.name?cap_first}:
Edit${pojo.name}Title_${fieldSimple.name}=${fieldSimple.name?cap_first}
</#list>
<#list pojo.fieldsGeneric as fieldGeneric>
Edit${pojo.name}Label_${fieldGeneric.name}=${fieldGeneric.name?cap_first}:
Edit${pojo.name}Title_${fieldGeneric.name}=${fieldGeneric.name?cap_first}
</#list>
View${pojo.name}Title=View
View${pojo.name}DestroyLink=Destroy
View${pojo.name}EditLink=Edit
View${pojo.name}CreateLink=Create New ${pojo.name}
View${pojo.name}ShowAllLink=Show All ${pojo.name} Items
View${pojo.name}IndexLink=Index
<#list pojo.fieldsSimple as fieldSimple>
View${pojo.name}Label_${fieldSimple.name}=${fieldSimple.name?cap_first}:
View${pojo.name}Title_${fieldSimple.name}=${fieldSimple.name?cap_first}
</#list>
<#list pojo.fieldsGeneric as fieldGeneric>
View${pojo.name}Label_${fieldGeneric.name}=${fieldGeneric.name?cap_first}:
View${pojo.name}Title_${fieldGeneric.name}=${fieldGeneric.name?cap_first}
</#list>
List${pojo.name}Title=List
List${pojo.name}Empty=(No ${pojo.name} Items Found)
List${pojo.name}DestroyLink=Destroy
List${pojo.name}EditLink=Edit
List${pojo.name}ViewLink=View
List${pojo.name}CreateLink=Create New ${pojo.name}
List${pojo.name}IndexLink=Index
<#list pojo.fieldsSimple as fieldSimple>
List${pojo.name}Title_${fieldSimple.name}=${fieldSimple.name?cap_first}
</#list>
<#list pojo.fieldsGeneric as fieldGeneric>
List${pojo.name}Title_${fieldGeneric.name}=${fieldGeneric.name?cap_first}
</#list>
</#list>