provider "aws" {
  region = "us-east-1"
  access_key = "INSERT_ACCESS_KEY"
  secret_key = "INSERT_SECRET_KEY"
}
resource "aws_iam_user" "admin-user" {
    name = "sachita"
    tags = {
      Description = "Solutions Architect"
    }
}
resource "aws_iam_policy" "adminUser" {
  name = "AdministratorUsers"
  policy = file("admin-policy.json")
 
}
resource "aws_iam_user_policy_attachment" "sachita-admin-access" {
    user = aws_iam_user.admin-user.name
    policy_arn = aws_iam_policy.adminUser.arn
  
}