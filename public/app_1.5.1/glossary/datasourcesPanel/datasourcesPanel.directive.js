(function () {
    'use strict';
    angular.module('dataDoodler.module')
        .directive('datasourcesPanel', function (modelService, glossaryService) {
            return {
                restrict: 'E',
                scope: {},
                templateUrl: 'app_1.5.1/glossary/datasourcesPanel/datasourcesPanel.template.html',
                controller: function () {
                    var vm = this;
                    vm.test = "this is my test";
                    vm.modelService1 = modelService;
                    vm.showDatasetInfoVisible = false;
                    vm.newDatasetVisible=false;
                    vm.selectedDataset = {};
                    vm.showDatasetInfo = function (dsName) {

                        if (!vm.showDatasetInfoVisible) {
                            vm.showDatasetInfoVisible = true;
                            vm.selectedDataset = glossaryService.getDatasetInfo(dsName);
                            return;
                        }
                        if (dsName === vm.selectedDataset.name && vm.showDatasetInfoVisible) {
                            vm.showDatasetInfoVisible = false;
                        }
                        else {
                            vm.selectedDataset = glossaryService.getDatasetInfo(dsName)
                        }
                    }

                    vm.removeDataset = function (dsName) {
                        confirm('Are you sure you want to remove ' + dsName + 'from this doodle?')
                    }
                },
                controllerAs: 'vm',
                bindToController: true,
                link: function (scp, el, attrs) {
                    scp.modelService = modelService;
                    scp.glossaryService = glossaryService;
                }

            }
        })
}());
