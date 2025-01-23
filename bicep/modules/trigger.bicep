targetScope = 'resourceGroup'  // Set targetScope to resourceGroup

param triggers array

param dataFactoryName string

@description('Properties of linked service.')
param properties object = loadJsonContent('../../trigger/TestTrigger.json')

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: 'East US'
}

resource triggerADF 'Microsoft.DataFactory/factories/triggers@2018-06-01' = [for trigger in triggers: {
  name: trigger.name
  parent: dataFactory
  properties: properties
}]
