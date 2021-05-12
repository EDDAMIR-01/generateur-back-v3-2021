<#list pojo.types as type>
  <#if pojo.name != type.simpleName>
import {${type.simpleName}Vo} from './${type.simpleName}.model';
    </#if>
</#list>

export class ${pojo.name}Vo {
  <#list pojo.fieldsSimple as fieldSimple>
  public ${fieldSimple.name}: string;
  </#list>
  <#list pojo.fieldsSimpleNumberOrDate as fieldSimpleNumberOrDate>
    <#if pojo.id.name != fieldSimpleNumberOrDate.name>
     public ${fieldSimpleNumberOrDate.name}Max: string ;
     public ${fieldSimpleNumberOrDate.name}Min: string ;
    </#if>
</#list>
  <#list pojo.fieldsGeneric as fieldGeneric>
    <#if fieldGeneric.pojo.name == pojo.name>
      private _${fieldGeneric.name}Vo: ${fieldGeneric.pojo.name}Vo;
      <#else>
      public ${fieldGeneric.name}Vo: ${fieldGeneric.pojo.name}Vo = new ${fieldGeneric.pojo.name}Vo();
    </#if>
  </#list>
  <#list pojo.fieldsList as fieldList>
  public ${fieldList.name}Vo: Array<${fieldList.pojo.name}Vo> = new Array<${fieldList.pojo.name}Vo>();
  </#list>

<#list pojo.fieldsGeneric as fieldGeneric>
  <#if fieldGeneric.pojo.name == pojo.name>
    get ${fieldGeneric.name}Vo(): ${fieldGeneric.pojo.name}Vo {
        if (this._${fieldGeneric.name}Vo == null) {
            this._${fieldGeneric.name}Vo = new ${fieldGeneric.pojo.name}Vo();
        }
        return this._${fieldGeneric.name}Vo;
    }

    set ${fieldGeneric.name}Vo(value: ${fieldGeneric.pojo.name}Vo) {
        this._${fieldGeneric.name}Vo = value;
    }
  </#if>
</#list>

}