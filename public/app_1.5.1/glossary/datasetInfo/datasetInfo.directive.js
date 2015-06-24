(function () {
    'use strict';
    angular.module('dataDoodler.module')
        .directive('datasetInfo',function(glossaryService){
            return {
                restrict:'E',
                templateUrl:'app_1.5.1/glossary/datasetInfo/datasetInfo.template.html'
            }
        })
}());
