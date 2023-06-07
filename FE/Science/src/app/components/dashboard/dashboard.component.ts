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
    this.getListDataDashboard()
  }
  BD1: any = 1;
  BD2: any = 1;
  dataAlbumImage:any
  dataComment:any
  dataLoaiTinTuc:any
  dataMenu:any
  dataNews:any
  dataPolicy:any
  dataSlideImage:any
  dataUrlLink:any
  createChart(){
  
    this.chart = new Chart("MyChart", {
      type: 'bar', //this denotes tha type of chart

      data: {// values on X-Axis
        labels: ['Tháng 1','Tháng 2','Tháng 3' ], 
	       datasets: [
          {
            label: "Tin tức",
            data: ['20','30', '1'],
            backgroundColor: '#1890ff'
          },
        ]
      },
      options: {
        aspectRatio:2.5
      }
      
    });
  }
  async getListDataDashboard() {
    this.dashBoadService.getListAll(await this.getToken()).subscribe(
      (res) => {
        this.listaldashboard = res.data;
        this.dataAlbumImage=this.listaldashboard.AlbumImage
        this.dataComment=this.listaldashboard.Comment
        this.dataLoaiTinTuc=this.listaldashboard.LoaiTinTuc
        this.dataMenu=this.listaldashboard.Menu
        this.dataNews=this.listaldashboard.News
        this.dataPolicy=this.listaldashboard.Policy
        this.dataSlideImage=this.listaldashboard.SlideImage
        this.dataUrlLink=this.listaldashboard.UrlLink
      }
    );
  }
}
