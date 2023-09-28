resource "aws_s3_bucket" "solutionsarchitecture" {
    bucket = "solutionsarchitecture-20230928"
    tags = {
      Description = "Solutions Architecture Team"
    }
  
}
#upload some dummy files to the created S3 bucket
resource "aws_s3_bucket_object" "solutionsarchitecture-2023" {
    content = "PATH_TO_FILE_LOCATION_ON_LOCAL_MACHINE"
    key = "NAME_OF_THE_FILE"
    bucket = aws_s3_bucket.solutionsarchitecture.id
}
#adding data blocks and access
data "aws_iam_group" "inframod" {
  group_name = "inframod"
}
resource "aws_s3_bucket_policy" "inframod-policy" {
  bucket = aws_s3_bucket.solutionsarchitecture.id
  policy = <<EOF
  {
    "Version": "2023-09-28",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "arn:aws:s3:::${aws_s3_bucket.solutionsarchitecture.id}/*",
            "Principal":{
                "AWS": [
                    "${data.aws_iam_group.inframod.arn}"
                ]
            }
        }
    ]
  }
  EOF
}