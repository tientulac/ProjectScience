import { Component, OnInit, ViewChild } from '@angular/core';
import { UntypedFormBuilder, Validators } from '@angular/forms';
import { BaseComponent } from 'src/app/_core/base/base.component';
import { AppInjector } from 'src/module/app.module';
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import { ChangeEvent } from '@ckeditor/ckeditor5-angular';
@Component({
  selector: 'app-lien-ket',
  templateUrl: './lien-ket.component.html',
  styleUrls: ['./lien-ket.component.scss']
})
export class LienKetComponent extends BaseComponent implements OnInit {

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
      name: 'Liên kết',
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
      title: [null],
      image: [null],
      status: [null],
      descrip:[null],
      note: [null],
      url:[null]
    });
    await this.getListDataLienKet();
  }

  open(data: any, type: any) {
    this.addForm.reset();
    this.titleModal = type == 'ADD' ? 'Thêm mới' : type == 'EDIT' ? 'Cập nhật' : 'Chi tiết';
    this.ID = data.url_link_id ?? null;
    if (type == 'ADD' || type == 'EDIT') {
      this.isDisplayAddModal = true;
      this.titleModal = type == 'ADD' ? 'Thêm mới' : 'Cập nhật';
      this.addForm.patchValue({
        title: data.title ?? null,
        image: data.image ?? null,
        status: data.status ?? null,
        note: data.note ?? null,
      });
      this.dataEditor = data.descrip ?? '';
    }
    if (type == 'VIEW') {
      this.dataEditor = data.descrip;
      this.isDetail = true;
    }
  }

  async save() {
    if (this.addForm.valid) {
      let req = {
        url_link_id: this.ID,
        title: this.addForm.value.title,
        image: this.addForm.value.image,
        status: this.addForm.value.status,
        descrip: this.dataEditor,
        note: this.addForm.value.note,
        url: this.addForm.value.url,
      }
      this.lienKetService.save(req, this.Token).subscribe(
        (res: any) => {
          if (res.status == 200) {
            this.toastr.success('Thành công');
            this.handleCancel();
            this.getListDataLienKet();
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
    this.lienKetService.delete(this.ID, this.Token).subscribe((data) => {
      if (data.status == 200) {
        this.toastr.success('Thành công');
        this.getListDataLienKet();
      } else {
        this.toastr.error(data.Message);
      }
      this.isDisplayDelete = false;
    });
  }
}
