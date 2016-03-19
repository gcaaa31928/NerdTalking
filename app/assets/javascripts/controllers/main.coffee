angular.module('nerdTalking').controller 'MainCtrl', [
    '$scope',
    '$timeout',
    'Config',
    'Auth',
    'Me',
    'Tool',
    ($scope, $timeout, Config, Auth, Me, Tool) ->

        initialize = () ->
            window.$scope = $scope
            $scope.Me = Me
        initialize()


        $scope.noti = (header, message, delay = 2000) ->
            $timeout(() ->
                $scope.header = header
                $scope.message = message
                $('.custom.message.success').removeClass('invisible')
                $('.custom.message.success').addClass('visible')
                Tool.animateCss($('.custom.message.success'), 'bounceInDown')
                $timeout(() ->
                    Tool.animateCss($('.custom.message.success'), 'bounceOutUp', () ->
                        $('.custom.message.success').removeClass('visible')
                        $('.custom.message.success').addClass('invisible')
                    )
                , delay)
            )



        $scope.showLoginModal = () ->
            $timeout(() ->
                $('.ui.basic.modal').modal('setting', 'transition', 'horizontal flip').modal('show')
            )

        $scope.showAuth = (domain) ->
            afterAuthSuccess = (data) ->
                Me.setData(data)
                $scope.noti('Sign In success.', 'You may now log-in with the username')
                $('.ui.basic.modal').modal('setting', 'transition', 'horizontal flip').modal('hide')
            if domain == 'github'
                path = Config.githubAuthURL()
                callback = (code) ->
                    Auth.getGithubInfo(code).then((data) ->
                        afterAuthSuccess(data)
                    )
            else if domain == 'gitlab'
                path = Config.gitlabAuthURL()
                callback = (code) ->
                    Auth.getGitlabInfo(code).then((data) ->
                        afterAuthSuccess(data)
                    )
            else if domain == 'bitbucket'
                path = Config.bitbucketAuthURL()
                callback = (code) ->
                    Auth.getBitbucketInfo(code).then((data) ->
                        afterAuthSuccess(data)
                    )
            authPopup(
                path: path
                callback: callback
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