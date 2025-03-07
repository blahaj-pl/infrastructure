plugin "terraform" {
  enabled = true
  preset  = "all"
}

rule "terraform_required_providers" {
  enabled = false
}

rule "terraform_required_version" {
  enabled = false
}

rule "terraform_documented_outputs" {
  enabled = false
}

rule "terraform_documented_variables" {
  enabled = false
}
