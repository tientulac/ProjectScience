import { Component, OnInit, ViewChild } from '@angular/core';
import { UntypedFormBuilder, Validators } from '@angular/forms';
import { BaseComponent } from 'src/app/_core/base/base.component';
import { AppInjector } from 'src/module/app.module';
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import { ChangeEvent } from '@ckeditor/ckeditor5-angular';
@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.scss']
})
export class MenuComponent extends BaseComponent implements OnInit {

  public Editor = ClassicEditor;
  dataEditor: any;

  breadCrumbs = [
    {
      name: 'Trang chủ',
      routerLink: '/',
      active: true,
      icon: 'fas fa-home',
    },
    {
      name: 'Danh sách menu',
      routerLink: '',
      active: false,
      icon: ''
    },
  ];

  constructor(
    private fb: UntypedFormBuilder
  ) {
    super();
  }

  async ngOnInit(): Promise<void> {
    this.Token = await this.getToken();
    this.addForm = this.fb.group({
      menu_parent_id: [null],
      menu_parent_code: [null,[Validators.required]],
      menu_parent_name: [null,[Validators.required]],
      status:[null],
    });
    await this.getListDatalistMenu();
  }

  open(data: any, type: any) {
    this.addForm.reset();
    this.titleModal = type == 'ADD' ? 'Thêm mới' : type == 'EDIT' ? 'Cập nhật' : 'Danh sách menu-children';
    this.ID = data.menu_parent_id ?? null;
    if (type == 'ADD' || type == 'EDIT') {
      this.isDisplayAddModal = true;
      this.titleModal = type == 'ADD' ? 'Thêm mới' : 'Cập nhật';
      this.addForm.patchValue({
        status: data.status ?? null,
        menu_parent_code: data.menu_parent_code ?? null,
        menu_parent_name: data.menu_parent_name ?? null,
      });
    }
    if (type == 'VIEW') {
      this.ID;
      this.getListDatalistMenuChildren(this.ID);
      this.isDetail = true;
    }
  }

  async save() {
    if (this.addForm.valid) {
      let req = {
        menu_parent_id: this.ID,
        menu_parent_code: this.addForm.value.menu_parent_code,
        menu_parent_name: this.addForm.value.menu_parent_name,
        status: this.addForm.value.status,
      }
      this.menuService.save(req, this.Token).subscribe(
        (res: any) => {
          if (res.status == 200) {
            this.toastr.success('Thành công');
            this.handleCancel();
            this.getListDatalistMenu();
          } else {
            this.toastr.error('Thất bại');
          }
        }
      );
    } else {
      Object.values(this.addForm.controls).forEach(async control => {
        if (control.invalid) {
          control.markAsDirty();
          control.updateValueAndValidity({ onlySelf: true });
        }
      });
    }
  }

  delete() {
    this.menuService.delete(this.ID, this.Token).subscribe((data) => {
      if (data.status == 200) {
        this.toastr.success('Thành công');
        this.getListDatalistMenu();
      } else {
        this.toastr.error(data.Message);
      }
      this.isDisplayDelete = false;
    });
  }
}
