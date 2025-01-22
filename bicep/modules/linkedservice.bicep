targetScope = 'resourceGroup'  // Set targetScope to resourceGroup

param dataFactoryName string
param linkedService array

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: 'East US'
}

resource linkedServiceDeploy 'Microsoft.Resources/deployments@2021-04-01' = {
    name: 'LinkedServiceDeployment'
    properties: {
      mode: 'Incremental'
      templateLink: {
        uri: 'https://github.com/DMJ57/ADF033/dataset/TestDataset.json'
      }
    }
  }
