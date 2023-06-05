import { Component, OnInit } from '@angular/core';
import { UntypedFormBuilder } from '@angular/forms';
import { BaseComponent } from 'src/app/_core/base/base.component';

@Component({
  selector: 'app-lich-su-va-phat-trien',
  templateUrl: './lich-su-va-phat-trien.component.html',
  styleUrls: ['./lich-su-va-phat-trien.component.scss']
})
export class LichSuVaPhatTrienComponent extends BaseComponent implements OnInit {

  breadCrumbs = [
    {
      name: 'Trang chủ',
      routerLink: '#/user/trang-chu',
      active: true,
      icon: 'fas fa-home',
    },
    {
      name: 'Lịch sử và phát triển',
      routerLink: '#/user/lich-su-va-phat-trien',
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
        this.lsvpt = res.data.filter((x: any) => x.type.trim() == 'LSVPT');
      }
    );
  }
}
