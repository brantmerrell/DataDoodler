(function () {
    'use strict';
    angular.module('dataDoodler.module')
        .factory('glossaryService', [function () {

            var glossaryService = {};

            glossaryService.availableDataSets = [{"name":"FDIC SDI Data","nickname":"","description":"Data is updated quarterly. Last update occurred 3/28/2015."},{"name":"Custom Upload 5/5/2015"}];

            glossaryService.getDatasetInfo=function(datasetName){
              for(var i=0;i<glossaryService.availableDataSets.length;i++){
                  if(glossaryService.availableDataSets[i].name===datasetName){
                      return glossaryService.availableDataSets[i];
                  }
              }
            };


            glossaryService.getGlossary=function(dataSources){
                return [
                    {varName:"var1_nepsp_sd",shortDesc:"Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia",longDesc:' Duis eu magna auctor, vehicula lectus ut, blandit turpis. Vestibulum laoreet posuere leo eget sagittis. Cras blandit dignissim pharetra. Vestibulum eu erat pulvinar, ultricies eros sit amet, posuere elit. Nulla a ultrices leo, vel lacinia libero. Ut ac metus mollis, lacinia neque ac, hendrerit enim. Praesent vitae suscipit lacus. Vestibulum at augue mauris. Nulla molestie vulputate mauris, in sagittis ipsum ornare sed. Donec maximus quis lectus vitae sollicitudin. '},
                    {varName:"var2_lobortis",shortDesc:"fermentum eu sapien.",longDesc:'Sed purus odio, bibendum vel vehicula vitae, rhoncus eget nulla. Nullam leo libero, cursus eget interdum eget, scelerisque non augue.'},
                    {varName:"var3_consequat ",shortDesc:"Praesent vitae suscipit lacus.",longDesc:' Phasellus dictum rutrum sem, et viverra eros pharetra non. Maecenas ut fermentum nulla, in pellentesque lorem. Aenean nulla lectus, fermentum in ligula nec, laoreet condimentum quam. '},
                    {varName:"var4_consequat ",shortDesc:"Praesent vitae suscipit lacus.",longDesc:' Phasellus dictum rutrum sem, et viverra eros pharetra non. Maecenas ut fermentum nulla, in pellentesque lorem. Aenean nulla lectus, fermentum in ligula nec, laoreet condimentum quam. '}
                ]
            }
            return glossaryService;
        }])
}());
