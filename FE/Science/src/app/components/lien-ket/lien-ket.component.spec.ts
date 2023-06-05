import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LienKetComponent } from './lien-ket.component';

describe('LienKetComponent', () => {
  let component: LienKetComponent;
  let fixture: ComponentFixture<LienKetComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LienKetComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(LienKetComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
