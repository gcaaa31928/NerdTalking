import {Component, Input, AfterContentInit} from '@angular/core';

@Component({
    selector: 'issue',
    templateUrl: './app/issue/issue.html',
    styleUrls: ['./app/issue/issue.css']
})

export class IssueComponent implements AfterContentInit{

    constructor() {
    }

    @Input() data: {};

    ngAfterContentInit() {
    }
}