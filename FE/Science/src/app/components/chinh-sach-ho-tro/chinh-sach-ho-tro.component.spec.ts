import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ChinhSachHoTroComponent } from './chinh-sach-ho-tro.component';

describe('ChinhSachHoTroComponent', () => {
  let component: ChinhSachHoTroComponent;
  let fixture: ComponentFixture<ChinhSachHoTroComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ChinhSachHoTroComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ChinhSachHoTroComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
