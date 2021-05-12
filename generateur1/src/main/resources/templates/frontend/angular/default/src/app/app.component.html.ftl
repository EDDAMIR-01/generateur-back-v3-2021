<!-- <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="/">Project</a>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">
            <#list pojos as pojo>
             <#if (pojo.compactView)> 
             <li class="nav-item ">
                    <a class="nav-link" routerLink="/${pojo.name?uncap_first}/list" id="navbarOf${pojo.name}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ${pojo.name}
                    </a>
             </li>
             <#else>
             <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarOf${pojo.name}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ${pojo.name}
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarOf${pojo.name}">
                        <a class="dropdown-item" routerLink="/${pojo.name?uncap_first}/list">List</a>
                        <a class="dropdown-item" routerLink="/${pojo.name?uncap_first}/create">Create</a>
                        <a class="dropdown-item" routerLink="/${pojo.name?uncap_first}/edit">Edit</a>
                    </div>
                </li>
            </#if>
            </#list>
        </ul>
    </div>
</nav> -->

<div class="wrapper">
    <app-navbar [opened]="openBar"  style="background-color: #26272b"
                [sidebarItems]="sidebarItems"></app-navbar>
    <div id="content">
        <nav class="navbar navbar-dark  boxShadow">
            <div class="sticky-top my-2 mx-2"> <button class="btn btn-dark btn-circle btn-lg" (click)="buttonClick()"><i class=" fa " [ngClass]="{'fa-bars': openBar==true , ' fa-close': openBar==false}" ></i></button></div>
            <span style="text-align: center;" class="span">
          <!-- <i class="fas fa-school"
              style="font-size: 45px;text-align: center;"></i> -->

          <img
                  routerLink=""
                  src="../assets/images/angular-icon.svg"
                  alt="Login Image"
                  height="40px"
          />
          <br />
          ANGULAR 9.0</span>

            <button  pButton class="btn btn-dark btn-circle btn-lg  float-left  mx-3" (click)="op1.toggle($event)"><i class="fa fa-bell"></i> <span class="badge badge-pill badge-danger" *ngIf="this.badgeNumber>0"> {{this.badgeNumber}}</span> </button>

            <button  pButton class="btn btn-dark btn-circle btn-lg  float-left " (click)="menu.toggle($event)"><i class="fa fa-cog"></i> </button>
        </nav>


<router-outlet></router-outlet>

</div>
    <p-overlayPanel #op1 [dismissable]="true" [showCloseIcon]="true" >
        <ng-template pTemplate >
            <div  *ngFor="let n of notifications">
                <p> {{n}}</p>
                <hr style="background-color:whitesmoke">
            </div>
            <div>
                <button class="btn btn-dark col-6" (click)="markRead();op1.hide()"><i class="fa fa-check"></i> Mark as read</button>
                <button class="btn btn-dark col-6" (click)="deleteNot();op1.hide()"> <i class="fa fa-trash"></i> Delete notifications</button>
            </div>
        </ng-template>
    </p-overlayPanel>

    <p-menu [showTransitionOptions]="'0ms'" [hideTransitionOptions]="'0ms'" #menu [popup]="true" [model]="settingItems"></p-menu>

</div>