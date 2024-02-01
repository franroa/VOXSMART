resource "github_team" "voxsmart_teams" {
  for_each = {
    for team in var.teams :
    team.name => team
  }

  name                      = each.value.name
  description               = each.value.description
  privacy                   = each.value.privacy
  create_default_maintainer = each.value.create_default_maintainer
}
