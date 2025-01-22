param dataFactoryName string
param pipelineName string
param pipelineDefinition object

resource dataFactory 'Microsoft.DataFactory/factories@2021-12-01' = {
  name: dataFactoryName
  location: 'East US'
}

resource pipeline 'Microsoft.DataFactory/factories/pipelines@2021-12-01' = {
  parent: dataFactory
  name: pipelineName
  properties: pipelineDefinition
}
