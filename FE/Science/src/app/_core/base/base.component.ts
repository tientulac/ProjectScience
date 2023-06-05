import { Component, OnInit } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { Router, ActivatedRoute, Data } from '@angular/router';
import { NgxSpinnerService } from 'ngx-spinner';
import * as _ from 'lodash';
import { AppInjector } from 'src/module/app.module';
import { common } from '../app.common';
import { ResponseLogin } from '../model/output/ResponseLogin';
import { UntypedFormGroup } from '@angular/forms';
import { NzModalService } from 'ng-zorro-antd/modal';
import { endOfMonth } from 'date-fns';
import { NzMessageService } from 'ng-zorro-antd/message';
import { NzUploadChangeParam } from 'ng-zorro-antd/upload';
import { ResponseBase } from '../model/ResponseBase';
import { SlideAnhService } from 'src/app/components/slide-anh/slide-anh.service';
import { BaseService } from 'src/service/base.service';
import { LienKetService } from 'src/app/components/lien-ket/lien-ket.service';
import { TinTucService } from 'src/app/components/tin-tuc/tin-tuc.service';
import { ThuTucHanhChinhService } from 'src/app/components/thu-tuc-hanh-chinh/thu-tuc-hanh-chinh.service';
import { ChinhSachHoTroComponent } from 'src/app/components/chinh-sach-ho-tro/chinh-sach-ho-tro.component';
import { ChinhSachHoTroService } from 'src/app/components/chinh-sach-ho-tro/chinh-sach-ho-tro.service';
import { AlbumImageService } from 'src/app/components/album-image/album-image.service';
import { MeNuService } from 'src/app/components/menu/menu.service';
import { MenuChildrenService } from 'src/app/components/menu/menu-children/menu-children.service';
import { GopYService } from 'src/app/components/gop-y/gop-y.service';
import { LoaiTintucService } from 'src/app/components/loai-tin-tuc/loai-tin-tuc.service';
import { TuyenDungService } from 'src/app/components/tuyen-dung/tuyen-dung.service';

@Component({
  selector: 'app-base',
  templateUrl: './base.component.html',
  styleUrls: ['./base.component.scss']
})
export class BaseComponent {
  public chart: any;
  router: Router;
  spinner: NgxSpinnerService;
  toastr: ToastrService;
  modal: NzModalService;
  isFilter: any = true;
  dataGetList: any;
  listOfCurrentPageData: readonly Data[] = [];
  setOfCheckedId = new Set<number>();
  titleModal: string = "";
  dataMoTa: any = 'Mô tả phòng';
  checkInsert: boolean = false;
  ID: any;
  menu_parent_id: any;
  Ma_loai_phong_ft: any;
  Ma_loai_phong: any;
  Ten_loai_phong: any;
  Gia_phong: any;
  Mo_ta: any;
  Dang_o: any;
  MaLP: any;
  ma_loai_phong_search: any = '';
  ten_loai_phong_search: any = '';
  ID_phong: any;
  dataRomAll: any = [];
  check: any;
  selectedValue = null;
  DSCoSo: any;
  DSToaNha: any;
  DSToaNha2: any;
  DSToaNha3: any;
  DSLoaiPhong: any;
  ID_toa_nha_ft: any;
  Ten_phong_ft: any;
  loai_phong_ft: any;
  ID_co_so_ft: any;
  Tang_ft: any;
  dataCoSo: any;
  building_search: any;
  type_room_search: any;
  floor_search: any;
  room_name_search: any;
  isCheckAll: any = false;
  from_date: any = null;
  to_date: any = null;
  status_approve: any = null;
  status_registered: any = null;
  list_group: any;
  isRegisterModal: boolean = false;
  registerForm!: UntypedFormGroup;
  messageService!: NzMessageService;
  checkRule: any = false;
  listRoomCategory: any;
  slot_search: any;
  listRoomCategoryRegister: any = [];
  status_booking: any;
  full_name_search: any;
  listSortRoom: any;
  isDisplaySort: any;
  listRoomRegister: any;
  listBuilding: any;
  id_building: any;
  listFloor: any;
  listRoom: any;
  total_room: any;
  total_room_booking: any;
  total_room_empty: any;
  listCampus: any;
  listBuilding2: any;
  dataStatistic: any;
  arr_all: any;
  name_building: any = '';
  listBuildingFilter: any;
  dataBookRoom: any;
  category_room_search: any;
  isSwapModal: any = false;
  isExtendModal: any = false;
  isExpelModal: any = false;
  out_date: any = false;
  dataEdit: any;
  listRegisterDetail: any;
  listBuildingByRoom: any;
  listRoomCategoryByRoom: any;
  swap_date: any;
  building_swap: any;
  room_category_swap: any;
  floor_swap: any;
  room_swap: any;
  isOnlyRoomCategory: any;
  listMember: any;
  room_category_selected: any;
  room_selected: any;
  slot_selected: any;
  listTest: any = [];
  isEditMember: any = false;
  listMemberInsert: any;
  countMale: any = 0;
  countFemale: any = 0;
  isUploadModal: any = false;
  ID_register_guest: any;
  ID_group: any;
  phone_search: any;
  extend_date: any;
  listRoomFilter: any;
  dataRoomPlan: any;
  listDayOfWeek: any;
  datesOfWeek: Date[] = [];
  datesOfMonth: Date[] = [];
  effect = 'scrollx';

  slideAnhService: SlideAnhService;
  baseService: BaseService;
  lienKetService: LienKetService;
  tinTucService: TinTucService;
  thuTucHanhChinhService: ThuTucHanhChinhService;
  chinhSachHoTroService: ChinhSachHoTroService;
  albumImageService: AlbumImageService;
  menuService: MeNuService;
  menuChildrenService: MenuChildrenService;
  gopYService: GopYService;
  loaiTintucService: LoaiTintucService;
  tuyenDungService: TuyenDungService;

  constructor() {
    this.router = AppInjector.get(Router);
    this.spinner = AppInjector.get(NgxSpinnerService);
    this.toastr = AppInjector.get(ToastrService);
    this.modal = AppInjector.get(NzModalService);
    this.messageService = AppInjector.get(NzMessageService);
    this.slideAnhService = AppInjector.get(SlideAnhService);
    this.baseService = AppInjector.get(BaseService);
    this.lienKetService = AppInjector.get(LienKetService);
    this.tinTucService = AppInjector.get(TinTucService);
    this.thuTucHanhChinhService = AppInjector.get(ThuTucHanhChinhService);
    this.chinhSachHoTroService = AppInjector.get(ChinhSachHoTroService);
    this.albumImageService = AppInjector.get(AlbumImageService);
    this.menuService = AppInjector.get(MeNuService);
    this.menuChildrenService = AppInjector.get(MenuChildrenService);
    this.gopYService = AppInjector.get(GopYService);
    this.loaiTintucService = AppInjector.get(LoaiTintucService);
    this.tuyenDungService = AppInjector.get(TuyenDungService);
  }

  listSlideAnh: any;
  listMenuParent: any;
  listNews: any;
  recentNew: any;
  listLienKet: any;
  listTinTuc: any;
  listThuTucHanhChinh: any;
  listchinhSachHoTro: any;
  listalbumImage: any;
  listalMenu: any;
  listalMenuChildren: any;
  listalGopY: any;
  listLoaiTinTuc: any;
  listNewsNotify: any;
  listalTuyenDung: any;

  listNewByType: any
  async getListData() {
    this.slideAnhService.getListAll(await this.getToken()).subscribe(
      async (res) => {
        this.listSlideAnh = res.data;
        this.baseService.getListMenuParent(await this.getToken()).subscribe(
          async (res) => {
            this.listMenuParent = res.data;
            this.baseService.getListNew(await this.getToken()).subscribe(
              async (res) => {
                this.listNews = res.data.filter((x: any) => x.status == 1);
                this.recentNew = this.listNews[0];
                this.listNewsNotify = res.data.filter((x: any) => x.type == 'TB');
                this.baseService.getAllNewByType(await this.getToken()).subscribe(
                  (res) => {
                    this.listNewByType = res.data.filter((x: any) => x.list_new.length > 0);
                  }
                );
              }
            );
          }
        );
      }
    );
  }
  async getListDataLienKet() {
    this.lienKetService.getListAll(await this.getToken()).subscribe(
      (res) => {
        this.listLienKet = res.data;
      }
    );
  }
  async getListDataTinTuc() {
    this.tinTucService.getListAll(await this.getToken()).subscribe(
      (res) => {
        this.listTinTuc = res.data;
        console.log(this.listTinTuc);
      }
    );
  }
  async getListDatalistThuTucHanhChinh() {
    this.thuTucHanhChinhService.getListAll(await this.getToken()).subscribe(
      (res) => {
        this.listThuTucHanhChinh = res.data;
      }
    );
  }
  async getListDatalistalbumImage() {
    this.albumImageService.getListAll(await this.getToken()).subscribe(
      (res) => {
        this.listalbumImage = res.data;
      }
    );
  }
  async getListDatalistchinhSachHoTro() {
    this.chinhSachHoTroService.getListAll(await this.getToken()).subscribe(
      (res) => {
        this.listchinhSachHoTro = res.data;
      }
    );
  }
  async getListDatalistMenu() {
    this.menuService.getListAll(await this.getToken()).subscribe(
      (res) => {
        this.listalMenu = res.data;
      }
    );
  }
  async getListDatalistMenuChildren(menu_parent_id: any) {
    this.menuChildrenService.getListAll(menu_parent_id, await this.getToken()).subscribe(
      (res) => {
        this.listalMenuChildren = res.data;
      }
    );
  }
  async getListDatalistGopY() {
    this.gopYService.getListAll(await this.getToken()).subscribe(
      (res) => {
        this.listalGopY = res.data;
      }
    );
  }

  listNewsTypeHome: any;
  async getListDatalistLoaiTinTuc() {
    this.loaiTintucService.getListAll(await this.getToken()).subscribe(
      (res) => {
        this.listLoaiTinTuc = res.data;
        this.listNewsTypeHome = res.data.filter((x: any) => x != 'TB');
      }
    );
  }
  async getListDatalistTuyenDung() {
    this.tuyenDungService.getListAll(await this.getToken()).subscribe(
      (res) => {
        this.listalTuyenDung = res.data;
      }
    );
  }

  currentPage: any = 1;
  arrNumberPage: any = [];
  arrNumberPage_chil: any = [];
  numberPage: any;
  page: any = 1;
  pageSize: any = 10;
  pageSizes: any = [10, 20, 50, 100, 200, 500, 1000];
  dataTable: any;
  getNull = false;
  totalItem!: number;
  totalItemFilter: any;
  isDisplay: boolean = true;
  submitted = false;
  closeResult!: string;
  dataPopup: any = {};
  com!: common;
  Token: any;
  count: any = 0;
  isDisplayAddModal: boolean = false;
  EditModal: boolean = false;
  isDisplayEditModal: boolean = false;
  isDisplayDelete: boolean = false;
  addForm!: UntypedFormGroup;
  memberForm!: UntypedFormGroup;
  searhForm!: UntypedFormGroup;
  eyeForm!: UntypedFormGroup;
  isDetail: any = false;
  isGuest: any = false;
  checked = false;
  loading = false;
  indeterminate = false;
  dateRange!: [Date, Date];
  ID_member: any;
  isDisplayDeleteMember: any = false;

  openDeleteModal(id: any) {
    this.ID = id;
    this.isDisplayDelete = true;
  }

  openDeleteMemberModal(id: any) {
    this.ID_member = id;
    this.isDisplayDeleteMember = true;
  }

  onTableDataChange(event: any) {
    this.page = event;
  }

  buttonFilter() {
    this.isDisplay = !this.isDisplay;
  }

  responseResult(res: ResponseBase) {
    if (res.Status == 1) {
      this.toastr.success(res.Message);
    }
    else {
      this.toastr.warning(res.Message);
    }
  }

  createNumberPage(totalItem: any, pageSize: any) {
    let numberPage = 0;
    let arrNumberPage = [];
    if (totalItem % pageSize == 0) {
      numberPage = Math.floor(totalItem / pageSize);
    } else {
      numberPage = Math.floor(totalItem / pageSize) + 1;
    }
    for (var i = 1; i <= numberPage; i++) {
      arrNumberPage.push(i);
    }
    let arrNumberPage_chil = [];
    if (arrNumberPage.length > 4) {
      for (var i = 1; i <= 4; i++) {
        arrNumberPage_chil.push(i);
      }
    } else {
      arrNumberPage_chil = arrNumberPage;
    }
    return {
      numberPage: numberPage,
      arrNumberPage_chil: arrNumberPage_chil,
    };
  }

  handlePageChange(event: any) {
    if (event == 'pre') {
      this.page = this.page - 1;
    } else if (event == 'next') {
      this.page = this.page + 1;
    } else {
      this.page = event;
      this.arrNumberPage_chil = [];
      for (var i = event - 3; i <= event + 3; i++) {
        if (i > 0 && i <= this.numberPage) {
          this.arrNumberPage_chil.push(i);
        }
      }
    }
  }

  getStringId(m: any) {
    var rs = '';
    for (var k = 0; k < m.length; k++) {
      if (k == 0) {
        rs += m[k];
      } else {
        rs += ',' + m[k];
      }
    }
    return rs;
  }

  remove_sign(str: string) {
    str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, 'a');
    str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, 'e');
    str = str.replace(/ì|í|ị|ỉ|ĩ|ị/g, 'i');
    str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, 'o');
    str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, 'u');
    str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, 'y');
    str = str.replace(/đ/g, 'd');
    str = str.replace(/À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ/g, 'A');
    str = str.replace(/È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ/g, 'E');
    str = str.replace(/Ì|Í|Ị|Ỉ|Ĩ/g, 'I');
    str = str.replace(/Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ/g, 'O');
    str = str.replace(/Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ/g, 'U');
    str = str.replace(/Ỳ|Ý|Ỵ|Ỷ|Ỹ/g, 'Y');
    str = str.replace(/Đ/g, 'D');
    str = str.replace(/\u0300|\u0301|\u0303|\u0309|\u0323/g, ''); // huyền, sắc, hỏi, ngã, nặng
    str = str.replace(/\u02C6|\u0306|\u031B/g, ''); // mũ â (ê), mũ ă, mũ ơ (ư)
    return str;
  }

  async getInfor(): Promise<any> {
    let infor: any | null;
    this.com = new common(this.router);
    this.com.CheckLogin();
    infor = this.com.getUserinfo();
    return await infor;
  }

  async getToken() {
    let token = (await this.getInfor()).token;
    return token.length > 0 ? token : null;
  }

  async sortElementByFeild(listAray: [], field: []) {
    _.sortBy(listAray, field);
    return listAray;
  }

  compareString(str1: any, str2: any) {
    if (this.remove_sign(str1.toString()).trim().includes(this.remove_sign(str2.toString().trim()))) return true;
    return false;
  }

  handleCancel() {
    this.modal.closeAll()
  }

  reload() {
    window.location.reload();
  }

  updateCheckedSet(id: number, checked: boolean): void {
    if (checked) {
      this.setOfCheckedId.add(id);
    } else {
      this.setOfCheckedId.delete(id);
    }
  }

  onCurrentPageDataChange(listOfCurrentPageData: readonly Data[]): void {
    listOfCurrentPageData = this.dataTable ?? [];
    this.listOfCurrentPageData = listOfCurrentPageData;
    this.refreshCheckedStatus();
  }

  refreshCheckedStatus(): void {
    const listOfEnabledData = this.listOfCurrentPageData.filter(({ disabled }) => !disabled);
    this.checked = listOfEnabledData.every(({ id }) => this.setOfCheckedId.has(id));
    this.indeterminate = listOfEnabledData.some(({ id }) => this.setOfCheckedId.has(id)) && !this.checked;
  }

  onItemChecked(id: number, checked: boolean): void {
    this.updateCheckedSet(id, checked);
    this.refreshCheckedStatus();
  }

  onAllChecked(checked: boolean, key: any): void {
    this.listOfCurrentPageData
      .filter(({ disabled }) => !disabled)
      .forEach((el: any) => {
        this.updateCheckedSet(el[key], checked)
      });
    this.refreshCheckedStatus();
  }

  cosochange() {
    let ID_coso = this.addForm.value.ID_Co_So
    if (ID_coso == '') {
      this.DSToaNha2 = this.DSToaNha3
    } else {
      this.DSToaNha2 = this.DSToaNha3.filter(function (el: any) {
        return el.ID_CoSo == ID_coso;
      });
    }
  }

  onChangeFromDate(event: any) {
    this.from_date = event;
  }

  onChangeToDate(event: any) {
    this.to_date = event;
  }

  onChangeExtendDate(event: any) {
    this.extend_date = event;
  }

  onChangeOutDate(event: any) {
    this.out_date = event;
  }

  onChangeSwapDate(event: any) {
    this.swap_date = event;
  }

  handleCancelMember() {
    this.isEditMember = false;
  }

  openUploadModal(data: any) {
    this.titleModal = 'Import danh sách';
    this.isUploadModal = true;
    this.ID_group = data.ID_doan_khach;
    this.ID_register_guest = data.ID_dang_ky_khach
  }

  getListDayOfWeek() {
    let currentDate = new Date();
    let currentDay = currentDate.getDay();
    let startDate = new Date(currentDate);
    startDate.setDate(currentDate.getDate() - currentDay);
    for (let i = 0; i < 7; i++) {
      const date = new Date(startDate);
      date.setDate(startDate.getDate() + i);
      this.datesOfWeek.push(date);
    }
    this.from_date = _.first(this.datesOfWeek)?.toLocaleDateString('en-US');
    this.to_date = _.last(this.datesOfWeek)?.toLocaleDateString('en-US');
    this.dateRange = [new Date(this.from_date), new Date(this.to_date)];
  }

  getListDayOfMonth() {
    let currentDate = new Date();
    let year = currentDate.getFullYear();
    let month = currentDate.getMonth();
    let firstDayOfMonth = new Date(year, month, 1);
    let lastDayOfMonth = new Date(year, month + 1, 0).getDate();
    for (let day = 1; day <= lastDayOfMonth; day++) {
      const date = new Date(year, month, day);
      this.datesOfMonth.push(date);
    }
    this.from_date = _.first(this.datesOfMonth)?.toLocaleDateString('en-US');
    this.to_date = _.last(this.datesOfMonth)?.toLocaleDateString('en-US');
    this.dateRange = [new Date(this.from_date), new Date(this.to_date)];
  }

  onChangeDateRange(event: any) {
    console.log(event);
  }

  renderSubString(str: String) {
    if (str?.length > 100) {
      return str?.substring(0, 100) + '...';
    }
    return str;
  }
}
