angular.module('nerdTalking').factory 'Me', [
    '$http',
    '$q',
    '$localStorage',
    ($http, $q, $localStorage) ->
        factory = {}
        factory.setData = (data) ->
            $localStorage.accessToken = factory.accessToken =  data.access_token

        factory
]
