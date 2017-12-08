# ENV['ELASTICSEARCH_ADDRESS_INT'] is the environment variable
# for the elasticsearch server, replace with IP address if not using ENV
Address.__elasticsearch__.client = Elasticsearch::Client.new host: ENV['ELASTICSEARCH_ADDRESS_INT']