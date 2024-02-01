resource "github_team_membership" "team_memberships" {
  for_each = var.team_memberships

  team_id  = each.value.team_id
  username = each.value.username
  role     = each.value.role
}
