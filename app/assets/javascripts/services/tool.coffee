angular.module('nerdTalking').factory 'Tool', [
    '$http',
    '$q',
    ($http, $q) ->
        factory = {}
        factory.animateCss = (DOMObject, animationName, callback) ->
            animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
            DOMObject.addClass('animated ' + animationName).one(animationEnd, () ->
                DOMObject.removeClass('animated ' + animationName)
                (callback || angular.noop)()
            )

        factory
]
