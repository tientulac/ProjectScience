import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ThuTucHanhChinhComponent } from './thu-tuc-hanh-chinh.component';

describe('ThuTucHanhChinhComponent', () => {
  let component: ThuTucHanhChinhComponent;
  let fixture: ComponentFixture<ThuTucHanhChinhComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ThuTucHanhChinhComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ThuTucHanhChinhComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
