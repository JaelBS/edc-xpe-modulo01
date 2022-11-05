resource "aws_s3_bucket_object" "spark_code" {
  bucket = aws_s3_bucket.datalake.id
  key    = "emr-code/pyspark/job_spark_tf.py"
  source = "../etl/job_spark.py"
  etag   = filemd5("../etl/job_spark.py")
  acl    = "private"
}
# 
