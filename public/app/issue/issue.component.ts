import {Component, Input, AfterContentInit} from '@angular/core';

@Component({
    selector: 'issue',
    templateUrl: './app/issue/issue.html',
    styleUrls: ['./app/issue/issue.css']
})

export class IssueComponent {
    constructor() {
    }

    @Input() data: {};

    ngAfterContentInit() {
        console.log(this.data);
    }
}