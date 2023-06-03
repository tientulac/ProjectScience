import { NgxSpinnerModule } from 'ngx-spinner';
import { CommonModule } from "@angular/common";
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';

@NgModule({
    exports: [
        HttpClientModule,
        ReactiveFormsModule,
        NgxSpinnerModule,
        FormsModule,
        CommonModule,
        NgxSpinnerModule,
        //Ng2SearchPipeModule
    ],
    declarations: [
    ],
})
export class UtilityModule { }
