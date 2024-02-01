resource "github_team_membership" "team_memberships" {
  depends_on = [
    github_team.voxsmart_teams,
    github_membership.voxsmart_users
  ]
  for_each = var.team_memberships

  team_id  = each.value.team_id
  username = each.value.username
  role     = each.value.role
}
