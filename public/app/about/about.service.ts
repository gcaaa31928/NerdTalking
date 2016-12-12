import {Injectable} from "@angular/core";
import {Http} from "@angular/http";
import 'rxjs/add/operator/toPromise';

@Injectable()
export class AboutService {
    private repoCommits = 'https://api.github.com/repos/gcaaa31928/NerdTalking/commits';

    constructor(private http: Http) {
    }


    getLastCommits(): Promise<{}> {
        return this.http.get(this.repoCommits)
            .toPromise()
            .then(response => {
                return response.json()[0]['commit'];
            })
            .catch(this.handleError);

    }

    private handleError(error: any): Promise<any> {
        console.error('An error occurred', error);
        return Promise.reject(error.message || error);
    }
}
