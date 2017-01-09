zk-install:
  file.managed:
    - name: /home/hadoop/zookeeper-3.4.6.tar.gz
    - source: salt://zookeeper/files/zookeeper-3.4.6.tar.gz
    - user: hadoop
    - group: hadoop
  cmd.run:
    - cwd: /home/hadoop
    - user: hadoop
    - group: hadoop
    - name: tar zxf zookeeper-3.4.6.tar.gz && mkdir -p /home/hadoop/zookeeper-3.4.6/zoo-data && echo 1 > /home/hadoop/zookeeper-3.4.6/zoo-data/myid
    - unless: test -d /home/hadoop/zookeeper-3.4.6
    - require:
        - file: zk-install

env-config:
  file.append:
    - name: /etc/profile
    - text:
       - export ZOOKEEPER_HOME=/home/hadoop/zookeeper-3.4.6
       - export PATH=$ZOOKEEPER_HOME/bin:$PATH
  cmd.run:
       - name: source /etc/profile
       - require:
         - file: env-config

zk-config:
  file.managed:
    - name: /home/hadoop/zookeeper-3.4.6/conf/zoo.cfg
    - source: salt://zookeeper/zoo.cfg
    - user: hadoop
    - group: hadoop
