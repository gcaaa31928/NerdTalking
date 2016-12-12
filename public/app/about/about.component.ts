import {Component, OnInit} from '@angular/core';
import {AboutService} from  './about.service'
declare var moment: any;
@Component({
    selector: 'about',
    templateUrl: './app/about/about.html',
    styleUrls: ['./app/about/about.css']
})

export class AboutComponent implements OnInit {
    constructor(private aboutService: AboutService) {
        this.lastCommit = {
            author: {
                date: null
            }
        }
    }

    lastCommit: {};

    ngOnInit() {
        this.aboutService.getLastCommits()
            .then(data => {
                console.log(data);
                this.lastCommit = data;
                this.lastCommit['author']['fromNow'] = moment(data['author']['date']).fromNow();
            });
    }

}