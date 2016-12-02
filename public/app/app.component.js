"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var core_1 = require('@angular/core');
var issue_component_1 = require('./issue/issue.component');
var AppComponent = (function () {
    function AppComponent() {
        this.issues = [
            {
                id: 1,
                date: 2016 / 09 / 09,
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
                date: 2016 / 09 / 14,
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
    }
    AppComponent.prototype.ngAfterViewInit = function () {
        skrollr.init();
    };
    AppComponent = __decorate([
        core_1.Component({
            selector: 'my-app',
            templateUrl: './app/app.html',
            directives: [issue_component_1.IssueComponent],
            styleUrls: ['./app/app.style.css']
        }), 
        __metadata('design:paramtypes', [])
    ], AppComponent);
    return AppComponent;
}());
exports.AppComponent = AppComponent;
//# sourceMappingURL=app.component.js.map