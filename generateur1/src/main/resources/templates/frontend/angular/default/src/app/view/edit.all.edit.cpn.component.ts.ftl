import {Component, OnInit} from '@angular/core';
import {${pojo.name}Service} from '../../../controller/service/${pojo.name}.service';
import {${pojo.name}Vo} from '../../../controller/model/${pojo.name?uncap_first}.model';
<#list pojo.types as type>
  <#if pojo.name != type.simpleName>
import {${type.simpleName}Vo} from '../../../controller/model/${type.simpleName}.model';
    </#if>
</#list>

@Component({
  selector: 'app-${pojo.name?uncap_first}-edit',
  templateUrl: './${pojo.name?uncap_first}-edit.component.html',
  styleUrls: ['./${pojo.name?uncap_first}-edit.component.css']
})
export class ${pojo.name}EditComponent implements OnInit {
  constructor(private ${pojo.name?uncap_first}Service: ${pojo.name?cap_first}Service) { }

   ngOnInit(): void {
   <#if !config.frontend.searchInEdit>
       this.findAll();
   <#else>
       <#list pojo.fieldsGeneric as fieldGeneric>
       <#if fieldGeneric.comboBox>
       this.findAll${fieldGeneric.name}s();
       </#if>
       </#list>
   </#if>
    }

   get ${pojo.name?uncap_first}(): ${pojo.name}Vo {
    return this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first};
  }

   get editable${pojo.name}s(): Array<${pojo.name}Vo> {
    return this.${pojo.name?uncap_first}Service.editable${pojo.name}s;
   }

   set editable${pojo.name}s(value: Array<${pojo.name}Vo>) {
    this.${pojo.name?uncap_first}Service.editable${pojo.name}s = value;
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
   edit${pojo.name?cap_first}() {
    this.${pojo.name?uncap_first}Service.edit${pojo.name?cap_first}();
  }
<#if !config.frontend.searchInEdit>
    findAll() {
     this.${pojo.name?uncap_first}Service.findAll();
    }
<#else>
<#list pojo.fieldsGeneric as fieldGeneric>
<#if fieldGeneric.comboBox>
    findAll${fieldGeneric.name}s() {
     this.${pojo.name?uncap_first}Service.findAll${fieldGeneric.name}s();
    }
</#if>
</#list>
</#if>

    <#if pojo.reference??>
     findBy${pojo.reference.name}(ref: string) {
      this.${pojo.name?uncap_first}Service.findBy${pojo.reference.name}(ref);
     }
     <#else>
      findBy${pojo.id.name}(identifier: string) {
       this.${pojo.name?uncap_first}Service.findBy${pojo.id.name}(identifier);
      }
    </#if>

    <#if (pojo.compactView)>
    editHide() {
      this.${pojo.name?uncap_first}Service.editHide();
    }
    
    </#if>

}