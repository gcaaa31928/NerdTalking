import {NgModule}      from '@angular/core';
import {BrowserModule} from '@angular/platform-browser';

import {AppComponent}  from './app.component';
import {RouterModule, Routes} from "@angular/router";
import {IssueComponent} from "./issue/issue.component";

const appRoutes: Routes = [
    // {path: '/', component: AppComponent}
];


@NgModule({
    imports: [BrowserModule,
        RouterModule.forRoot(appRoutes, {useHash: true})],
    declarations: [
        AppComponent,
        IssueComponent
    ],
    bootstrap: [AppComponent]
})
export class AppModule {
}