angular.module('nerdTalking').constant('Config',
    url: 'http://localhost:3000'
    githubAuthURL: () ->
        "https://github.com/login/oauth/authorize?client_id=09118830e21db2f8968c"
    gitlabAuthURL: () ->
        "https://gitlab.com/oauth/authorize?client_id=ed8fb518dbfca5f406e0d321993705923b37963770c2d2c3077cc84bb4796dab&redirect_uri=#{this.url}/auth_redirect.html&response_type=code"
    bitbucketAuthURL: () ->
        "https://bitbucket.org/site/oauth2/authorize?client_id=a4rVkvUut6Dx5pAzdw&response_type=code"
)