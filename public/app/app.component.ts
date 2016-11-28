import {Component, AfterViewInit} from '@angular/core';

declare var skrollr: any;
@Component({
    selector: 'my-app',
    templateUrl: './app/app.html',
    styleUrls: ['./app/app.style.css']
})
export class AppComponent implements AfterViewInit {
    name = 'Angular';

    constructor() {
    }

    ngAfterViewInit() {
        skrollr.init();

    }
}