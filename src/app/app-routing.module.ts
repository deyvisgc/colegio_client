import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';


const routes: Routes = [
  {
    path: "Dashbord",
    loadChildren: () => import('./componentes/dashbord/dashbord/dashbord.module').then(m => m.DashbordModule)
  },
  {
    path: "admin",
    loadChildren: () => import('./componentes/admin/admin.module').then(m => m.AdminModule)
  },

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
