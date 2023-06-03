import { Injectable, Inject } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { AppConfig, AppConfiguration } from 'src/configuration';
import { Router } from '@angular/router';

@Injectable({
    providedIn: 'root',
})
export class BaseService {
    constructor(
        @Inject(AppConfig) private readonly appConfig: AppConfiguration,
        private router: Router,
        private http: HttpClient
    ) { }

    getListMenuParent(token: any): Observable<any> {
        return this.http
            .get<any>(this.appConfig.API + 'MenuParent', {
                headers: new HttpHeaders().set('Authorization', `Bearer ${token}`),
            }).pipe(map((z) => { return z; }));
    }

    getListNew(token: any): Observable<any> {
        return this.http
            .get<any>(this.appConfig.API + 'News', {
                headers: new HttpHeaders().set('Authorization', `Bearer ${token}`),
            }).pipe(map((z) => { return z; }));
    }
}
