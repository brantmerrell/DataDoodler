(function () {
    'use strict';
    angular.module('dataDoodler.module')
        .directive('newDataset',function(glossaryService){
            return {
                restrict:'E',
                templateUrl:'app_1.5.1/glossary/newDataset/newDataset.template.html'
            }
        })
}());
