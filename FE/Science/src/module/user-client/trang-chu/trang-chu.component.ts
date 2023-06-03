import { Component, OnInit } from '@angular/core';
import { BaseComponent } from 'src/app/_core/base/base.component';

@Component({
  selector: 'app-trang-chu',
  templateUrl: './trang-chu.component.html',
  styleUrls: ['./trang-chu.component.scss']
})
export class TrangChuComponent extends BaseComponent implements OnInit {

  async ngOnInit(): Promise<void> {
    this.Token = await this.getToken();
    await this.getListData();
  }
}
