import { Component, OnInit } from '@angular/core';

@Component({
    selector: 'app-${pojo.name?uncap_first}',
    templateUrl: './${pojo.name?uncap_first}.component.html',
    styleUrls: ['./${pojo.name?uncap_first}.component.css']
})
export class ${pojo.name}Component implements OnInit {

    constructor() { }

    ngOnInit(): void {
    }

}