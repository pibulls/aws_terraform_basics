resource "aws_dynamodb_table" "users" {
name           = "users"
billing_mode   = "PROVISIONED"
read_capacity  = 5
write_capacity = 10
hash_key       = "id"
range_key      = "name"

attribute {
name = "id"
type = "S"
}

attribute {
name = "name"
type = "S"
}

attribute {
name = "email"
type = "S"
}

attribute {
name = "age"
type = "N"
}

global_secondary_index {
name               = "email-index"
hash_key           = "email"
projection_type    = "KEYS_ONLY"
read_capacity      = 1
write_capacity     = 2
}

local_secondary_index {
name               = "age-index"
range_key          = "age"
projection_type    = "ALL"
}
}