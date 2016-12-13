import {Component, OnInit} from "@angular/core";
import {Params, ActivatedRoute} from "@angular/router";
import {IssueService} from "../services/issue.service";

@Component({
    selector: 'issue-detail',
    templateUrl: './app/issue-detail/issue-detail.html',
    styleUrls: ['./app/issue-detail/issue-detail.css']
})

export class IssueDetailComponent implements OnInit {

    constructor(private route: ActivatedRoute,
                private issueService: IssueService) {
    }

    data: {};

    ngOnInit() {
        this.route.params.forEach((params: Params) => {
            if (params['id'] !== undefined) {
                let id = +params['id'];
                this.issueService.getIssue(id)
                    .then((data)=> {
                        this.data = data;
                        console.log(data);
                    })

            }
        })
    }


}