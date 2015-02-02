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
                ],
            glossary:[
                {varName:"var1_nepsp_sd",shortDesc:"shortDesc asdkfl ;sd flkjs d;lfkj lkjsldjf klj ;lksdjf;lk j;lkjb ;alf djlkj  d;lfkj lkjsldjf klj ;lksdjf;lk j;lkjb ;alf djlkj ;lkj ;kljsflk;j   lj ;lksd d;lfkj lkjsldjf klj ;lksdjf;lk j;lkjb ;alf djlkj ;lkj ;kljsflk;j   lj ;lksd d;lfkj lkjsldjf klj ;lksdjf;lk j;lkjb ;alf djlkj ;lkj ;kljsflk;j   lj ;lksd;lkj ;kljsflk;j   lj ;lksdjf;lk j;lkjb ;alf djlkj ;lkj ;kljsflk;j   sdlj ;lksdjf;lk j;lkjb ;alf djlkj ;lkj ;kljsflk;j   sdsdlfk kl; js;f1 kjksdf ",longDesc:'LongDesc'},
                {varName:"var2",shortDesc:"shortDesc",longDesc:'LongDesc'},
                {varName:"var3",shortDesc:"shortDesc",longDesc:'LongDesc'}
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

            template: '<div class="glossary-container">\n    <span class="ds-name">{{datasource.name}}</span>\n    <span ng-repeat="attrib in datasource.attributes">\n        <span class="attribute-name">{{attrib.description}}:</span><span class="attribute-value">{{attrib.value}}</span>\n</span>\n\n\n    <div  style="margin-top:1rem;margin-left:.1rem;position:relative;display:block">\n        <input type="text" ng-model="filter_variable_name" placeholder="variable name"\n                                            class="input-filter" style="margin-left:1rem;">\n        <input type="text" ng-model="filter_description" placeholder="description"\n                                            class="input-filter">\n        \n    </div>\n    <div style="position:relative;padding-right:2rem;left:1rem;">\n        <table style="position:relative;display: block">\n            <tr ng-repeat="var in datasource.glossary |filter:filter_variable_name ">\n                <td>\n                    <div ng-bind="var.varName" style="font-size: 1.2rem;padding-top:.2rem;"/>\n                    <hr class="tdHr"/>\n                    <div><input id="checkbox{{$index+1}}" type="checkbox"><label for="checkbox{{$index+1}}" style="font-size:.8rem;">Use in\n                        doodle</label></div>\n                </td>\n                <td style="vertical-align: top; width:80%">\n                    <div ng-bind="var.shortDesc"></div>\n                    <div ng-bind="var.longDesc"></div>\n                </td>\n            </tr>\n        </table>\n    </div>\n</div>',
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