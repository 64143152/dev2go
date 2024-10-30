import { Component } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Component({
  selector: 'app-tab1',
  templateUrl: 'tab1.page.html',
  styleUrls: ['tab1.page.scss']
})
export class Tab1Page {


 
  constructor(private httpClient: HttpClient) {
    this.getData();
  }

  countries: any = [];
  getData(){
     this.httpClient.get('http://lab-v364143152gcmruacth-8080.dev2go.online/api/country/findAll').subscribe((res: any) => {
      this.countries = res;
      console.log(res);
    });
  }
 
}

