import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { EnviromentService } from '../enviroment.service';

@Injectable({
  providedIn: 'root'
})
export class UsersService {

  constructor(private http: HttpClient, private url: EnviromentService) { }
  getAll() {
    return this.http.get(this.url.urlAddress + "users/", {}).toPromise()
  }
}
