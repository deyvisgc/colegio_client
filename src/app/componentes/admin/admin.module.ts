import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AdminRoutingModule } from './admin-routing.module';
import { UserComponent } from './user/user.component';
import { GradoComponent } from './grado/grado.component';
import { FormUsersComponent } from './form-users/form-users.component';
import { ElModule } from 'element-angular';
import 'element-angular/theme/index.css'

@NgModule({
  declarations: [UserComponent, GradoComponent, FormUsersComponent],
  imports: [
    CommonModule, 
    AdminRoutingModule,
    ElModule.forRoot(),
  ]
})
export class AdminModule { }
