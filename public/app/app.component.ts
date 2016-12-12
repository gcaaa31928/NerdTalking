import {Component, AfterViewInit} from '@angular/core';
import {IssueComponent}from './issue/issue.component'
import {AboutComponent} from "./about/about.component";
declare var skrollr: any;
@Component({
    selector: 'my-app',
    templateUrl: './app/app.html',
    styleUrls: ['./app/app.style.css']
})
export class AppComponent implements AfterViewInit {
    issues = [
        {
            id: 2,
            date: "2016/09/14",
            articles: [
                {
                    id: 0,
                    title: "title1",
                    desc: "desc",
                    tags: [
                        "Learning",
                        "AI"
                    ]
                },
                {
                    id: 1,
                    title: "title2",
                    desc: "desc",
                    tags: [
                        "Machine Learning",
                        "Software Architecture"
                    ]
                }
            ]
        },
        {
            id: 1,
            date: "2016/09/09",
            articles: [
                {
                    id: 2,
                    title: "title3",
                    desc: "desc",
                    tags: [
                        "Software Testing"
                    ]
                },
                {
                    id: 3,
                    title: "title4",
                    tags: [
                        "Current Trends"
                    ]
                }
            ]
        },
        {
            id: 1,
            date: "2016/09/09",
            articles: [
                {
                    id: 2,
                    title: "title3",
                    desc: "desc",
                    tags: [
                        "Software Testing"
                    ]
                },
                {
                    id: 3,
                    title: "title4",
                    tags: [
                        "Current Trends"
                    ]
                }
            ]
        },
        {
            id: 1,
            date: "2016/09/09",
            articles: [
                {
                    id: 2,
                    title: "title3",
                    desc: "desc",
                    tags: [
                        "Software Testing"
                    ]
                },
                {
                    id: 3,
                    title: "title4",
                    tags: [
                        "Current Trends"
                    ]
                }
            ]
        },
        {
            id: 1,
            date: "2016/09/09",
            articles: [
                {
                    id: 2,
                    title: "title3",
                    desc: "desc",
                    tags: [
                        "Software Testing"
                    ]
                },
                {
                    id: 3,
                    title: "title4",
                    tags: [
                        "Current Trends"
                    ]
                }
            ]
        },
        {
            id: 1,
            date: "2016/09/09",
            articles: [
                {
                    id: 2,
                    title: "title3",
                    desc: "desc",
                    tags: [
                        "Software Testing"
                    ]
                },
                {
                    id: 3,
                    title: "title4",
                    tags: [
                        "Current Trends"
                    ]
                }
            ]
        },
        {
            id: 1,
            date: "2016/09/09",
            articles: [
                {
                    id: 2,
                    title: "title3",
                    desc: "desc",
                    tags: [
                        "Software Testing"
                    ]
                },
                {
                    id: 3,
                    title: "title4",
                    tags: [
                        "Current Trends"
                    ]
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