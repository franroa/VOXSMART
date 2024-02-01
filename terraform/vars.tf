variable "teams" {

  type = list(object({
    name                      = string
    description               = string
    privacy                   = string
    create_default_maintainer = bool
  }))

  default = [
    {
      name                      = "Backend"
      description               = "Backend team"
      privacy                   = "closed"
      create_default_maintainer = false
    },
    {
      name                      = "Frontend"
      description               = "Frontend team"
      privacy                   = "closed"
      create_default_maintainer = false
    }
  ]
}
#force change
variable "users" {
  type = list(object({
    username = string
    role     = string
  }))

  default = [
    {
      username = "franciscoroaprieto"
      role     = "member"
    }
  ]
}

variable "repositories" {
  type = map(object({
    name            = string
    visibility      = string
    has_wiki        = bool
    has_projects    = bool
    has_issues      = bool
    has_discussions = bool
  }))

  default = {
    voxsmart_service_api = {
      name            = "voxsmart-service-api"
      visibility      = "private"
      has_wiki        = false
      has_projects    = false
      has_issues      = false
      has_discussions = false
    },
    voxsmart_service_ui = {
      name            = "voxsmart-service-ui"
      visibility      = "private"
      has_wiki        = true
      has_projects    = true
      has_issues      = true
      has_discussions = true
    },
    voxsmart_service_sdk = {
      name            = "voxsmart-service-sdk"
      visibility      = "public"
      has_wiki        = true
      has_projects    = false
      has_issues      = false
      has_discussions = true
    }
  }
}

variable "team_memberships" {
  type = map(object({
    username = string
    role     = string
    team_id  = string
  }))
  default = {
    franciscoroaprieto = {
      username = "franciscoroaprieto"
      role     = "member"
      team_id  = "backend"
    },
  }
}

variable "team_repository_settings" {
  type = map(object({
    team_id    = string
    repository = string
    permission = string
  }))
  default = {
    api_backend = {
      team_id    = "backend"
      repository = "voxsmart-service-api"
      permission = "admin"
    },
    api_frontend = {
      team_id    = "frontend"
      repository = "voxsmart-service-api"
      permission = "pull"
    },
    ui_frontend = {
      team_id    = "frontend"
      repository = "voxsmart-service-ui"
      permission = "admin"
    },
    sdk_frontend = {
      team_id    = "frontend"
      repository = "voxsmart-service-sdk"
      permission = "push"
    },
    sdk_backend = {
      team_id    = "backend"
      repository = "voxsmart-service-sdk"
      permission = "push"
    },
  }

}
