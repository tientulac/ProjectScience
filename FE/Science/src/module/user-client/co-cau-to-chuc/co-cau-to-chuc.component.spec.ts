import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CoCauToChucComponent } from './co-cau-to-chuc.component';

describe('CoCauToChucComponent', () => {
  let component: CoCauToChucComponent;
  let fixture: ComponentFixture<CoCauToChucComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CoCauToChucComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CoCauToChucComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
