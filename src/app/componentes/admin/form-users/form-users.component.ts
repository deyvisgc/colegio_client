import { Component, OnInit } from '@angular/core';
declare const $: any;
@Component({
  selector: 'app-form-users',
  templateUrl: './form-users.component.html',
  styleUrls: ['./form-users.component.scss']
})
export class FormUsersComponent implements OnInit {
  title = ''
  titleCursos = "a enseñar"
  constructor() { }

  ngOnInit() {
  }
  abrirModal(title) {
    const vm = this
    vm.title = title
    $("#users").modal("show")
  }

}
