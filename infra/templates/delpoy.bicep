param location string = resourceGroup().location

param storageNamePrefix string
param con_res string = 'infratest'
param abs_res string = 'infratest'

var stgacc_name = '${storageNamePrefix}${uniqueString(resourceGroup().id)}'

resource storage_account 'Microsoft.Storage/storageAccounts@2024-01-01'= {
  name: stgacc_name
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

resource container_resgitry 'Microsoft.ContainerRegistry/registries@2025-04-01' = {
  name: con_res
  location: location
  sku: {
    name: 'Basic'

  }
  properties:{
    adminUserEnabled:true
  }
}

resource abs 'Microsoft.ServiceBus/namespaces@2024-01-01' = {
  name: abs_res
  location: location
}
