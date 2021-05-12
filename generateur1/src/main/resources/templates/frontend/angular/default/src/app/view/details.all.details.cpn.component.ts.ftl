import { Component, OnInit } from '@angular/core';
import {${pojo.name}Vo} from '../../../controller/model/${pojo.name?uncap_first}.model';
import {${pojo.name}Service} from '../../../controller/service/${pojo.name}.service';

@Component({
  selector: 'app-${pojo.name?uncap_first}-details',
  templateUrl: './${pojo.name?uncap_first}-details.component.html',
  styleUrls: ['./${pojo.name?uncap_first}-details.component.css']
})

export class ${pojo.name}DetailsComponent implements OnInit {

  constructor(private _${pojo.name?uncap_first}Service : ${pojo.name}Service) {}


   get ${pojo.name?uncap_first}Service (): ${pojo.name}Service {
    return this._${pojo.name?uncap_first}Service;
  }

  set ${pojo.name?uncap_first}Service (value: ${pojo.name}Service) {
    this._${pojo.name?uncap_first}Service = value ;
  }

  get ${pojo.name?uncap_first}Detail (): ${pojo.name}Vo {
    return this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}Detail;
}

  set ${pojo.name?uncap_first}Detail (value: ${pojo.name}Vo) {
  this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}Detail = value ;
}


get ${pojo.name?uncap_first}ShowDetail (): boolean  {
  return this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}ShowDetail;
}

set ${pojo.name?uncap_first}ShowDetail (value: boolean ) {
  this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}ShowDetail = value ;
}

  ngOnInit(): void {

  }

public detailHide(){
       this.${pojo.name?uncap_first}Service.detailHide();
}

}