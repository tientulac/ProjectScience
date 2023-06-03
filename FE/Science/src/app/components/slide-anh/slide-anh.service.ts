import { Injectable, Inject } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { AppConfig, AppConfiguration } from 'src/configuration';
import { Router } from '@angular/router';

@Injectable({
    providedIn: 'root',
})
export class SlideAnhService {
    constructor(
        @Inject(AppConfig) private readonly appConfig: AppConfiguration,
        private router: Router,
        private http: HttpClient
    ) { }


    getListAll(token: any): Observable<any> {
        return this.http
            .get<any>(this.appConfig.API + 'SlideImage', {
                headers: new HttpHeaders().set('Authorization', `Bearer ${token}`),
            }).pipe(map((z) => { return z; }));
    }

    save(req: any, token: any): Observable<any> {
        return this.http
            .post<any>(this.appConfig.API + 'SlideImage', req, {
                headers: new HttpHeaders().set('Authorization', `Bearer ${token}`),
            }).pipe(map((z) => { return z; }));
    }

    delete(id: any, token: any): Observable<any> {
        return this.http
            .delete<any>(this.appConfig.API + 'SlideImage?id=' + id, {
                headers: new HttpHeaders().set('Authorization', `Bearer ${token}`),
            }).pipe(map((z) => { return z; }));
    }
}
