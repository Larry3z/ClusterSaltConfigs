spark-install:
  file.managed:
    - name: /home/hadoop/spark-1.6.2-bin-hadoop2.6.tgz
    - source: salt://spark/files/spark-1.6.2-bin-hadoop2.6.tgz
    - user: hadoop
    - group: hadoop
  cmd.run:
    - cwd: /home/hadoop
    - user: hadoop
    - group: hadoop
    - name: tar zxf spark-1.6.2-bin-hadoop2.6.tgz
    - unless: test -d /home/hadoop/spark-1.6.2-bin-hadoop2.6
    - require:
        - file: spark-install

env-config:
  file.append:
    - name: /etc/profile
    - text:
       - export SPARK_HOME=/home/hadoop/spark-1.6.2-bin-hadoop2.6
       - export PATH=$SPARK_HOME/bin:$PATH
  cmd.run:
       - name: source /etc/profile
       - require:
         - file: env-config

spark-env-config:
  file.managed:
    - name: /home/hadoop/spark-1.6.2-bin-hadoop2.6/conf/spark-env.sh
    - source: salt://spark/conf/spark-env.sh
    - user: hadoop
    - group: hadoop

spark-slaves-config:
  file.managed:
    - name: /home/hadoop/spark-1.6.2-bin-hadoop2.6/conf/slaves
    - source: salt://spark/conf/slaves
    - user: hadoop
    - group: hadoop

