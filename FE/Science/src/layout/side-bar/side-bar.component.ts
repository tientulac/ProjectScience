import { Component, EventEmitter, Output, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { common } from 'src/app/_core/app.common';
import { AppService } from 'src/service/app.service';
import { SideBarService } from './side-bar.service';

@Component({
  selector: 'app-side-bar',
  templateUrl: './side-bar.component.html',
  styleUrls: ['./side-bar.component.scss']
})
export class SideBarComponent {

  @ViewChild('mainSidebar', { static: false }) mainSidebar: any;
  @Output() mainSidebarHeight: EventEmitter<any> = new EventEmitter<any>();
  com!: common;
  dataSideBar: any;

  constructor(
    public appService: AppService,
    private router: Router,
    private toastr: ToastrService,
    private service: SideBarService
  ) { }

  ngOnInit() {
    this.com = new common(this.router);
    this.com.CheckLogin();
    this.getData();
  }

  getData() {
    this.service.getData().subscribe(data => {
      this.dataSideBar = data;
    });
  }

  menu(id: string) {
    let element, name, arr;
    element = document.getElementById(id);
    arr = element!.className.split(' ');
    name = 'menu-open';
    if (arr.indexOf(name) == -1) {
      element!.className += ' ' + name;
    } else {
      element!.className = 'nav-item';
    }
  }

  ngAfterViewInit() {
    this.mainSidebarHeight.emit(this.mainSidebar.nativeElement.offsetHeight);
  }
}
