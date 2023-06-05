import { AppRoutingModule } from '../route/app-routing.module';
import { AppComponent } from '../app/app.component';
import { NZ_I18N, vi_VN } from 'ng-zorro-antd/i18n';
import { en_US } from 'ng-zorro-antd/i18n';
import en from '@angular/common/locales/en';
import { HttpClientModule } from '@angular/common/http';
import { UtilityModule } from 'src/app/_core/ultility.module';
import { LoginComponent } from 'src/page/login/login.component';
import { HeaderComponent } from 'src/layout/header/header.component';
import { FooterComponent } from 'src/layout/footer/footer.component';
import { SideBarComponent } from 'src/layout/side-bar/side-bar.component';
import { MainComponent } from 'src/layout/main/main.component';
import { AccService } from 'src/service/acc.service';
import { AppService } from 'src/service/app.service';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { Injector, NgModule } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';
import { CommonNgZorroAntdModule } from './ng-zorro-antd.module';
import { ToastrModule } from 'ngx-toastr';
import {
  registerLocaleData,
  LocationStrategy,
  HashLocationStrategy,
  DatePipe,
  CommonModule,
} from '@angular/common';
import { BreadCrumbRouterComponent } from 'src/app/_core/bread-crumb-router/bread-crumb-router.component';
import { TestComponent } from 'src/app/components/test/test.component';
import { ChangePassComponent } from 'src/page/change-pass/change-pass.component';
import { UserDropdownMenuComponent } from 'src/layout/header/user-dropdown-menu/user-dropdown-menu.component';
import { CKEditorModule } from '@ckeditor/ckeditor5-angular';
import vi from '@angular/common/locales/vi';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { SlideAnhComponent } from 'src/app/components/slide-anh/slide-anh.component';
import { HomePageComponent } from './user-client/home-page/home-page.component';
import { UserHeaderComponent } from './user-client/layouts/user-header/user-header.component';
import { UserFooterComponent } from './user-client/layouts/user-footer/user-footer.component';
import { TrangChuComponent } from './user-client/trang-chu/trang-chu.component';
import { LienKetComponent } from 'src/app/components/lien-ket/lien-ket.component';
import { TinTucComponent } from 'src/app/components/tin-tuc/tin-tuc.component';
import { ThuTucHanhChinhComponent } from 'src/app/components/thu-tuc-hanh-chinh/thu-tuc-hanh-chinh.component';
import { ChinhSachHoTroComponent } from 'src/app/components/chinh-sach-ho-tro/chinh-sach-ho-tro.component';
import { AlbumImageComponent } from 'src/app/components/album-image/album-image.component';
import { MenuComponent } from 'src/app/components/menu/menu.component';
import { MenuChildrenComponentextends } from 'src/app/components/menu/menu-children/menu-children.component';
import { GopYComponentextends } from 'src/app/components/gop-y/gop-y.component';
import { LoaiTinTucComponentextends } from 'src/app/components/loai-tin-tuc/loai-tin-tuc.component';
import { TuyenDungComponentextends } from 'src/app/components/tuyen-dung/tuyen-dung.component';
import { LichSuVaPhatTrienComponent } from 'src/module/user-client/lich-su-va-phat-trien/lich-su-va-phat-trien.component';
import { ChucNangVaNhiemVuComponent } from './user-client/chuc-nang-va-nhiem-vu/chuc-nang-va-nhiem-vu.component';
import { BanGiamDocComponent } from './user-client/ban-giam-doc/ban-giam-doc.component';
import { CoCauToChucComponent } from './user-client/co-cau-to-chuc/co-cau-to-chuc.component';

registerLocaleData(vi);

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    ChangePassComponent,
    UserDropdownMenuComponent,
    HeaderComponent,
    FooterComponent,
    SideBarComponent,
    MainComponent,
    TestComponent,
    BreadCrumbRouterComponent,
    SlideAnhComponent,
    HomePageComponent,
    UserHeaderComponent,
    UserFooterComponent,
    TrangChuComponent,
    LienKetComponent,
    TinTucComponent,
    ThuTucHanhChinhComponent,
    ChinhSachHoTroComponent,
    AlbumImageComponent,
    MenuComponent,
    MenuChildrenComponentextends,
    GopYComponentextends,
    LoaiTinTucComponentextends,
    TuyenDungComponentextends,
    LichSuVaPhatTrienComponent,
    ChucNangVaNhiemVuComponent,
    BanGiamDocComponent,
    CoCauToChucComponent
  ],
  imports: [
    BrowserAnimationsModule,
    CKEditorModule,
    BrowserModule,
    AppRoutingModule,
    CommonNgZorroAntdModule,
    ToastrModule.forRoot({
      timeOut: 5000,
      positionClass: 'toast-top-center',
      preventDuplicates: true,
    }),
    UtilityModule
  ],
  providers: [
    { provide: NZ_I18N, useValue: vi_VN },
    AccService,
    AppService,
    CookieService,
    { provide: LocationStrategy, useClass: HashLocationStrategy }
  ],
  bootstrap: [AppComponent]
})

export class AppModule {
  constructor(private injector: Injector) {
    AppInjector = this.injector;
  }
}

export let AppInjector: Injector;

