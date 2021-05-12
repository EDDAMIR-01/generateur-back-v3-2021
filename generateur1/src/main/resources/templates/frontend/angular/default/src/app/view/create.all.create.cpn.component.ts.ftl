import {Component, OnInit} from '@angular/core';
import {${pojo.name}Service} from '../../../controller/service/${pojo.name}.service';
import {${pojo.name}Vo} from '../../../controller/model/${pojo.name?uncap_first}.model';
<#list pojo.types as type>
  <#if pojo.name != type.simpleName>
import {${type.simpleName}Vo} from '../../../controller/model/${type.simpleName}.model';
    </#if>
</#list>

@Component({
  selector: 'app-${pojo.name?uncap_first}-create',
  templateUrl: './${pojo.name?uncap_first}-create.component.html',
  styleUrls: ['./${pojo.name?uncap_first}-create.component.css']
})
export class ${pojo.name}CreateComponent implements OnInit {
  constructor(private ${pojo.name?uncap_first}Service: ${pojo.name?cap_first}Service) { }

   ngOnInit(): void {
      <#list pojo.fieldsGeneric as fieldGeneric>
      <#if fieldGeneric.comboBox>
      this.findAll${fieldGeneric.name}s();
      </#if>
      </#list>
    }

   get ${pojo.name?uncap_first}(): ${pojo.name}Vo {
    return this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first};
  }

  <#list pojo.fieldsGeneric as fieldGeneric>
  <#if fieldGeneric.comboBox>
  get ${fieldGeneric.name}s(): Array<${fieldGeneric.pojo.name}Vo> {
   return this.${pojo.name?uncap_first}Service.${fieldGeneric.name}s;
  }
  </#if>
  </#list>

  <#if pojo.hasList>
  <#list pojo.fieldsList as fieldList>
  get ${fieldList.pojo.name?uncap_first}(): ${fieldList.pojo.name}Vo {
    return this.${pojo.name?uncap_first}Service.${fieldList.pojo.name?uncap_first};
  }

  add${fieldList.pojo.name}() {
   return this.${pojo.name?uncap_first}Service.add${fieldList.pojo.name}();
  }

  remove${fieldList.pojo.name}(i: number) {
   this.${pojo.name?uncap_first}Service.remove${fieldList.pojo.name}(i);
  }
  </#list>
  </#if>
   save${pojo.name?cap_first}() {
    this.${pojo.name?uncap_first}Service.save${pojo.name?cap_first}();
  }

  <#list pojo.fieldsGeneric as fieldGeneric>
  <#if fieldGeneric.comboBox>
   findAll${fieldGeneric.name}s() {
     this.${pojo.name?uncap_first}Service.findAll${fieldGeneric.name}s();
   }
  </#if>
  </#list>

<#if (pojo.compactView)>
get ${pojo.name?uncap_first}ShowCreate (): boolean  {
  return this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}ShowCreate;
}

set ${pojo.name?uncap_first}ShowCreate (value: boolean ) {
  this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}ShowCreate = value ;
}
public createHide(){
       this.${pojo.name?uncap_first}Service.createHide();
}
</#if>
}