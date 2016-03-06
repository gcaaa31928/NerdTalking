angular.module('nerdTalking').factory 'Auth', [
    '$http',
    '$q',
    ($http, $q) ->
        factory = {}
        factory.httpConfig = (canceler) ->
            timeout = 15 * 1000
            if canceler
                timeout = canceler.promise
            {
                timeout: timeout
                headers: {
                    'AUTHORIZATION': factory.accessToken
                }
            }

        handleSuccessPromise = (resolve, reject, response) ->
            response = response.data
            if response.data?
                resolve response.data
            else
                resolve null

        handleFailedPromise = (resolve, reject, response) ->
            response = response.data
            if response.data? and response.data.errorMsg?
                reject response.data.errorMsg
            else if response.data?
                reject response.data
            else
                reject null

        factory.getGithubInfo = (code, canceler = null) ->
            $q (resolve, reject) ->
                $http.post('/api/github/auth', {code: code}, factory.httpConfig(canceler)).then ((response) ->
                    handleSuccessPromise(resolve, reject, response)
                ), (response) ->
                    handleFailedPromise(resolve, reject, response)
        factory
]
