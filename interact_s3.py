import boto3


# Criando um cliente para acessar o s3
# s3 = boto3.resource('s3')
s3 = boto3.client('s3')
# s3.download_file('database-xpe-js',
#                  'data/certificado_jaelbsti_01d9f1540e129ed803f0361920a9621d.pdf',
#                  'data/certificado.pdf')

s3.upload_file('data/text.txt',
               'database-xpe-js',
               'data/text.txt') 