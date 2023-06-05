import { Component, OnInit, ViewChild } from '@angular/core';
import { UntypedFormBuilder, Validators } from '@angular/forms';
import { BaseComponent } from 'src/app/_core/base/base.component';
import { AppInjector } from 'src/module/app.module';
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import { ChangeEvent } from '@ckeditor/ckeditor5-angular';
@Component({
  selector: 'app-loai-tin-tuc',
  templateUrl: './loai-tin-tuc.component.html',
  styleUrls: ['./loai-tin-tuc.component.scss']
})
export class LoaiTinTucComponentextends extends BaseComponent implements OnInit {

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
      name: 'Loại tin tức',
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
      Loai_tin_tuc: [null,[Validators.required]],
      Ma_loai:[null,[Validators.required]]
    });
    await this.getListDatalistLoaiTinTuc();
  }

  open(data: any, type: any) {
    this.addForm.reset();
    this.titleModal = type == 'ADD' ? 'Thêm mới' : type == 'EDIT' ? 'Cập nhật' : 'Chi tiết';
    this.ID = data.id_loai_tin_tuc ?? null;
    if (type == 'ADD' || type == 'EDIT') {
      this.isDisplayAddModal = true;
      this.titleModal = type == 'ADD' ? 'Thêm mới' : 'Cập nhật';
      this.addForm.patchValue({
        Loai_tin_tuc: data.Loai_tin_tuc ?? null,
        Ma_loai:data.Ma_loai??null
      });
    }
    if (type == 'VIEW') {
      this.dataEditor = data.descrip;
      this.isDetail = true;
    } 
  }

  async save() {
    if (this.addForm.valid) {
      let req = {
        id_loai_tin_tuc: this.ID,
        Ma_loai:this.addForm.value.Ma_loai,
        Loai_tin_tuc: this.addForm.value.Loai_tin_tuc
      }
      this.loaiTintucService.save(req, this.Token).subscribe(
        (res: any) => {
          if (res.status == 200) {
            this.toastr.success('Thành công');
            this.handleCancel();
            this.getListDatalistLoaiTinTuc();
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
    this.loaiTintucService.delete(this.ID, this.Token).subscribe((data) => {
      if (data.status == 200) {
        this.toastr.success('Thành công');
        this.getListDatalistLoaiTinTuc();
      } else {
        this.toastr.error(data.Message);
      }
      this.isDisplayDelete = false;
    });
  }
}