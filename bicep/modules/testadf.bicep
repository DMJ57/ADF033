param dataFactoryName string
param pipelines array

resource dataFactory 'Microsoft.DataFactory/factories@2021-12-01' = {
  name: dataFactoryName
  location: 'East US'
}

resource pipelinesResource 'Microsoft.DataFactory/factories/pipelines@2021-12-01' = [for pipeline in pipelines: {
  parent: dataFactory
  name: pipeline.name
  properties: pipeline.definition
}]

