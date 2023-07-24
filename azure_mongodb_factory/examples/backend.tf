terraform {
  cloud {
    organization = "scott-test-org"

    workspaces {
      name = "sz-test-workspace"
    }
  }
}