param dataFactoryName string
param resourceGroupName string

resource dataFactory 'Microsoft.DataFactory/factories@2020-12-01' existing = {
  name: dataFactoryName
  resourceGroupName: resourceGroupName
}


resource pipelineDeploy 'Microsoft.Resources/deployments@2021-04-01' = {
    name: 'pipelineDeployment'
    properties: {
      mode: 'Incremental'
      templateLink: {
        uri: 'https://github.com/DMJ57/ADF033/blob/main/pipeline/TestPipeline.json'
      }
    }
  }
  
  resource datasetDeploy 'Microsoft.Resources/deployments@2021-04-01' = {
    name: 'datasetDeployment'
    properties: {
      mode: 'Incremental'
      templateLink: {
        uri: 'https://github.com/DMJ57/ADF033/blob/main/dataset/TestDataset.json'
      }
    }
  }
