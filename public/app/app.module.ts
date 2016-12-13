import {NgModule}      from '@angular/core';
import {BrowserModule} from '@angular/platform-browser';
import {HttpModule} from '@angular/http';

import {AppComponent}  from './app.component';
import {RouterModule, Routes} from "@angular/router";
import {IssueComponent} from "./issue/issue.component";
import {AboutComponent} from "./about/about.component";
import {AboutService} from './services/about.service';
import {DashComponent} from "./dash/dash.component";
import {IssueDetailComponent} from "./issue-detail/issue-detail.component";
import {IssueService} from "./services/issue.service";

const appRoutes: Routes = [
    {
        path: '',
        redirectTo: 'home',
        pathMatch: 'full'
    },
    {
        path: 'home', component: DashComponent
    },
    {
        path:'issues/:id', component: IssueDetailComponent
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
        IssueDetailComponent,
        AboutComponent
    ],
    providers: [
        AboutService,
        IssueService
    ],
    bootstrap: [AppComponent]
})
export class AppModule {
}