import {Component, Input, OnInit, Renderer2} from '@angular/core';
import {MenuItem} from "primeng/api";

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {

  private _sItems: MenuItem[];

  private open: boolean;

  constructor(private renderer: Renderer2) {
  }

  @Input()
  get sidebarItems() {
    return this._sItems;
  }

  set sidebarItems(val) {
    this._sItems = val;
  }

  @Input()
  get opened() {
    return this.open;
  }

  set opened(val) {
    this.open = val;
  }

  ngOnInit(): void {
  }

  drop(event) {
    let target = event.target || event.currentTarget;
    let id = target.attributes.id.nodeValue;
    if (document.getElementById(id + "d").className == "collapse list-unstyled") {
      document.getElementById(id + "d").className = "collapsing list-unstyled"
      document.getElementById(id + "d").className = "collapse list-unstyled show"
    } else {
      document.getElementById(id + "d").className = "collapse list-unstyled"
    }

  }
}
