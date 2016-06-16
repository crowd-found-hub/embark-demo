window.EmbarkDemo = {};

EmbarkDemo.IndexScreen = {};

$(document).ready(function () {

    EmbarkDemo.IndexScreen.ViewModel = function () {
        var self = this;

        self.logs = ko.observableArray();
        self.value = ko.observable(10);
        self.toAddress = ko.observable();
        self.displayValue = ko.observable(SimpleStorage.get().toNumber());

        self.setValue = function() {
            SimpleStorage.set(self.value());
            //MyToken.transfer(self.value(), self.toAddress());
            self.addToLog("SimpleStorage.set(" + self.value() + ")");
        };

        self.getValue = function() {
            var value = SimpleStorage.get().toNumber();
            self.displayValue(value);
            self.addToLog("SimpleStorage.get()");
        };

        self.addToLog = function(logText) {
            self.logs.push(logText);
        }

        return self;
    };

    var viewModel = EmbarkDemo.IndexScreen.ViewModel();
    ko.applyBindings(viewModel);

});
