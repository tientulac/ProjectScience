import { Component, OnInit } from '@angular/core';
import { UntypedFormBuilder } from '@angular/forms';
import { BaseComponent } from 'src/app/_core/base/base.component';

@Component({
  selector: 'app-co-cau-to-chuc',
  templateUrl: './co-cau-to-chuc.component.html',
  styleUrls: ['./co-cau-to-chuc.component.scss']
})
export class CoCauToChucComponent extends BaseComponent implements OnInit {
  breadCrumbs = [
    {
      name: 'Trang chủ',
      routerLink: '#/user/trang-chu',
      active: true,
      icon: 'fas fa-home',
    },
    {
      name: 'Cơ cấu tổ chức',
      routerLink: '#/user/co-cau-to-chuc',
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
        this.lsvpt = res.data.filter((x: any) => x.type.trim() == 'CCTC');
      }
    );
  }
}
