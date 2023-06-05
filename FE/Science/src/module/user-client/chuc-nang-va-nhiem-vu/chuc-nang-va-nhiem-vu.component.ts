import { Component, OnInit } from '@angular/core';
import { UntypedFormBuilder } from '@angular/forms';
import { BaseComponent } from 'src/app/_core/base/base.component';

@Component({
  selector: 'app-chuc-nang-va-nhiem-vu',
  templateUrl: './chuc-nang-va-nhiem-vu.component.html',
  styleUrls: ['./chuc-nang-va-nhiem-vu.component.scss']
})
export class ChucNangVaNhiemVuComponent extends BaseComponent implements OnInit {
  breadCrumbs = [
    {
      name: 'Trang chủ',
      routerLink: '#/user/trang-chu',
      active: true,
      icon: 'fas fa-home',
    },
    {
      name: 'Chức năng và nhiệm vụ',
      routerLink: '#/user/chuc-nang-va-nhiem-vu',
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
        this.lsvpt = res.data.filter((x: any) => x.type.trim() == 'CNVNV');
      }
    );
  }
}
