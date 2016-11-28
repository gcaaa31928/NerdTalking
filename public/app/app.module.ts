import {NgModule}      from '@angular/core';
import {BrowserModule} from '@angular/platform-browser';

import {AppComponent}  from './app.component';
import {RouterModule, Routes} from "@angular/router";
import {DashComponent} from './dash/dash.component';

const appRoutes: Routes = [
    {path: 'dash', component: DashComponent}
];


@NgModule({
    imports: [BrowserModule,
        RouterModule.forRoot(appRoutes, {useHash: true})],
    declarations: [
        AppComponent,
        DashComponent],
    bootstrap: [AppComponent]
})
export class AppModule {
}