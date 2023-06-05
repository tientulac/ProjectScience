import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LichSuVaPhatTrienComponent } from './lich-su-va-phat-trien.component';

describe('LichSuVaPhatTrienComponent', () => {
  let component: LichSuVaPhatTrienComponent;
  let fixture: ComponentFixture<LichSuVaPhatTrienComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LichSuVaPhatTrienComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(LichSuVaPhatTrienComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
