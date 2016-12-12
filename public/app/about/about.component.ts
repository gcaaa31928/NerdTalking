import {Component, OnInit} from '@angular/core';
import {AboutService} from  './about.service'
@Component({
    selector: 'about',
    templateUrl: './app/about/about.html',
    styleUrls: ['./app/about/about.css']
})

export class AboutComponent implements OnInit {
    constructor(private aboutService: AboutService) {
    }

    lastCommit: {};

    ngOnInit() {
        this.aboutService.getLastCommits()
            .then(data => {
                this.lastCommit = data;
                console.log(this.lastCommit);
            });
    }

}