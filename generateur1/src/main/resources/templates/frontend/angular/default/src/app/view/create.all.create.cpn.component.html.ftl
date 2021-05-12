<#if (pojo.compactView)>
<div class="modal" tabindex="-1" role="dialog" style="display: block;background-color: #000000bf;">
  <div class="modal-dialog modal-dialog-scrollable modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Create ${pojo.name} </h5>
        <button type="button" class="close" aria-label="Close" (click)="createHide()">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
<#else>
    <app-${pojo.name?uncap_first}></app-${pojo.name?uncap_first}>
</#if>
<div class="card <#if (pojo.compactView)>col-md-12<#else>col-md-8</#if> mx-auto  p-md-2">
    <#if !(pojo.compactView)> <div class="card-header text-center font-weight-bold">Create ${pojo.name}s</div> </#if>
    <div class="card-body">
        <#if (pojo.compactView)><div class="row"></#if>
        <#list pojo.fieldsSimple as fieldSimple>
            <#if fieldSimple.type.simpleName == "date" || fieldSimple.type.simpleName == "Date">
                <div class="<#if !(pojo.compactView)>row<#elseif pojo.fieldsSimple?size-1 == 1>col-md-12<#else>col-md-6</#if> py-2">
                    <div class="p-grid ui-fluid">
                        <label>${fieldSimple.name}</label>
                        <p-calendar class="p-col-12" dateFormat="yy-mm-dd" [(ngModel)] = "${pojo.name?uncap_first}.${fieldSimple.name}"></p-calendar>
                    </div>
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
                    <input type="text" class="form-control" [(ngModel)] = "${pojo.name?uncap_first}.${fieldSimple.name}">
                </div>
                </#if>
                </#if>
            </#if>
        </#list>
        <#if (pojo.compactView)></div></#if>
        <#list pojo.fieldsGeneric as fieldGeneric>
            <#if fieldGeneric.comboBox>
                <div class="row" >
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
                    <div class="card-header row py-2">${fieldGeneric.name}</div>
                    <div class="card body row py-2">
                        <div class="row">
                            <#list fieldGeneric.pojo.fieldsSimple as fieldSimple>
                                <#if fieldSimple.type.simpleName == "date" || fieldSimple.type.simpleName == "Date">
                                    <div class="<#if fieldGeneric.pojo.fieldsSimple?size-1 == 1>col-md-12<#else>col-md-6</#if> py-2">
                                        <div class="p-grid ui-fluid">
                                            <label>${fieldSimple.name}</label>
                                            <p-calendar class="p-col-12" dateFormat="yy-mm-dd" [(ngModel)] = "${pojo.name?uncap_first}.${fieldGeneric.name?uncap_first}Vo.${fieldSimple.name}"></p-calendar>
                                        </div>
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
                                    <div class="<#if fieldGeneric.pojo.fieldsSimple?size-1 == 1>col-md-12<#else>col-md-6</#if> py-2"><label>${fieldSimple.name}</label>
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
                                <div class="col-md-6 py-2"><label>${SubFieldGeneric.name} ${SubFieldGeneric.pojo.reference.name}</label>
                                    <input type="text" class="form-control" [(ngModel)] = "${pojo.name?uncap_first}.${fieldGeneric.name?uncap_first}Vo.${SubFieldGeneric.name?uncap_first}Vo.${SubFieldGeneric.pojo.reference.name}">
                                </div>
                                    <#else>
                                        <div class="col-md-6 py-2"><label>${SubFieldGeneric.name} ${SubFieldGeneric.pojo.id.name}</label>
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
                                        <div class="p-grid ui-fluid">
                                            <label>${fieldSimple.name}</label>
                                            <p-calendar class="p-col-12" dateFormat="yy-mm-dd" [(ngModel)] = "${fieldList.pojo.name?uncap_first}.${fieldSimple.name}"></p-calendar>
                                        </div>
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
                                <#if SubFieldGeneric.pojo.name != pojo.name>
                                <#if SubFieldGeneric.pojo.reference??>
                                    <div class="col-md-6 py-2"><label>${SubFieldGeneric.name} ${SubFieldGeneric.pojo.reference.name}</label>
                                        <input type="text" class="form-control" [(ngModel)] = "${fieldList.pojo.name?uncap_first}.${SubFieldGeneric.name}Vo.${SubFieldGeneric.pojo.reference.name}">
                                    </div>
                                <#else>
                                    <div class="col-md-6 py-2"><label>${SubFieldGeneric.name} ${SubFieldGeneric.pojo.id.name}</label>
                                        <input type="text" class="form-control" [(ngModel)] = "${fieldList.pojo.name?uncap_first}.${SubFieldGeneric.name}Vo.${SubFieldGeneric.pojo.id.name}">
                                    </div>
                                </#if>
                                </#if>
                            </#list>
                        </div>
                        <div class="card-footer">
                            <button class="btn btn-outline-danger btn-block" (click)="add${fieldList.pojo.name}()">+</button>
                        </div>
                    </div>
                </div>
                <div class="card row table-responsive">
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
        <div class="modal-footer" >
            <button class="form-control" (click)="save${pojo.name}()" >Save</button>
        </div>
    </div>
</div>
<#if (pojo.compactView)>
       </div>
	   </div>
	   </div>
	   </div>
</#if>