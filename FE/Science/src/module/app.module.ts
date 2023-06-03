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
    SlideAnhComponent
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
    {provide: LocationStrategy, useClass: HashLocationStrategy}
  ],
  bootstrap: [AppComponent]
})

export class AppModule {
  constructor(private injector: Injector) {
    AppInjector = this.injector;
  }
}

export let AppInjector: Injector;

