targetScope = 'resourceGroup'  // Set targetScope to resourceGroup

param dataFactoryName string
param linkedServices array

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: 'East US'
}
@description('Name of the Azure Storage Account that contains I/O & O/P data')
param storageAccountName string = 'demokomatsu'


param storageAccount1 string = 'Y4Fo0vh4xap7U+VravqaJftr++ToUycBATaNeOJ1eLNJZkKyU3e9qZZCIPeLoP03xZmwO/s8gHCc+ASt9ejhfw=='


// resource LinkedService 'Microsoft.DataFactory/factories/linkedservices@2018-06-01' = [for linkedService in linkedServices: {
//   parent: dataFactory
//   name: '${dataFactory}/${linkedService}'
//   properties: linkedService.definition
// }]

resource azureBlobStorageLinkedService 'Microsoft.DataFactory/factories/linkedservices@2022-10-01' = [for linkedService in linkedServices: {
  
  parent: dataFactory
  name: linkedService
  properties: {
    type: 'AzureBlobStorage'
    typeProperties: {
      connectionString: 'DefaultEndpointsProtocol=https;AccountName=${storageAccountName};AccountKey=${storageAccount1};EndpointSuffix=core.windows.net;'
    }
  }
}]
