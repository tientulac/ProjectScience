import { Component, OnInit } from '@angular/core';
import { UntypedFormBuilder } from '@angular/forms';
import { BaseComponent } from 'src/app/_core/base/base.component';

@Component({
  selector: 'app-ban-giam-doc',
  templateUrl: './ban-giam-doc.component.html',
  styleUrls: ['./ban-giam-doc.component.scss']
})
export class BanGiamDocComponent extends BaseComponent implements OnInit {
  breadCrumbs = [
    {
      name: 'Trang chủ',
      routerLink: '#/user/trang-chu',
      active: true,
      icon: 'fas fa-home',
    },
    {
      name: 'Ban giám đốc',
      routerLink: '#/user/ban-giam-doc',
      active: false,
      icon: ''
    },
  ];

  lsvpt: any;

  constructor(
    private fb: UntypedFormBuilder
  ) {
    super();
  }

  async ngOnInit(): Promise<void> {
    await this.getList();
    await this.getListData();
  }

  async getList() {
    this.baseService.getListNew(await this.Token).subscribe(
      (res) => {
        this.lsvpt = res.data.filter((x: any) => x.type.trim() == 'BGD');
      }
    );
  }
}
