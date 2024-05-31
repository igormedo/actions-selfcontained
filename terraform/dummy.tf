terraform {
  required_version = "~> 1.8.0"
}

resource "random_string" "random" {
  length           = 15
  special          = true
  override_special = ".-@!?"
}

output "random" {
  value = random_string.random.result
}
