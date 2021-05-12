<#if !(pojo.compactView)>
     <app-${pojo.name?uncap_first}></app-${pojo.name?uncap_first}>
</#if>

<div class="container">
  <div class="row">
    <div id="accordion" class="col-12 my-3">
      <div class="card">
        <div class="card-header border-0 bg-white" id="headingSearch">
          
            <button class="btn btn-info  btn-sm fa fa-filter" data-toggle="collapse" data-target="#search" aria-expanded="true" aria-controls="search">
              <h5 class="float-right">Search Forms</h5>
            </button>
         
        </div>

        <div id="search" class="collapse" aria-labelledby="headingSearch" data-parent="#accordion">
          <div class="card-body">
            <div class="container">
              <div class = "row">
               <div class="form-row">
   
     <#list pojo.fields as field>
        <#if pojo.fieldsSimple?seq_contains(field)>
              <div class="input-group <#if (pojo.fieldsSimpleNumberOrDate?seq_contains(field)) && pojo.id.name != field.name > col-4 <#else> col-3 </#if> my-2">
              <#if (pojo.fieldsSimpleNumberOrDate?seq_contains(field)) && pojo.id.name != field.name >
 <#if field.type.simpleName == "date" || field.type.simpleName == "Date">
    <div class="col-5 mx-1 px-1">
                    <div class="p-grid ui-fluid">
                        <small class="text-muted">${field.name} Min</small>
                        <p-calendar class="p-col-12" dateFormat="yy-mm-dd" [(ngModel)] = "${pojo.name?uncap_first}Search.${field.name}Min"></p-calendar>
                    </div>
    </div>
    <div class="col-5 mx-1 px-1">
                    <div class="p-grid ui-fluid">
                        <small class="text-muted">${field.name} Max</small>
                        <p-calendar class="p-col-12" dateFormat="yy-mm-dd" [(ngModel)] = "${pojo.name?uncap_first}Search.${field.name}Max"></p-calendar>
                    </div>
    </div>

  <#else>
    <div class="col-5  mx-1 px-1">
      <small class="text-muted">${field.name} Min</small>
      <input type="text" class="form-control" placeholder="Min ${field.name}" [(ngModel)]="${pojo.name?uncap_first}Search.${field.name}Min">
    </div>
    <div class="col-5  mx-1 px-1 ">
      <small class="text-muted">${field.name} Min</small>
      <input type="text" class="form-control" placeholder="Max ${field.name}" [(ngModel)]="${pojo.name?uncap_first}Search.${field.name}Max">
    </div>
 </#if>
          <#else>
            <#if field.type.simpleName == "boolean">

                <div class="col-5  mx-1 px-1">
                    <small class="text-muted col-12">${field.name}</small>
                    <select class="form-control col-12" [(ngModel)] = "${pojo.name?uncap_first}Search.${field.name}">
                        <option value="true">true</option>
                        <option value="false">false</option>
                    </select>
                 </div>   
<#else>
<small class="text-muted col-12">${field.name}</small>
<input type="text" class="form-control col-12" placeholder="${field.name}" [(ngModel)]="${pojo.name?uncap_first}Search.${field.name}">
             </#if>   
              </#if>
             </div>
  <#elseif (pojo.fieldsGeneric?seq_contains(field))> 
             <#if field.comboBox>
                <div class="input-group  col-4 my-2">
                   <small class="text-muted col-12">${field.name}</small>
                        <#if field.pojo.reference??>
                    <select class="form-control col-12" [(ngModel)]="${pojo.name?uncap_first}Search.${field.name}Vo" >
                        <option *ngFor="let p of ${field.name}s" [ngValue]="p" >{{p.${field.pojo.reference.name}}}</option>
                    </select>
                        <#else>
                        <select class="form-control col-12" [(ngModel)]="${pojo.name?uncap_first}Search.${field.name}Vo" >
                        <option *ngFor="let p of ${field.name}s" [ngValue]="p" >{{p.${field.pojo.id.name}}}</option>
                        </select>
                 
                        </#if>
                 </div>
            </#if>
  <#else>          
        </#if>
        </#list>
              </div>    
          </div>
           <button class="btn btn-info btn-sm fa fa-search float-right px-5 py-2 my-4" (click)="find${pojo.name}(${pojo.name?uncap_first}Search)"></button>
        </div>
      </div>
    </div>
  </div>
</div>
  </div>
<div class="row">
  <div class="card col-12">
    <div class="card-header bg-transparent">
    <div class="float-left px-1"> <h5>List of ${pojo.name?uncap_first}s. </h5></div>

      <#if (pojo.compactView)> 
          <button class="btn btn-success btn-sm fa fa-plus float-right" (click)="createShow()"> Create a new ${pojo.name?uncap_first}</button>
          
          </#if>
    </div>
    <div class="card-body table-responsive">

      <table class="table table-hover col-md-12">
        <thead class="thead-dark">

        <#list pojo.fields as field>
        <#if pojo.fieldsSimple?seq_contains(field)>
          <th>${field.name}</th>
          <#elseif pojo.fieldsGeneric?seq_contains(field) >
          <#if (field.pojo.reference)??>
            <th>${field.name} reference</th>
            <#else>
            <th>${field.name} id</th>
          </#if>
          <#else>
        </#if>
        </#list>
     <th>Actions</th>
  </thead>
  <tbody>
  <tr *ngFor="let p of ${pojo.name?uncap_first}Liste">

          <#list pojo.fields as field>
        <#if pojo.fieldsSimple?seq_contains(field)>
           <td>{{p.${field.name}}}</td>
          <#elseif pojo.fieldsGeneric?seq_contains(field)>
          <#if (field.pojo.reference)??>
            <td>{{p.${field.name}Vo?.${field.pojo.reference.name}}}</td>
            <#else>
            <td>{{p.${field.name}Vo?.${field.pojo.id.name}}}</td>
          </#if>
          <#else>
        </#if>
        </#list>
 

<td><button class="btn btn-danger btn-sm fa fa-trash mx-md-1" (click)="delete(p)"></button>
  <button class="btn btn-warning btn-sm fa fa-external-link mx-md-1" (click)="detailShow(p)"></button>
    <#if (pojo.compactView)>
    <button class="btn btn-info btn-sm fa fa-pencil mx-md-1" (click)="editShow(p)"></button>
  
  </#if>
  

</td>

</tr>
   <#if (pojo.compactView)>
  <app-${pojo.name?uncap_first}-edit *ngIf="${pojo.name?uncap_first}ShowEdit"></app-${pojo.name?uncap_first}-edit>
  <app-${pojo.name?uncap_first}-create *ngIf="${pojo.name?uncap_first}ShowCreate"></app-${pojo.name?uncap_first}-create>
  </#if>
<app-${pojo.name?uncap_first}-details *ngIf="${pojo.name?uncap_first}ShowDetail"></app-${pojo.name?uncap_first}-details>
</tbody>
</table>
</div>
</div>
</div>
</div>
