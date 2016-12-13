import {NgModule}      from '@angular/core';
import {BrowserModule} from '@angular/platform-browser';
import {HttpModule} from '@angular/http';

import {AppComponent}  from './app.component';
import {RouterModule, Routes} from "@angular/router";
import {IssueComponent} from "./issue/issue.component";
import {AboutComponent} from "./about/about.component";
import {AboutService} from './about/about.service';
import {DashComponent} from "./dash/dash.component";

const appRoutes: Routes = [
    {
        path: '',
        redirectTo: 'home',
        pathMatch: 'full'
    },
    {
        path: 'home', component: DashComponent
    }
];


@NgModule({
    imports: [
        BrowserModule,
        RouterModule.forRoot(appRoutes, {useHash: true}),
        HttpModule
    ],
    declarations: [
        AppComponent,
        DashComponent,
        IssueComponent,
        AboutComponent
    ],
    providers: [
        AboutService
    ],
    bootstrap: [AppComponent]
})
export class AppModule {
}