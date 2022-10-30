# Terraform é uma ferramenta (IaC) para criar um infraestrutura na nuvem usando código

resource "aws_s3_bucket" "datalake" {
  bucket = "${var.base_bucket_name}-${var.environment}-${var.account_number}"
  acl    = "private"

  tags = {
    "IES"   = "XPE",
    "CURSO" = "EDC"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_object" "codigo_spark" {
  bucket = aws_s3_bucket.datalake.id
  key    = "emr-code/pyspark/job_spark_from_tf.py"
  acl    = "private"
  source = "../aulas_praticas/job_spark.py"
  etag   = filemd5("../aulas_praticas/job_spark.py")
}

provider "aws" {
  region = var.region
}