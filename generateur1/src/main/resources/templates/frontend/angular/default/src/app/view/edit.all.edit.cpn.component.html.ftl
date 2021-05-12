<#if (pojo.compactView)>
<div class="modal" tabindex="-1" role="dialog" style="display: block;background-color: #000000bf;">
  <div class="modal-dialog modal-dialog-scrollable modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">edit ${pojo.name} </h5>
        <button type="button" class="close" aria-label="Close" (click)="editHide()">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	  	<#else>
     <app-${pojo.name?uncap_first}></app-${pojo.name?uncap_first}>
</#if>
<div class="card <#if (pojo.compactView)>col-md-12<#else>col-md-8</#if> mx-auto  p-md-2">
   <#if !(pojo.compactView)> <div class="card-header text-center font-weight-bold">Edit ${pojo.name}s</div> </#if>
    <div class="card-body">
        <#if !config.frontend.searchInEdit || !(pojo.compactView)>
            <div class="row my-1 ">
                <label>Available ${pojo.name}s</label>
                    <#if pojo.reference??>
                <select class="form-control" [(ngModel)]="${pojo.name?uncap_first}.${pojo.reference.name}" (click)="findBy${pojo.reference.name}(${pojo.name?uncap_first}.${pojo.reference.name})" >
                    <option *ngFor="let p of editable${pojo.name}s" [ngValue]="p.${pojo.reference.name}" value="{{p.${pojo.reference.name}}}">{{p.${pojo.reference.name}}}</option>
                </select>
                    <#else>
                    <select class="form-control" [(ngModel)]="${pojo.name?uncap_first}.${pojo.id.name}" (click)="findBy${pojo.id.name}(${pojo.name?uncap_first}.${pojo.id.name})" >
                        <option *ngFor="let p of editable${pojo.name}s" [ngValue]="p.${pojo.id.name}" value="{{p.${pojo.id.name}}}">{{p.${pojo.id.name}}}</option>
                    </select>
                    </#if>
            </div>
            <#elseif !(pojo.compactView)>
        <div class="row my-1">
            <#if pojo.reference??>
                <label class="col-md-12">Enter ${pojo.name?uncap_first} ${pojo.reference.name}</label>
                <input type="text" class="form-control col-md-8" [(ngModel)]="${pojo.name?uncap_first}.${pojo.reference.name}"><button class="col-md-4 btn btn-info btn-sm fa fa-search" (click)="findBy${pojo.reference.name}(${pojo.name?uncap_first}.${pojo.reference.name})"></button>
                <#else>
                    <label class="col-md-12">Enter ${pojo.name?uncap_first} ${pojo.id.name}</label>
                    <input type="text" class="form-control col-md-8" [(ngModel)]="${pojo.name?uncap_first}.${pojo.id.name}"><button class="col-md-4 btn btn-info btn-sm fa fa-search" (click)="findBy${pojo.id.name}(${pojo.name?uncap_first}.${pojo.id.name})"></button>
            </#if>
            </div>
        </#if>
        <#if (pojo.compactView)><div class="row"></#if>
        <#list pojo.fieldsSimple as fieldSimple>
            <#if fieldSimple.type.simpleName == "date" || fieldSimple.type.simpleName == "Date">
                <div class="<#if !(pojo.compactView)>row<#elseif pojo.fieldsSimple?size-1 == 1>col-md-12<#else>col-md-6</#if> py-2">
                        <label>${fieldSimple.name}</label>
                        <input type="date" class="col-md-12" [(ngModel)] = "${pojo.name?uncap_first}.${fieldSimple.name}">
                </div>
            </#if>
            <#if fieldSimple.type.simpleName == "boolean">
                <div class="<#if !(pojo.compactView)>row<#elseif pojo.fieldsSimple?size-1 == 1>col-md-12<#else>col-md-6</#if> py-2">
                    <label>${fieldSimple.name}</label>
                    <select class="form-control" [(ngModel)] = "${pojo.name?uncap_first}.${fieldSimple.name}">
                        <option value="true">true</option>
                        <option value="false">false</option>
                    </select>
                </div>
            </#if>
                <#if fieldSimple.name != pojo.id.name>
                    <#if fieldSimple.type.simpleName != "boolean">
                        <#if fieldSimple.type.simpleName != "Date">
                <div class="<#if !(pojo.compactView)>row<#elseif pojo.fieldsSimple?size-1 == 1>col-md-12<#else>col-md-6</#if> py-2">
                    <label>${fieldSimple.name}</label>
                    <input type="text" class="form-control" [placeholder]="${pojo.name?uncap_first}.${fieldSimple.name}" [(ngModel)] = "${pojo.name?uncap_first}.${fieldSimple.name}">
                </div>
                </#if>
                </#if>
                </#if>
        </#list>
            <#if (pojo.compactView)></div></#if>
        <#list pojo.fieldsGeneric as fieldGeneric>
            <#if fieldGeneric.comboBox>
                <div class="row m-md-2 p-md-1" >
                    <label>${fieldGeneric.name}</label>
                        <#if fieldGeneric.pojo.reference??>
                    <select class="form-control" [(ngModel)]="${pojo.name?uncap_first}.${fieldGeneric.name}Vo.${fieldGeneric.pojo.reference.name}" >
                        <option *ngFor="let p of ${fieldGeneric.name}s" [ngValue]="p.${fieldGeneric.pojo.reference.name}" value="{{p.${fieldGeneric.pojo.reference.name}}}">{{p.${fieldGeneric.pojo.reference.name}}}</option>
                    </select>
                        <#else>
                        <select class="form-control" [(ngModel)]="${pojo.name?uncap_first}.${fieldGeneric.name}Vo.${fieldGeneric.pojo.id.name}" >
                            <option *ngFor="let p of ${fieldGeneric.name}s" [ngValue]="p.${fieldGeneric.pojo.id.name}" value="{{p.${fieldGeneric.pojo.id.name}}}">{{p.${fieldGeneric.pojo.id.name}}}</option>
                        </select>
                        </#if>
                </div>
            </#if>
            <#if !fieldGeneric.comboBox>
                    <div class="card-header row py-2">${fieldGeneric.pojo.name}</div>
                    <div class="card body row py-2">
                        <div class="row">
                            <#list fieldGeneric.pojo.fieldsSimple as fieldSimple>
                                <#if fieldSimple.type.simpleName == "date" || fieldSimple.type.simpleName == "Date">
                                    <div class="<#if fieldGeneric.pojo.fieldsSimple?size-1 == 1>col-md-12<#else>col-md-6</#if> py-2">
                                            <label>${fieldSimple.name}</label>
                                            <input type="date" class="col-md-12" [(ngModel)] = "${pojo.name?uncap_first}.${fieldGeneric.name?uncap_first}Vo.${fieldSimple.name}">
                                    </div>
                                </#if>
                                <#if fieldSimple.type.simpleName == "boolean">
                                    <div class="<#if fieldGeneric.pojo.fieldsSimple?size-1 == 1>col-md-12<#else>col-md-6</#if> py-2">
                                        <label>${fieldSimple.name}</label>
                                        <select class="form-control" [(ngModel)] = "${pojo.name?uncap_first}.${fieldGeneric.name?uncap_first}Vo.${fieldSimple.name}">
                                            <option value="true">true</option>
                                            <option value="false">false</option>
                                        </select>
                                    </div>
                                </#if>
                                <#if fieldSimple.name != fieldGeneric.pojo.id.name>
                                    <#if fieldSimple.type.simpleName != "boolean">
                                        <#if fieldSimple.type.simpleName != "Date">
                                    <div class="col-md-6"><label>${fieldSimple.name}</label>
                                        <input type="text" class="form-control" [(ngModel)] = "${pojo.name?uncap_first}.${fieldGeneric.name?uncap_first}Vo.${fieldSimple.name}">
                                    </div>
                                    </#if>
                                    </#if>
                                </#if>
                            </#list>
                            <#if !fieldGeneric.pojo.reference??>
                                <div class="<#if fieldGeneric.pojo.fieldsSimple?size-1 == 1>col-md-12<#else>col-md-6</#if> py-2"><label>${fieldGeneric.pojo.id.name}</label>
                                    <input type="text" class="form-control" [(ngModel)] = "${pojo.name?uncap_first}.${fieldGeneric.name?uncap_first}Vo.${fieldGeneric.pojo.id.name}">
                                </div>
                            </#if>
                            <#list fieldGeneric.pojo.fieldsGeneric as SubFieldGeneric>
                                <#if SubFieldGeneric.pojo.reference??>
                                    <div class="col-md-6 py-2"><label>${SubFieldGeneric.name}</label>
                                        <input type="text" class="form-control" [(ngModel)] = "${pojo.name?uncap_first}.${fieldGeneric.name?uncap_first}Vo.${SubFieldGeneric.name?uncap_first}Vo.${SubFieldGeneric.pojo.reference.name}">
                                    </div>
                                <#else>
                                    <div class="col-md-6 py-2"><label>${SubFieldGeneric.name}</label>
                                        <input type="text" class="form-control" [(ngModel)] = "${pojo.name?uncap_first}.${fieldGeneric.name?uncap_first}Vo.${SubFieldGeneric.name?uncap_first}Vo.${SubFieldGeneric.pojo.id.name}">
                                    </div>
                                </#if>
                            </#list>
                        </div>
                    </div>
            </#if>
        </#list>
        <#if pojo.hasList>
            <#list pojo.fieldsList as fieldList>
                <div class="card row">
                    <div class="card-header">Add ${fieldList.name}</div>
                    <div class="card-body">
                        <div class="row">
                            <#list fieldList.pojo.fieldsSimple as fieldSimple>
                                <#if fieldSimple.type.simpleName == "date" || fieldSimple.type.simpleName == "Date">
                                    <div class="<#if fieldList.pojo.fieldsSimple?size-1 == 1>col-md-12<#else>col-md-6</#if> py-2">
                                            <label>${fieldSimple.name}</label>
                                            <input class="col-md-12" [(ngModel)] = "${fieldList.pojo.name?uncap_first}.${fieldSimple.name}">
                                    </div>
                                </#if>
                                <#if fieldSimple.type.simpleName == "boolean">
                                    <div class="<#if fieldList.pojo.fieldsSimple?size-1 == 1>col-md-12<#else>col-md-6</#if> py-2">
                                        <label>${fieldSimple.name}</label>
                                        <select class="form-control" [(ngModel)] = "${fieldList.pojo.name?uncap_first}.${fieldSimple.name}">
                                            <option value="true">true</option>
                                            <option value="false">false</option>
                                        </select>
                                    </div>
                                </#if>
                                <#if fieldSimple.name != fieldList.pojo.id.name>
                                    <#if fieldSimple.type.simpleName != "boolean">
                                        <#if fieldSimple.type.simpleName != "Date">
                                <div class="<#if fieldList.pojo.fieldsSimple?size-1 == 1>col-md-12<#else>col-md-6</#if> py-2"><label>${fieldSimple.name}</label>
                                    <input type="text" class="form-control" [(ngModel)] = "${fieldList.pojo.name?uncap_first}.${fieldSimple.name}" >
                                </div>
                                </#if>
                                </#if>
                                </#if>
                            </#list>
                            <#if !fieldList.pojo.reference??>
                                <div class="<#if fieldList.pojo.fieldsSimple?size-1 == 1>col-md-12<#else>col-md-6</#if> py-2"><label>${fieldList.pojo.id.name}</label>
                                    <input type="text" class="form-control" [(ngModel)] = "${fieldList.pojo.name?uncap_first}.${fieldList.pojo.id.name}" >
                                </div>
                            </#if>
                            <#list fieldList.pojo.fieldsGeneric as SubFieldGeneric>
                                <#if SubFieldGeneric.pojo.reference??>
                                    <div class="col-md-6 py-2"><label>${SubFieldGeneric.name} ${SubFieldGeneric.pojo.reference.name}</label>
                                        <input type="text" class="form-control" [(ngModel)] = "${fieldList.pojo.name?uncap_first}.${SubFieldGeneric.name}Vo.${SubFieldGeneric.pojo.reference.name}">
                                    </div>
                                <#else>
                                    <div class="col-md-6 py-2"><label>${SubFieldGeneric.name} ${SubFieldGeneric.pojo.id.name}</label>
                                        <input type="text" class="form-control" [(ngModel)] = "${fieldList.pojo.name?uncap_first}.${SubFieldGeneric.name}Vo.${SubFieldGeneric.pojo.id.name}">
                                    </div>
                                </#if>
                            </#list>
                        </div>
                        <div class="card-footer">
                            <button class="btn btn-outline-danger btn-block" (click)="add${fieldList.pojo.name}()">+</button>
                        </div>
                    </div>
                </div>
                <div class="card row m-md-2 p-md-1 table-responsive">
                    <div class="card-header">Added ${fieldList.pojo.name?uncap_first}s</div>
                    <div class="card-body">
                        <table class="table table-hover table-striped">
                            <thead>
                            <#list fieldList.pojo.fieldsSimple as fieldSimple>
                                <#if fieldSimple.name != fieldList.pojo.id.name>
                                    <th>${fieldSimple.name}</th>
                                </#if>
                            </#list>
                            <#if !fieldList.pojo.reference??>
                                <th>${fieldList.pojo.id.name}</th>
                            </#if>
                            <#list fieldList.pojo.fieldsGeneric as fieldGeneric>
                                <#if fieldGeneric.pojo.reference??>
                                    <th>${fieldGeneric.name} ${fieldGeneric.pojo.reference.name}</th>
                                <#else>
                                    <th>${fieldGeneric.name} ${fieldGeneric.pojo.id.name}</th>
                                </#if>
                            </#list>
                                <th>Delete</th>
                            </thead>
                            <tbody>
                            <tr *ngFor="let p of ${pojo.name?uncap_first}.${fieldList.name}Vo;let i = index">
                                <#list fieldList.pojo.fieldsSimple as fieldSimple>
                                    <#if fieldSimple.name != fieldList.pojo.id.name>
                                    <td>{{p.${fieldSimple.name}}}</td>
                                    </#if>
                                </#list>
                                <#if !fieldList.pojo.reference??>
                                    <td>{{p.${fieldList.pojo.id.name}}}</td>
                                </#if>
                                <#list fieldList.pojo.fieldsGeneric as fieldGeneric>
                                    <#if fieldGeneric.pojo.reference??>
                                        <td>{{p.${fieldGeneric.name}Vo.${fieldGeneric.pojo.reference.name}}}</td>
                                    <#else>
                                        <td>{{p.${fieldGeneric.name}Vo.${fieldGeneric.pojo.id.name}}}</td>
                                    </#if>
                                </#list>
                                    <td><button class="btn btn-dark fa fa-trash" (click)="remove${fieldList.pojo.name}(i)"></button></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </#list>
        </#if>
        <div class="card-footer" >
            <button class="form-control" (click)="edit${pojo.name}()" >Edit</button>
        </div>
    </div>
</div>
<#if (pojo.compactView)>
       </div>
	   </div>
	   </div>
	   </div>
</#if>