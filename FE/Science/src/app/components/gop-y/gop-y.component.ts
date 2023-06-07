import { Component, OnInit, ViewChild } from '@angular/core';
import { UntypedFormBuilder, Validators } from '@angular/forms';
import { BaseComponent } from 'src/app/_core/base/base.component';
import { AppInjector } from 'src/module/app.module';
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import { ChangeEvent } from '@ckeditor/ckeditor5-angular';
@Component({
  selector: 'app-gop-y',
  templateUrl: './gop-y.component.html',
  styleUrls: ['./gop-y.component.scss']
})
export class GopYComponentextends extends BaseComponent implements OnInit {

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
      name: 'Góp ý',
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
      Ho_ten: [null],
      Email: [null],
      So_dien_thoai: [null],
      Tieu_de:[null],
      Noi_dung: [null],
      image: [null],
    });
    await this.getListDatalistGopY();
  }

  open(data: any, type: any) {
    this.addForm.reset();
    this.titleModal = type == 'ADD' ? 'Thêm mới' : type == 'EDIT' ? 'Cập nhật' : 'Chi tiết';
    this.ID = data.id_gop_y ?? null;
    if (type == 'ADD' || type == 'EDIT') {
      this.isDisplayAddModal = true;
      this.titleModal = type == 'ADD' ? 'Thêm mới' : 'Cập nhật';
      this.addForm.patchValue({
        Ho_ten: data.Ho_ten ?? null,
        Email: data.Email ?? null,
        So_dien_thoai: data.So_dien_thoai ?? null,
        Tieu_de: data.Tieu_de ?? null,
        Noi_dung: data.Noi_dung ?? null,
        Ngay_hoi: data.Ngay_hoi ?? null,
        image: data.image ?? null,
        
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
        id_gop_y: this.ID,
        Ho_ten: this.addForm.value.Ho_ten,
        Email: this.addForm.value.Email,
        So_dien_thoai: this.addForm.value.So_dien_thoai,
        Tieu_de: this.addForm.value.Tieu_de,
        Noi_dung: this.addForm.value.Noi_dung,
        Ngay_hoi: this.addForm.value.Ngay_hoi,
        image: this.addForm.value.image,
      }
      this.gopYService.save(req, this.Token).subscribe(
        (res: any) => {
          if (res.status == 200) {
            this.toastr.success('Thành công');
            this.handleCancel();
            this.getListDatalistGopY();
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
    this.gopYService.delete(this.ID, this.Token).subscribe((data) => {
      if (data.status == 200) {
        this.toastr.success('Thành công');
        this.getListDatalistGopY();
      } else {
        this.toastr.error(data.Message);
      }
      this.isDisplayDelete = false;
    });
  }
}
