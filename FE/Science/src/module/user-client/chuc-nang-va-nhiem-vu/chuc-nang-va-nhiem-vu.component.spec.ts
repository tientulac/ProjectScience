import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ChucNangVaNhiemVuComponent } from './chuc-nang-va-nhiem-vu.component';

describe('ChucNangVaNhiemVuComponent', () => {
  let component: ChucNangVaNhiemVuComponent;
  let fixture: ComponentFixture<ChucNangVaNhiemVuComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ChucNangVaNhiemVuComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ChucNangVaNhiemVuComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
