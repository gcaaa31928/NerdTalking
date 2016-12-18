import {Injectable} from "@angular/core";
import {Http} from "@angular/http";
import 'rxjs/add/operator/toPromise';

@Injectable()
export class AboutService {
    private repoCommits = 'https://api.github.com/repos/gcaaa31928/NerdTalking/commits';
    private hottestArticle = '/api/articles/hottest';

    constructor(private http: Http) {
    }

    getHottestArticles(): Promise<{}> {
        return this.http.get(this.hottestArticle)
            .toPromise()
            .then(response => {
                console.log(response.json());
                return response.json().data;
            })
            .catch(this.handleError);
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
