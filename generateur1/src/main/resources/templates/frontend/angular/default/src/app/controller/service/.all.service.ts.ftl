import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {${pojo.name}Vo} from '../model/${pojo.name?uncap_first}.model';
<#list pojo.types as type>
  <#if pojo.name != type.simpleName>
import {${type.simpleName}Vo} from '../model/${type.simpleName}.model';
    </#if>
</#list>
@Injectable({
  providedIn: 'root'
})
export class ${pojo.name}Service {

  constructor(private http: HttpClient) { }
  private _${pojo.name?uncap_first}Detail : ${pojo.name}Vo =  new ${pojo.name}Vo() ;
  private _${pojo.name?uncap_first}Liste  : Array<${pojo.name}Vo> = new Array<${pojo.name}Vo>();
  
  private _${pojo.name?uncap_first}Search : ${pojo.name}Vo = new ${pojo.name}Vo();
  private _${pojo.name?uncap_first}: ${pojo.name}Vo =  new ${pojo.name}Vo();
  private _searched${pojo.name}s: Array<${pojo.name}Vo> = new Array<${pojo.name}Vo>();
  private _editable${pojo.name}s: Array<${pojo.name}Vo> = new Array<${pojo.name}Vo>();
  <#list pojo.fieldsGeneric as fieldGeneric>
  <#if fieldGeneric.comboBox>
  private _${fieldGeneric.name}s: Array<${fieldGeneric.pojo.name}Vo> = new Array<${fieldGeneric.pojo.name}Vo>();
  </#if>
  </#list>
  <#if pojo.hasList>
  <#list pojo.fieldsList as fieldList>
  private _${fieldList.pojo.name?uncap_first}: ${fieldList.pojo.name}Vo;

  get ${fieldList.pojo.name?uncap_first}(): ${fieldList.pojo.name}Vo {
    if (this._${fieldList.pojo.name?uncap_first} == null) {
      this._${fieldList.pojo.name?uncap_first} = new ${fieldList.pojo.name}Vo();
    }
    return this._${fieldList.pojo.name?uncap_first};
  }

  set ${fieldList.pojo.name?uncap_first}(value: ${fieldList.pojo.name}Vo) {
    this._${fieldList.pojo.name?uncap_first} = value;
  }
  </#list>
  </#if>
  <#list pojo.fieldsGeneric as fieldGeneric>
  <#if fieldGeneric.comboBox>
   get ${fieldGeneric.name}s(): Array<${fieldGeneric.pojo.name}Vo> {
    return this._${fieldGeneric.name}s;
   }

   set ${fieldGeneric.name}s(value: Array<${fieldGeneric.pojo.name}Vo>) {
    this._${fieldGeneric.name}s = value;
   }
  </#if>
  </#list>

  get ${pojo.name?uncap_first}(): ${pojo.name}Vo {
    if (this._${pojo.name?uncap_first} == null) {
      this._${pojo.name?uncap_first} = new ${pojo.name}Vo();
    }
    return this._${pojo.name?uncap_first};
  }

  set ${pojo.name?uncap_first}(value: ${pojo.name}Vo) {
    this._${pojo.name?uncap_first} = value;
  }

  get ${pojo.name?uncap_first}Liste (): Array<${pojo.name}Vo> {
  return this._${pojo.name?uncap_first}Liste;
}

set ${pojo.name?uncap_first}Liste (value: Array<${pojo.name}Vo>) {
  this._${pojo.name?uncap_first}Liste = value ;
}

get ${pojo.name?uncap_first}Detail (): ${pojo.name}Vo {
  return this._${pojo.name?uncap_first}Detail;
}

set ${pojo.name?uncap_first}Detail (value: ${pojo.name}Vo) {
  this._${pojo.name?uncap_first}Detail = value ;
}

get ${pojo.name?uncap_first}Search (): ${pojo.name}Vo {
  return this._${pojo.name?uncap_first}Search;
}

set ${pojo.name?uncap_first}Search (value: ${pojo.name}Vo) {
  this._${pojo.name?uncap_first}Search = value ;
}

get ${pojo.name?uncap_first}ShowDetail (): boolean  {
  return this._${pojo.name?uncap_first}ShowDetail;
}

set ${pojo.name?uncap_first}ShowDetail (value: boolean ) {
  this._${pojo.name?uncap_first}ShowDetail = value ;
}

  get editable${pojo.name}s (): Array<${pojo.name}Vo> {
   return this._editable${pojo.name}s;
  }

  set editable${pojo.name}s (value: Array<${pojo.name}Vo>) {
   this._editable${pojo.name}s = value;
  }

  public findAll(){
  this.http.get<Array<${pojo.name}Vo>>('http://localhost:${config.backend.port?c}/${config.projectName}/${pojo.name?uncap_first}/').subscribe(
    value => {
      if (value != null) {
           this.${pojo.name?uncap_first}Liste = value;
           this.editable${pojo.name}s = value;
                                                 
      }
    }
  );
}

  public save${pojo.name}() {
  this.http.post<${pojo.name}Vo>('http://localhost:${config.backend.port?c}/${config.projectName}/${pojo.name?uncap_first}/', this.${pojo.name?uncap_first}).subscribe(data=>{
     <#if (pojo.compactView)>
    this.createHide();
    </#if>
     this.${pojo.name?uncap_first}Liste.push(data);

  });
  <#if pojo.hasList>
  <#list pojo.fieldsList as fieldList>
  this.${pojo.name?uncap_first}.${fieldList.name}Vo.length = 0;
  </#list>
  </#if>
  }

  public edit${pojo.name}() {
  this.http.put<${pojo.name}Vo>('http://localhost:${config.backend.port?c}/${config.projectName}/${pojo.name?uncap_first}/', this.${pojo.name?uncap_first}).subscribe(data=>{
  <#if (pojo.compactView)>
    this.editHide();
    </#if>
  });
  <#if pojo.hasList>
    <#list pojo.fieldsList as fieldList>
      this.${pojo.name?uncap_first}.${fieldList.name}Vo.length = 0;
    </#list>
  </#if>
   
  }

  <#if pojo.hasList>
  <#list pojo.fieldsList as fieldList>
  public add${fieldList.pojo.name}() {
  this.${pojo.name?uncap_first}.${fieldList.pojo.name?uncap_first}sVo.push(this.clone${fieldList.pojo.name}(this.${fieldList.pojo.name?uncap_first}));
  }

  public clone${fieldList.pojo.name}(${fieldList.pojo.name?uncap_first}: ${fieldList.pojo.name}Vo) {
  const my${fieldList.pojo.name}Clone = new ${fieldList.pojo.name}Vo();
  <#list fieldList.pojo.fieldsSimple as fieldSimple>
  my${fieldList.pojo.name}Clone.${fieldSimple.name} = ${fieldList.pojo.name?uncap_first}.${fieldSimple.name};
  </#list>
      <#list fieldList.pojo.fieldsGeneric as fieldGeneric>
          <#if fieldGeneric.pojo.reference??>
  my${fieldList.pojo.name}Clone.${fieldGeneric.name}Vo.${fieldGeneric.pojo.reference.name} = ${fieldList.pojo.name?uncap_first}.${fieldGeneric.name}Vo.${fieldGeneric.pojo.reference.name};7
              <#else>
  my${fieldList.pojo.name}Clone.${fieldGeneric.name}Vo.${fieldGeneric.pojo.id.name} = ${fieldList.pojo.name?uncap_first}.${fieldGeneric.name}Vo.${fieldGeneric.pojo.id.name};
          </#if>
      </#list>
  return my${fieldList.pojo.name}Clone;
  }

  public remove${fieldList.pojo.name}(i: number) {
    this.${pojo.name?uncap_first}.${fieldList.name}Vo.splice(i, 1);
  }
  </#list>
  </#if>
   public find${pojo.name} ( pojo : ${pojo.name}Vo ){
  this.http.post<Array<${pojo.name}Vo>>('http://localhost:${config.backend.port?c}/${config.projectName}/${pojo.name?uncap_first}/search/', pojo).subscribe(
    value =>{
       this.${pojo.name?uncap_first}Liste = value;  
    } );
}

public detailShow ( pojo : ${pojo.name}Vo ){
    this.${pojo.name?uncap_first}Detail = pojo;
    this.${pojo.name?uncap_first}ShowDetail = true;
 
}



delete(pojo: ${pojo.name}Vo) {
   this.http.delete<${pojo.name}Vo>('http://localhost:${config.backend.port?c}/${config.projectName}/${pojo.name?uncap_first}/id/'+pojo.id).subscribe(
        value => {
        var index = this.${pojo.name?uncap_first}Liste.indexOf(pojo);
if (index > -1) {
   this.${pojo.name?uncap_first}Liste.splice(index, 1);
}
}
        );


}


      <#if pojo.reference??>
       public findBy${pojo.reference.name}(ref: string) {
      this.http.get<${pojo.name}Vo>('http://localhost:${config.backend.port?c}/${config.projectName}/${pojo.name?uncap_first}/${pojo.reference.name}/' + ref).subscribe(
        value => {
        if (value != null) { this.${pojo.name?uncap_first} = value; }
        }
        );
        }
        <#else>
        public findBy${pojo.id.name}(identifier: string) {
        this.http.get<${pojo.name}Vo>('http://localhost:${config.backend.port?c}/${config.projectName}/${pojo.name?uncap_first}/${pojo.id.name}/' + identifier).subscribe(
          value => {
          if (value != null) { this.${pojo.name?uncap_first} = value; }
          }
          );
          }
      </#if>

          <#list pojo.fieldsGeneric as fieldGeneric>
          <#if fieldGeneric.comboBox>
            public findAll${fieldGeneric.name}s() {
             this.http.get<Array<${fieldGeneric.pojo.name}Vo>>('http://localhost:${config.backend.port?c}/${config.projectName}/${fieldGeneric.pojo.name?uncap_first}/').subscribe(
            value => {
            if (value != null) { this.${fieldGeneric.name?uncap_first}s = value; }
            }
            );
            }
          </#if>
          </#list>


          /***********************************************************************************************/
        private _${pojo.name?uncap_first}ShowDetail : boolean;
              public detailHide (){

       this.${pojo.name?uncap_first}ShowDetail = false;
       this.${pojo.name?uncap_first}Detail = null;
                                  }
<#if (pojo.compactView)>
 private _${pojo.name?uncap_first}ShowEdit : boolean;

 private _${pojo.name?uncap_first}ShowCreate : boolean;

get ${pojo.name?uncap_first}ShowEdit (): boolean  {
  return this._${pojo.name?uncap_first}ShowEdit;
}

set ${pojo.name?uncap_first}ShowEdit (value: boolean ) {
  this._${pojo.name?uncap_first}ShowEdit = value ;
}
get ${pojo.name?uncap_first}ShowCreate (): boolean  {
  return this._${pojo.name?uncap_first}ShowCreate;
}

set ${pojo.name?uncap_first}ShowCreate (value: boolean ) {
  this._${pojo.name?uncap_first}ShowCreate = value ;
}
             public editShow(pojo : ${pojo.name}Vo ){

       this.${pojo.name?uncap_first}ShowEdit = true;
       this.${pojo.name?uncap_first} = pojo;
                                  }

              public editHide (){

       this.${pojo.name?uncap_first}ShowEdit = false;
       this.${pojo.name?uncap_first} = new ${pojo.name}Vo();
                                  }

               public createShow(){

       this.${pojo.name?uncap_first}ShowCreate = true;
       this.${pojo.name?uncap_first} = new ${pojo.name}Vo();
                                  }

              public createHide (){

       this.${pojo.name?uncap_first}ShowCreate = false;
       this.${pojo.name?uncap_first} = new ${pojo.name}Vo();
                                  }
</#if>
}