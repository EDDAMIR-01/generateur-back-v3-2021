import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
<#list pojos as pojo>
import {${pojo.name}listComponent} from './view/${pojo.name?uncap_first}/list/${pojo.name?uncap_first}-list.component';
import {${pojo.name}CreateComponent} from './view/${pojo.name?uncap_first}/create/${pojo.name?uncap_first}-create.component';
import {${pojo.name}DetailsComponent} from './view/${pojo.name?uncap_first}/details/${pojo.name?uncap_first}-details.component';
import {${pojo.name}EditComponent} from './view/${pojo.name?uncap_first}/edit/${pojo.name?uncap_first}-edit.component';
</#list>
import {AppComponent} from './app.component';
import {LandingPageComponent} from './landing-page/landing-page.component';

const routes: Routes = [
<#list pojos as pojo>
  { path: '${pojo.name?uncap_first}', children: [
      {path: 'list', component: ${pojo.name}listComponent},
      {path: 'create', component: ${pojo.name}CreateComponent},
      {path: 'details', component: ${pojo.name}DetailsComponent},
      {path: 'edit', component: ${pojo.name}EditComponent}
    ]},
</#list>
  {path: '', component: LandingPageComponent}
    ]
;

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
