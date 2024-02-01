resource "github_membership" "voxsmart_users" {
  for_each = {
    for member in var.users :
    member.username => member
  }

  username = each.value.username
  role     = each.value.role
}
