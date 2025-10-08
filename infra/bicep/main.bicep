param location string = 'eastus'
param acrName string
param aciName string
param image string

resource acr 'Microsoft.ContainerRegistry/registries@2023-06-01-preview' existing = {
  name: acrName
}

resource aci 'Microsoft.ContainerInstance/containerGroups@2023-05-01' = {
  name: aciName
  location: location
  properties: {
    osType: 'Linux'
    containers: [
      {
        name: 'app'
        properties: {
          image: image
          ports: [
            {
              port: 8080
            }
          ]
          resources: {
            requests: {
              cpu: 1
              memoryInGB: 1.5
            }
          }
        }
      }
    ]
    ipAddress: {
      type: 'Public'
      ports: [
        {
          protocol: 'Tcp'
          port: 8080
        }
      ]
      dnsNameLabel: '${aciName}-${uniqueString(resourceGroup().id)}'
    }
  }
}
