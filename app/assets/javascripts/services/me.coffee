angular.module('nerdTalking').factory 'Me', [
    '$http',
    '$q',
    '$localStorage',
    ($http, $q, $localStorage) ->
        factory = {}
        factory.data = $localStorage.data || null
        factory.setData = (data) ->
            $localStorage.data = factory.data =  data

        factory.isLogin = () ->
            factory.data? && factory.data.access_token?

        factory
]
