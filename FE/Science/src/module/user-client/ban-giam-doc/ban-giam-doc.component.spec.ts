import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BanGiamDocComponent } from './ban-giam-doc.component';

describe('BanGiamDocComponent', () => {
  let component: BanGiamDocComponent;
  let fixture: ComponentFixture<BanGiamDocComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ BanGiamDocComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(BanGiamDocComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
