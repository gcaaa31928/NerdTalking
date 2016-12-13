import {Component} from "@angular/core";

@Component({
    selector: 'dash',
    templateUrl: './app/dash/dash.html',
    styleUrls: ['./app/dash/dash.css']
})

export class DashComponent {
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
    constructor(){}

}