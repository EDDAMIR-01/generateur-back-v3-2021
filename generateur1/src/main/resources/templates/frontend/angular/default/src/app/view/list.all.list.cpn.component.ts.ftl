import { Component, OnInit } from '@angular/core';
import {${pojo.name}Vo} from '../../../controller/model/${pojo.name?uncap_first}.model';
import {${pojo.name}Service} from '../../../controller/service/${pojo.name}.service';
<#list pojo.types as type>
  <#if pojo.name != type.simpleName>
import {${type.simpleName}Vo} from '../../../controller/model/${type.simpleName}.model';
    </#if>
</#list>

@Component({
  selector: 'app-${pojo.name?uncap_first}-list',
  templateUrl: './${pojo.name?uncap_first}-list.component.html',
  styleUrls: ['./${pojo.name?uncap_first}-list.component.css']
})
export class ${pojo.name}listComponent implements OnInit {

  constructor(private _${pojo.name?uncap_first}Service : ${pojo.name}Service) {}

  <#list pojo.fieldsGeneric as fieldGeneric>
  <#if fieldGeneric.comboBox>
  get ${fieldGeneric.name}s(): Array<${fieldGeneric.pojo.name}Vo> {
   return this.${pojo.name?uncap_first}Service.${fieldGeneric.name}s;
  }
  </#if>
  </#list>

  ngOnInit(): void {
    this.findAll();
      <#list pojo.fieldsGeneric as fieldGeneric>
        <#if fieldGeneric.comboBox>
      this.findAll${fieldGeneric.name}s();
      </#if>
      </#list>
  }

  get ${pojo.name?uncap_first}Service (): ${pojo.name}Service {
    return this._${pojo.name?uncap_first}Service;
  }

  set ${pojo.name?uncap_first}Service (value: ${pojo.name}Service) {
    this._${pojo.name?uncap_first}Service = value ;
  }

  get ${pojo.name?uncap_first}Liste (): Array<${pojo.name}Vo> {
    return this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}Liste;
  }

  set ${pojo.name?uncap_first}Liste (value: Array<${pojo.name}Vo>) {
    this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}Liste = value ;
  }

  get ${pojo.name?uncap_first}Detail (): ${pojo.name}Vo {
    return this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}Detail;
}

  set ${pojo.name?uncap_first}Detail (value: ${pojo.name}Vo) {
  this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}Detail = value ;
}

get ${pojo.name?uncap_first}Search (): ${pojo.name}Vo {
  return this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}Search;
}

set ${pojo.name?uncap_first}Search (value: ${pojo.name}Vo) {
  this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}Search = value ;
}


get ${pojo.name?uncap_first}ShowDetail (): boolean  {
  return this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}ShowDetail;
}

set ${pojo.name?uncap_first}ShowDetail (value: boolean ) {
  this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}ShowDetail = value ;
}

<#if (pojo.compactView)>
get ${pojo.name?uncap_first}ShowCreate (): boolean  {
  return this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}ShowCreate;
}

set ${pojo.name?uncap_first}ShowCreate (value: boolean ) {
  this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}ShowCreate = value ;
}
get ${pojo.name?uncap_first}ShowEdit (): boolean  {
  return this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}ShowEdit;
}

set ${pojo.name?uncap_first}ShowEdit (value: boolean ) {
  this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}ShowEdit = value ;
}

  editShow( pojo : ${pojo.name}Vo ) {
  this.${pojo.name?uncap_first}Service.editShow(pojo);

}
  createShow()  {
  this.${pojo.name?uncap_first}Service.createShow();

}
</#if>

   delete( pojo : ${pojo.name}Vo ) {
    this.${pojo.name?uncap_first}Service.delete(pojo);
  }


 detailShow( pojo : ${pojo.name}Vo ) {
  this.${pojo.name?uncap_first}Service.detailShow( pojo);

}

 find${pojo.name}(pojo : ${pojo.name}Vo ) {
  this.${pojo.name?uncap_first}Service.find${pojo.name}( pojo);

}
 findAll() {
  this.${pojo.name?uncap_first}Service.findAll();
}

  <#list pojo.fieldsGeneric as fieldGeneric>
  <#if fieldGeneric.comboBox>
   findAll${fieldGeneric.name}s() {
     this.${pojo.name?uncap_first}Service.findAll${fieldGeneric.name}s();
   }
  </#if>
  </#list>

}
