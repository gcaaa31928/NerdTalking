var Log = function () {
    this.error = function (msg) {
        console.log("%c Error: " + msg, 'color: #F8485A');
    };
    this.info = function (msg) {
        console.log("%c Info: " + msg, 'color: #7968FD');
    };
    this.debug = function (msg) {
        console.log("%c Debug: " + msg, 'color: #241F47');
    };
};
var log = new Log();
