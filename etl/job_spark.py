from pyspark.sql import SparkSession
# comment
spark = (
    SparkSession.builder.appName("ExerciseSpark")
    .getOrCreate()
)

enem_data = (
    spark
    .read
    .format("csv")
    .option("header", True)
    .option("inferSchema", True)
    .load("s3://datalake-jb-xpe/raw_data/enem")
)

(
    enem_data
    .write
    .format("parquet")
    .mode('overwrite')
    .partitionBy('NU_ANO')
    .save('s3://datalake-jb-xpe/staging_zone/enem')
)