import { Component, OnInit, ViewChild } from '@angular/core';
import { UsersService } from 'src/app/service/users/users.service';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.scss']
})
export class UserComponent implements OnInit {
  @ViewChild('formEstudiante', { static: true }) formEstudiante
  constructor(private userService: UsersService) { }

  ngOnInit() {
    this.userService.getAll();
  }
  getAll() {
    
  }
  abrirModalForm() {
    const vm = this
    vm.formEstudiante.abrirModal("Nuevo Cliente")
  }

}
