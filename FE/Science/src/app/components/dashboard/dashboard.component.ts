import { Component, OnInit } from '@angular/core';
import Chart from 'chart.js/auto'
import { BaseComponent } from 'src/app/_core/base/base.component';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss'],
})
export class DashboardComponent extends BaseComponent implements OnInit{
  ngOnInit(): void {
    this.createChart()
  }
  BD1: any = 1;
  BD2: any = 1;

  createChart(){
  
    this.chart = new Chart("MyChart", {
      type: 'bar', //this denotes tha type of chart

      data: {// values on X-Axis
        labels: ['Tòa A','Tòa B','Tòa C' ], 
	       datasets: [
          {
            label: "Đã ở",
            data: ['20','30', '1'],
            backgroundColor: '#1890ff'
          },
          {
            label: "Đang trống",
            data: ['17', '10', '5'],
            backgroundColor: '#3a5f64'
          }  
        ]
      },
      options: {
        aspectRatio:2.5
      }
      
    });
  }
}
