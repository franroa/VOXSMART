resource "github_team_repository" "voxsmart_team_repo" {
  for_each = var.team_repository_settings

  team_id = each.value.team_id
  repository = each.value.repository
  permission = each.value.permission
}
