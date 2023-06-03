import { Component, OnInit, ViewChild,Input  } from '@angular/core';
import { UntypedFormBuilder, Validators } from '@angular/forms';
import { BaseComponent } from 'src/app/_core/base/base.component';
import { AppInjector } from 'src/module/app.module';
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import { ChangeEvent } from '@ckeditor/ckeditor5-angular';
@Component({
  selector: 'app-menu-children',
  templateUrl: './menu-children.component.html',
  styleUrls: ['./menu-children.component.scss']
})
export class MenuChildrenComponentextends extends BaseComponent implements OnInit {
  @Input() ID_menuPearent  :any
  public Editor = ClassicEditor;
  dataEditor: any;
  breadCrumbs = [
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
      menu_code: [null,[Validators.required]],
      menu_name: [null,[Validators.required]],
      status:[null],
    });
  }

  open(data: any, type: any) {
    this.addForm.reset();
    this.titleModal = type == 'ADD' ? 'Thêm mới' : type == 'EDIT' ? 'Cập nhật' : 'Chi tiết';
    this.ID = data.menu_parent_id ?? null;
    if (type == 'ADD' || type == 'EDIT') {
      this.isDisplayAddModal = true;
      this.titleModal = type == 'ADD' ? 'Thêm mới' : 'Cập nhật';
      this.addForm.patchValue({
        status: data.status ?? null,
        menu_code: data.menu_code ?? null,
        menu_name: data.menu_name ?? null,
      });
    }
    if (type == 'VIEW') {
      debugger
      this.getListDatalistMenuChildren(this.ID);
      this.isDetail = true;
    }
  }

  async save() {
    if (this.addForm.valid) {
      let req = {
        menu_parent_id: this.menu_parent_id,
        menu_id:this.ID,
        menu_name: this.addForm.value.menu_name,
        menu_code: this.addForm.value.menu_code,
        status: this.addForm.value.status,
      }
      this.menuChildrenService.save(req, this.Token).subscribe(
        (res: any) => {
          if (res.status == 200) {
            this.toastr.success('Thành công');
            this.handleCancel();
            this.getListDatalistMenuChildren(this.menu_parent_id);
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
    this.menuChildrenService.delete(this.ID, this.Token).subscribe((data) => {
      if (data.status == 200) {
        this.toastr.success('Thành công');
        this.getListDatalistMenuChildren(this.menu_parent_id);
      } else {
        this.toastr.error(data.Message);
      }
      this.isDisplayDelete = false;
    });
  }
}