import { HttpClientModule } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from 'src/app/_core/guard/auth.guard';
import { NonAuthGuard } from 'src/app/_core/guard/non-auth.guard';
import { DashboardComponent } from 'src/app/components/dashboard/dashboard.component';
import { SlideAnhComponent } from 'src/app/components/slide-anh/slide-anh.component';
import { TestComponent } from 'src/app/components/test/test.component';
import { MainComponent } from 'src/layout/main/main.component';
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
      }
    ],
  },
  {
    path: '',
    component: LoginComponent,
    canActivate: [NonAuthGuard],
  },
  { path: '**', redirectTo: '' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes, { useHash: true }), BrowserModule, HttpClientModule],
  exports: [RouterModule]
})
export class AppRoutingModule { }
