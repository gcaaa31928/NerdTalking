import {Component, AfterViewInit} from '@angular/core';
import {IssueComponent}from './issue/issue.component'
declare var skrollr: any;
@Component({
    selector: 'my-app',
    templateUrl: './app/app.html',
    directives: [IssueComponent],
    styleUrls: ['./app/app.style.css']
})
export class AppComponent implements AfterViewInit {
    issues = [
        {
            id: 1,
            date: 2016/09/09,
            article: [
                {
                    id: 0,
                    name: "title1",
                    desc: "desc"
                },
                {
                    id: 1,
                    name: "title2",
                    desc: "desc"
                }
            ]
        },
        {
            id: 2,
            date: 2016/09/14,
            article: [
                {
                    id: 2,
                    name: "title3",
                    desc: "desc"
                },
                {
                    id: 3,
                    name: "title4",
                    desc: "desc"
                }
            ]
        }
    ];

    constructor() {
    }

    ngAfterViewInit() {
        skrollr.init();
    }
}