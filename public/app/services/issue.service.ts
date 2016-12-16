import {Injectable} from "@angular/core";
import {Http} from "@angular/http";

@Injectable()
export class IssueService {
    private issuesUrl = '/api/issues';
    private latestIssueUrl = '/api/issues/latest';
    constructor(private http: Http) {}

    getIssue(id: number): Promise<{}> {
        return this.http.get(`${this.issuesUrl}/${id}`)
            .toPromise()
            .then(response => {
                return response.json().data;
            })
            .catch(this.handleError);

    }

    getLatestIssue(): Promise<{}> {
        return this.http.get(`${this.latestIssueUrl}`)
            .toPromise()
            .then(response => {
                return response.json().data;
            })
            .catch(this.handleError)
    }

    private handleError(error: any): Promise<any> {
        console.error('An error occurred', error);
        return Promise.reject(error.message || error);
    }
}