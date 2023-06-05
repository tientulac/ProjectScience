import { HttpClientModule } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from 'src/app/_core/guard/auth.guard';
import { NonAuthGuard } from 'src/app/_core/guard/non-auth.guard';
import { AlbumImageComponent } from 'src/app/components/album-image/album-image.component';
import { ChinhSachHoTroComponent } from 'src/app/components/chinh-sach-ho-tro/chinh-sach-ho-tro.component';
import { DashboardComponent } from 'src/app/components/dashboard/dashboard.component';
import { LienKetComponent } from 'src/app/components/lien-ket/lien-ket.component';
import { MenuComponent } from 'src/app/components/menu/menu.component';
import { SlideAnhComponent } from 'src/app/components/slide-anh/slide-anh.component';
import { TestComponent } from 'src/app/components/test/test.component';
import { ThuTucHanhChinhComponent } from 'src/app/components/thu-tuc-hanh-chinh/thu-tuc-hanh-chinh.component';
import { TinTucComponent } from 'src/app/components/tin-tuc/tin-tuc.component';
import { MainComponent } from 'src/layout/main/main.component';
import { HomePageComponent } from 'src/module/user-client/home-page/home-page.component';
import { TrangChuComponent } from 'src/module/user-client/trang-chu/trang-chu.component';
import { ChangePassComponent } from 'src/page/change-pass/change-pass.component';
import { LoginComponent } from 'src/page/login/login.component';
const routes: Routes = [
  {
    path: 'admin',
    component: MainComponent,
    children: [
      {
        path: '',
        component: DashboardComponent,
      },
      {
        path: 'slide-anh',
        component: SlideAnhComponent,
      },
      {
        path: 'lien-ket',
        component: LienKetComponent,
      },
      {
        path: 'tin-tuc',
        component: TinTucComponent,
      },
      
      {
        path: 'thu-tuc-hanh-chinh',
        component: ThuTucHanhChinhComponent,
      },
      {
        path: 'chinh-sach-ho-tro',
        component: ChinhSachHoTroComponent,
      },
      {
        path: 'album-anh',
        component: AlbumImageComponent,
      },  {
        path: 'menu',
        component: MenuComponent,
      }
    ],
  },
  {
    path: '',
    component: LoginComponent,
    canActivate: [NonAuthGuard],
  },
  {
    path: 'user',
    component: HomePageComponent,
    canActivate: [NonAuthGuard],
    children: [
      {
        path: 'trang-chu',
        component: TrangChuComponent,
      }
    ],
  },
  { path: '**', redirectTo: '' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes, { useHash: true }), BrowserModule, HttpClientModule],
  exports: [RouterModule]
})
export class AppRoutingModule { }
