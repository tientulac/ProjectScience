import { Component, OnInit, ViewChild } from '@angular/core';
import { UntypedFormBuilder, Validators } from '@angular/forms';
import { BaseComponent } from 'src/app/_core/base/base.component';
import { AppInjector } from 'src/module/app.module';
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import { ChangeEvent } from '@ckeditor/ckeditor5-angular';

@Component({
  selector: 'app-slide-anh',
  templateUrl: './slide-anh.component.html',
  styleUrls: ['./slide-anh.component.scss']
})
export class SlideAnhComponent extends BaseComponent implements OnInit {

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
      name: 'Slide Ảnh',
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
      title: [null, [Validators.required]],
      image: [null, [Validators.required]],
      status: [null, [Validators.required]],
      note: [null],
    });
    await this.getListData();
  }

  open(data: any, type: any) {
    this.addForm.reset();
    this.titleModal = type == 'ADD' ? 'Thêm mới' : type == 'EDIT' ? 'Cập nhật' : 'Chi tiết';
    this.ID = data.slide_image_id ?? null;
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
        slide_image_id: this.ID,
        title: this.addForm.value.title,
        image: this.addForm.value.image,
        status: this.addForm.value.status,
        descrip: this.dataEditor,
        note: this.addForm.value.note,
      }
      this.slideAnhService.save(req, this.Token).subscribe(
        (res: any) => {
          if (res.status == 200) {
            this.toastr.success('Thành công');
            this.handleCancel();
            this.getListData();
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
    this.slideAnhService.delete(this.ID, this.Token).subscribe((data) => {
      if (data.status == 200) {
        this.toastr.success('Thành công');
        this.getListData();
      } else {
        this.toastr.error(data.Message);
      }
      this.isDisplayDelete = false;
    });
  }
}
