import {Injectable} from "@angular/core";
import {Http} from "@angular/http";

@Injectable()
export class IssueService {
    private issuesUrl = '/api/issues';

    constructor(private http: Http) {}

    getIssue(id: number): Promise<{}> {
        return this.http.get(`${this.issuesUrl}/${id}`)
            .toPromise()
            .then(response => {
                return response.json();
            })
            .catch(this.handleError);

    }

    private handleError(error: any): Promise<any> {
        console.error('An error occurred', error);
        return Promise.reject(error.message || error);
    }
}