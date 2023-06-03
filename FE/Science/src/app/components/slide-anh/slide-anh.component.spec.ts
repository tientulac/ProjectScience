import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SlideAnhComponent } from './slide-anh.component';

describe('SlideAnhComponent', () => {
  let component: SlideAnhComponent;
  let fixture: ComponentFixture<SlideAnhComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SlideAnhComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(SlideAnhComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
