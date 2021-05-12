<div class="modal" tabindex="-1" role="dialog" style="display: block;background-color: #000000bf;">
  <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">details of ${pojo.name} </h5>
        <button type="button" class="close" aria-label="Close" (click)="detailHide()">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table table-hover">
          <thead class="thead-dark">
            <th>Field</th>
            <th>Value</th>
          </thead>
          <tbody>
          <#list pojo.fields as field>
           <tr >
             <td>${field.name}</td>
             <#if pojo.fieldsSimple?seq_contains(field)>
             <td>{{${pojo.name?uncap_first}Detail.${field.name}}} </td>
             <#elseif pojo.fieldsList?seq_contains(field) >
             <td> <ul>
               <li *ngFor="let p of ${pojo.name?uncap_first}Detail.${field.name}Vo">
          
                {{p.${field.pojo.id.name}}}  <#if (field.pojo.reference)??> {{p.${field.pojo.reference.name}}} </#if>
               </li>
             </ul>
             </td>
             <#elseif pojo.fieldsGeneric?seq_contains(field)>
              <#if (field.pojo.reference)??>
           <td>{{${pojo.name?uncap_first}Detail.${field.name}Vo.${field.pojo.reference.name}}} </td>
            <#else>
            <td>{{${pojo.name?uncap_first}Detail.${field.name}Vo.${field.pojo.id.name}}} </td>
             </#if>
             </#if>
           </tr>
          </#list>
          </tbody>
        </table>
      </div>

    </div>
  </div>
</div>
