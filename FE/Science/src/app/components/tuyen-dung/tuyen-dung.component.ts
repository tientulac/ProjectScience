import { Component, OnInit, ViewChild } from '@angular/core';
import { UntypedFormBuilder, Validators } from '@angular/forms';
import { BaseComponent } from 'src/app/_core/base/base.component';
import { AppInjector } from 'src/module/app.module';
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import { ChangeEvent } from '@ckeditor/ckeditor5-angular';
@Component({
  selector: 'app-tuyen-dung',
  templateUrl: './tuyen-dung.component.html',
  styleUrls: ['./tuyen-dung.component.scss']
})
export class TuyenDungComponentextends extends BaseComponent implements OnInit {

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
      name: 'Tuyển dụng',
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
      title: [null,[Validators.required]],
      image: [null],
      status: [null],
      descrip:[null],
      note: [null],
      url:[null],
      type:[null],
      Address:[null],
      poster:[null],
      wage:[null],
      quantity:[null]
    });
    await this.getListDatalistTuyenDung();
  }

  open(data: any, type: any) {
    this.addForm.reset();
    this.titleModal = type == 'ADD' ? 'Thêm mới' : type == 'EDIT' ? 'Cập nhật' : 'Chi tiết';
    this.ID = data.recruiment_id ?? null;
    if (type == 'ADD' || type == 'EDIT') {
      this.isDisplayAddModal = true;
      this.titleModal = type == 'ADD' ? 'Thêm mới' : 'Cập nhật';
      this.addForm.patchValue({
        title: data.title ?? null,
        image: data.image ?? null,
        status: data.status ?? null,
        note: data.note ?? null,
        descrip:data.note??null,
        type:data.type??null,
        Address:data.Address??null,
        poster:data.poster??null,
        wage:data.wage??null,
        quantity:data.quantity??null
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
        recruiment_id: this.ID,
        title: this.addForm.value.title,
        image: this.addForm.value.image,
        status: this.addForm.value.status,
        descrip: this.addForm.value.descrip,
        note: this.addForm.value.note,
        url: this.addForm.value.url,
        type:this.addForm.value.type,
        Address:this.addForm.value.Address,
        poster:this.addForm.value.poster,
        wage:this.addForm.value.wage,
        quantity:this.addForm.value.quantity,
      }
      this.tuyenDungService.save(req, this.Token).subscribe(
        (res: any) => {
          if (res.status == 200) {
            this.toastr.success('Thành công');
            this.handleCancel();
            this.getListDatalistTuyenDung();
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
    this.tuyenDungService.delete(this.ID, this.Token).subscribe((data) => {
      if (data.status == 200) {
        this.toastr.success('Thành công');
        this.getListDatalistTuyenDung();
      } else {
        this.toastr.error(data.Message);
      }
      this.isDisplayDelete = false;
    });
  }
}