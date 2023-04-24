file_storages = {
  "FILE-STORAGE-NAME" = {
    network_cmp  = "network-cmp"
    subnet       = "subnet-name"
    ad_number    = 1
    cmp          = ["LVL1", "LVL2", "LVL3"]
    defined_tags = { "NAMESPACE.TAG" = "VALUE", "NAMESPACE.TAG" = "VALUE-2" }
    file_systems = {
      "FILE-SYSTEM-NAME" = {
        cmp          = ["LVL1", "LVL2", "LVL3"]
        defined_tags = { "NAMESPACE.TAG" = "VALUE", "NAMESPACE.TAG" = "VALUE-2" }
        exports = {
          "EXPORT-NAME" = {
            paths = {
              "/PATH-NAME-01" = {
              }
              "/PATH-NAME-02" = {
              }
              "/PATH-NAME-03" = {
              }
              "/PATH-NAME-04" = {
              }
            }
          }
        }
      }
    }
  }
}