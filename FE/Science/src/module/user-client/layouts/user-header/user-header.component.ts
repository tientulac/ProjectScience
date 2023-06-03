import { Component, OnInit } from '@angular/core';
import { NzPlacementType } from 'ng-zorro-antd/dropdown';
import { BaseComponent } from 'src/app/_core/base/base.component';

@Component({
  selector: 'app-user-header',
  templateUrl: './user-header.component.html',
  styleUrls: ['./user-header.component.scss']
})
export class UserHeaderComponent extends BaseComponent implements OnInit {
  async ngOnInit(): Promise<void> {
    this.Token = await this.getToken();
    this.getListData();
  }
  
}
