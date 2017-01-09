kafka-install:
  file.managed:
    - name: /home/hadoop/kafka_2.11-0.10.0.0.tgz
    - source: salt://kafka/files/kafka_2.11-0.10.0.0.tgz
    - user: hadoop
    - group: hadoop
  cmd.run:
    - cwd: /home/hadoop
    - user: hadoop
    - group: hadoop
    - name: tar zxf kafka_2.11-0.10.0.0.tgz
    - unless: test -d /home/hadoop/kafka_2.11-0.10.0.0
    - require:
        - file: kafka-install

kafka-consumer-config:
  file.managed:
    - name: /home/hadoop/kafka_2.11-0.10.0.0/config/consumer.properties
    - source: salt://kafka/conf/consumer.properties
    - user: hadoop
    - group: hadoop

kafka-producer-config:
  file.managed:
    - name: /home/hadoop/kafka_2.11-0.10.0.0/config/producer.properties
    - source: salt://kafka/conf/producer.properties
    - user: hadoop
    - group: hadoop

kafka-server-config:
  file.managed:
    - name: /home/hadoop/kafka_2.11-0.10.0.0/config/server.properties
    - source: salt://kafka/conf/server.properties
    - user: hadoop
    - group: hadoop


