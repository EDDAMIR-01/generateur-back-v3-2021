import { Component } from '@angular/core';
import {MenuItem} from "primeng/api";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'frontend';
   sidebarItems: MenuItem[];
   openBar: Boolean;

   notifications : string[];  //contain the notifications to show
   badgeNumber : number;      //contain the number of notifications , if =0 the badge won't show
  settingItems: MenuItem[];  //contain items for the setting menu on nav bar

  constructor() {
    this.openBar=false;

     // to change icons , change the icon value on the array below to one of the font awesome classes 
    this.sidebarItems= [{
      items :[
        <#assign lastindex = pojos?size-1>
        <#assign lastpojo = pojos[lastindex]>
        <#list pojos as pojo>
        <#if pojo != lastpojo>
        { label: '${pojo.name}', routerLink: '/${pojo.name?uncap_first}/list' ,icon:'fa fa-database' },
        <#else>
        { label: '${pojo.name}', routerLink: '/${pojo.name?uncap_first}/list', icon:'fa fa-database' }
        </#if>
        </#list>
      ]
    }];

this.settingItems=[
      {
        label: '',
        items:[
          { label: 'settings', routerLink:'/', icon:'fa fa-cog'},
          { label: 'profile', routerLink:'/', icon:'fa fa-user'}]
      },
      {
        label: '',
        items:[
          { label: 'Log out', routerLink:'/', icon:'fa fa-sign-out'}]
      }
    ];
    
    this.notifications= ["Test 1", "Use equal casing. Compare these module identifiers:","There are multiple modules with names that only differ in casing.\n" +
    "This can lead to unexpected behavior when compiling on a filesystem with other case-semantic." ];

    this.badgeNumber = this.notifications.length;


}

  buttonClick() {
    if(this.openBar == true) {
      this.openBar = false;
      console.log("if "+this.openBar);
    }    else
      {  this.openBar=true;
        console.log("else "+this.openBar);
      }
    console.log("none "+this.openBar);
  }

  markRead() {
    this.badgeNumber = 0;

  }

  deleteNot() {
    this.notifications = [];
    this.badgeNumber = 0;
  }


}