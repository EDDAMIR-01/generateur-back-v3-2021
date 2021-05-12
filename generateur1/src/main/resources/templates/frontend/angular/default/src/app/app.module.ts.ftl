import { BrowserModule } from '@angular/platform-browser';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import {CalendarModule} from 'primeng/calendar';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import {FormsModule} from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import {AppRoutingModule} from './app-routing.module';
<#list pojos as pojo>
import { ${pojo.name}CreateComponent } from './view/${pojo.name?uncap_first}/create/${pojo.name?uncap_first}-create.component';
import { ${pojo.name}listComponent } from './view/${pojo.name?uncap_first}/list/${pojo.name?uncap_first}-list.component';
import { ${pojo.name}DetailsComponent } from './view/${pojo.name?uncap_first}/details/${pojo.name?uncap_first}-details.component';
import { ${pojo.name}EditComponent } from './view/${pojo.name?uncap_first}/edit/${pojo.name?uncap_first}-edit.component';
import { ${pojo.name}Component } from './view/${pojo.name?uncap_first}/${pojo.name?uncap_first}.component';
</#list>
import { NavbarComponent } from './navbar/navbar.component';
import {LandingPageComponent} from './landing-page/landing-page.component';


import {OverlayPanelModule} from 'primeng/overlaypanel';

import {MenuModule} from 'primeng/menu';

@NgModule({
  declarations: [
<#list pojos as pojo>
    ${pojo.name}CreateComponent,
    ${pojo.name}listComponent,
    ${pojo.name}DetailsComponent,
    ${pojo.name}EditComponent,
    ${pojo.name}Component,
</#list>
    AppComponent,
    LandingPageComponent,
    NavbarComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpClientModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    CalendarModule,
     OverlayPanelModule,
    MenuModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
