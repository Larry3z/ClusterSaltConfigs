hadoop-install:
  file.managed:
    - name: /home/hadoop/hadoop-2.6.3.tar.gz
    - source: salt://hadoop/files/hadoop-2.6.3.tar.gz
    - user: hadoop
    - group: hadoop
  cmd.run:
    - cwd: /home/hadoop
    - user: hadoop
    - group: hadoop
    - name: tar zxf hadoop-2.6.3.tar.gz
    - unless: test -d /home/hadoop/hadoop-2.6.3
    - require:
        - file: hadoop-install

env-config:
  file.append:
    - name: /etc/profile
    - text:
       - export HADOOP_HOME=/home/hadoop/hadoop-2.6.3
       - export PATH=$HADOOP_HOME/bin:$PATH
  cmd.run:
       - name: source /etc/profile
       - require:
         - file: env-config

hadoop-core-config:
  file.managed:
    - name: /home/hadoop/hadoop-2.6.3/etc/hadoop/core-site.xml
    - source: salt://hadoop/conf/core-site.xml
    - user: hadoop
    - group: hadoop

hadoop-env-config:
  file.managed:
    - name: /home/hadoop/hadoop-2.6.3/etc/hadoop/hadoop-env.sh
    - source: salt://hadoop/conf/hadoop-env.sh
    - user: hadoop
    - group: hadoop

hadoop-hdfs-config:
  file.managed:
    - name: /home/hadoop/hadoop-2.6.3/etc/hadoop/hdfs-site.xml
    - source: salt://hadoop/conf/hdfs-site.xml
    - user: hadoop
    - group: hadoop

hadoop-mapred-config:
  file.managed:
    - name: /home/hadoop/hadoop-2.6.3/etc/hadoop/mapred-site.xml
    - source: salt://hadoop/conf/mapred-site.xml
    - user: hadoop
    - group: hadoop

hadoop-slaves-config:
  file.managed:
    - name: /home/hadoop/hadoop-2.6.3/etc/hadoop/slaves
    - source: salt://hadoop/conf/slaves
    - user: hadoop
    - group: hadoop

hadoop-yarn-config:
  file.managed:
    - name: /home/hadoop/hadoop-2.6.3/etc/hadoop/yarn-site.xml
    - source: salt://hadoop/conf/yarn-site.xml
    - user: hadoop
    - group: hadoop

hadoop-yarn-env:
  file.managed:
    - name: /home/hadoop/hadoop-2.6.3/etc/hadoop/yarn-env.sh
    - source: salt://hadoop/conf/yarn-env.sh
    - user: hadoop
    - group: hadoop

