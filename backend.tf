terraform {
  backend "s3" {
    bucket = "mybucket-statemanagement1"
    key    = "network/demo.tfstate"
    region = "us-east-1"
    # dynamodb_table = "statelocktable"
    use_lockfile = true
  }
}


# resource "time_sleep" "wait150sec" {
#   create_duration = "160s"
# }