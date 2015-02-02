(
    function () {
        'use strict';
        angular.module('ddlApp', [])
    }()
)

angular.module('ddlApp')
    .factory('dataSourceService', function () {
        _dataSources= [
            {name: "FDIC Statistical Dataset", description: "Bank data comes from FDIC on a quarterly basis",
                attributes:[
                    {key:"periodicity",value:"quarterly",description:"Periodicity"},
                    {key:"lastPublicationDate",value:"2014-12-31",description:"Last publication date"},
                    {key:"variableCount",value:"455",description:"Variables"},
                    {key:"recordCount",value:"3362",description:"Records"}
                ]},
            {name: "Custom Upload 1"}];
        _constructSummary=function(){
            var rtrn=""
            angular.forEach(_dataSources,function(ds){
                rtrn += "<ddl-ds-name dsname='" + ds.name + "'></ddl-ds-name>";
            })
            return rtrn;
        }
        return {

            ActiveVariablesSummary: "Active variables in this doodle include....",
            dataSources: _dataSources
        }
    });

angular.module('ddlApp')
    .directive('ddlSection', function (dataSourceService) {
        return {
            restrict: 'E',
            transclude: true,
            scope: {},

            template: '<div class="section-container row" ng-switch="sectionType" ng-class="{\'collapsed\':collapsed}">\n    <span ng-bind="title" class="section-title"  ng-dblclick="collapsed=!collapsed"></span>\n    <span ng-switch-when="DATASOURCES">\n        <ddl-ds-names></ddl-ds-names>\n    </span>\n    <span class="section-summary">{{summry}}</span>\n    <div><ng-transclude></ng-transclude></div>\n</div>',
            //scp: {summary: '='},
            link: function (scp, el, attrs) {
                scp.title = attrs.title;
                scp.collapsed = false;
               // scp.summry = dataSourceService.summary;
                scp.sectionType=attrs.sectionType.toUpperCase();
                console.log(attrs.sectionType.toUpperCase())

            }
        }
    });

angular.module('ddlApp').controller('dataSourcesCtrl', function ($scope, dataSourceService) {
    console.log(dataSourceService.summary)
    $scope.dss = dataSourceService;

});

angular.module('ddlApp')
    .directive('ddlGlossary', function (dataSourceService) {
        return {
            restrict: 'E',

            template: '<div class="glossary-container">\n    <span class="ds-name">{{datasource.name}}</span>\n    <span ng-repeat="attrib in datasource.attributes">\n        <span class="attribute-name">{{attrib.description}}:</span><span class="attribute-value">{{attrib.value}}</span>\n</span>\n\n\n    <div class="row" style="margin-top:1rem;margin-left:.1rem;">\n        <div class="small-2 columns"><input type="text" placeholder="variable name" class="input-filter"></div>\n        <div class="small-2 columns"><input type="text" placeholder="description" class="input-filter"></div>\n        <div class="small-8 columns"></div>\n    </div>\n</div>',
            scope: {datasource:"=datasource"},
            link: function (scp, el, attrs) {

            }
        }
    })

angular.module('ddlApp')
    .directive('ddlDsNames',function(dataSourceService){
        return{
            restrict:"E",
            template:'<span ng-repeat="ds in dataSources" class="dsname" ng-bind="ds.name" ></span>',
            scope:{},
            link:function(scp,el,attrs){
                scp.dataSources=dataSourceService.dataSources;
                scp.dsname=attrs.dsname;
            }

        }
    })