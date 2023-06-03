
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable, Inject } from '@angular/core';
import { Router } from '@angular/router';
import { map, Observable } from 'rxjs';
import { AppConfig, AppConfiguration } from 'src/configuration';
@Injectable({
  providedIn: 'root',
})
export class Account {
  constructor(@Inject(AppConfig) private readonly appConfig: AppConfiguration,private router: Router,private http : HttpClient) {}
  Login(req: any) {
    return this.http
      .post<any>(this.appConfig.UniSystemAPI + 'Account/Login', req, {})
      .pipe(
        map((z) => {
          return z;
        })
      );
  }
  ChangePass(req: any, token: any): Observable<any> {
    return this.http
      .post<any>(this.appConfig.UniSystemAPI + 'Account/ChangePassword', req, {
        headers: new HttpHeaders().set('Authorization', `Bearer ${token}`),
      })
      .pipe(
        map((z) => {
          return z;
        })
      );
  }
 
  AutoLogin(Ma_sv: any, token : any): Observable<any> {
    return this.http
      .get<any>(this.appConfig.UniDormAPI + 'Account/Auto_Login?Ma_sv=' + Ma_sv, {
        headers: new HttpHeaders().set('Authorization', `Bearer ${token}`),
      })
      .pipe(
        map((z) => {
          return z;
        })
      );
  }
}
