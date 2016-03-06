angular.module('nerdTalking').controller 'MainCtrl', [
    '$scope',
    '$timeout',
    'Config',
    ($scope, $timeout, Config) ->
        $scope.showLoginModal = () ->
            $timeout(() ->
                $('.ui.basic.modal').modal('setting', 'transition', 'horizontal flip').modal('show')
            )

        $scope.showGithubAuth = () ->
            authPopup(
                path: Config.githubAuthURL
                callback: (code) ->
                    log.info(code)

            )


        authPopup = (options) ->
            options.windowName = options.windowName ||  'ConnectWithOAuth'
            options.windowOptions = options.windowOptions || 'location=0,status=0,height=500,width=500'
            options.callback = options.callback || () -> window.location.reload()
            that = this;
            that._oauthWindow = window.open(options.path, options.windowName, options.windowOptions)
            that._oauthInterval = window.setInterval(() ->
                if (that._oauthWindow.closed)
                    code = extractParameterCode(that._oauthWindow.document.URL)
                    window.clearInterval(that._oauthInterval)
                    options.callback(code)
            , 1000);

        extractParameterCode = (url) ->
            callbackResponse = url.split("?")[1];
            responseParameters = (callbackResponse).split("&");
            parameterMap = [];
            for parameter in responseParameters
                parameterMap[parameter.split("=")[0]] = parameter.split("=")[1].replace('#', '')

            if (parameterMap.code != undefined && parameterMap.code != null)
                return parameterMap.code
            else
                console.error('Problem authenticating');
                return "";
]