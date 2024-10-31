import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { NgbModal, NgbModalOptions } from '@ng-bootstrap/ng-bootstrap';
import { FormControl } from '@angular/forms';

// Interface สำหรับ Company
interface Company {
  companytryId?: number;
  avatar: string;
  name: string;
  company: string;
  status: string;
  dueDate: string;
  targetAchievement: number;
}

@Component({
  selector: 'app-company',
  templateUrl: './company.component.html',
  styleUrls: []
})
export class CompanyComponent implements OnInit {
  heading = 'Regular Tables';
  subheading = 'Tables are the backbone of almost all web applications.';
  icon = 'pe-7s-drawer icon-gradient bg-happy-itmeo';

  avatar = new FormControl('');
  name = new FormControl('');
  company = new FormControl('');
  status = new FormControl('');
  dueDate = new FormControl('');
  targetAchievement = new FormControl(0);
  companytryId = new FormControl(0); // เปลี่ยนเป็น companytryId

  companies: Company[] = [];

  constructor(private httpClient: HttpClient, private modalService: NgbModal) {
    this.getData();
  }

  ngOnInit() {}

  getData() {
    this.httpClient.get<Company[]>('http://lab-v364143152gcmruacth-8080.dev2go.online/api/company/findAll')
      .subscribe((res) => {
        this.companies = res; 
        console.log(res);
      });
  }

  save() {
    const company: Company = {
      companytryId: this.companytryId.value, // เปลี่ยนเป็น companytryId
      avatar: this.avatar.value,
      name: this.name.value,
      company: this.company.value,
      status: this.status.value,
      dueDate: this.dueDate.value,
      targetAchievement: this.targetAchievement.value
    };

    this.httpClient.post('http://lab-v364143152gcmruacth-8080.dev2go.online/api/company/save', company)
      .subscribe(() => {
        this.getData();
      }, (error) => {
        console.error('Error saving company:', error);
      });
  }

  delete(companytryId: number) {
    this.httpClient.get('http://lab-v364143152gcmruacth-8080.dev2go.online/api/company/delete?companytryId=' + companytryId)
      .subscribe(() => {
        this.getData();
      });
  }

  open(content: any, avatar: string = '', name: string = '', company: string = '', status: string = '', dueDate: string = '', targetAchievement: number = 0, companytryId: number = 0) {
    this.avatar.setValue(avatar);
    this.name.setValue(name);
    this.company.setValue(company);
    this.status.setValue(status);
    this.dueDate.setValue(dueDate);
    this.targetAchievement.setValue(targetAchievement);
    this.companytryId.setValue(companytryId);

    const ngbModalOptions: NgbModalOptions = {
      backdrop: 'static',
      keyboard: false
    };

    this.modalService.open(content, ngbModalOptions).result.then((result) => {
      // handle result
    }, (reason) => {
      // handle reason
    });
  }
}
