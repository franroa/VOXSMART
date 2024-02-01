resource "github_repository" "voxsmart_repositories" {
  for_each = var.repositories

  name            = each.value.name
  visibility      = each.value.visibility
  has_discussions = each.value.has_discussions
  has_issues      = each.value.has_issues
  has_projects    = each.value.has_projects
  has_wiki        = each.value.has_wiki
}
