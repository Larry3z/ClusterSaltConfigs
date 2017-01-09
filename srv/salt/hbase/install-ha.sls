hbase-install:
  file.managed:
    - name: /home/hadoop/hbase-1.2.2-bin.tar.gz
    - source: salt://hbase/files/hbase-1.2.2-bin.tar.gz
    - user: hadoop
    - group: hadoop
  cmd.run:
    - cwd: /home/hadoop
    - user: hadoop
    - group: hadoop
    - name: tar zxf hbase-1.2.2-bin.tar.gz
    - unless: test -d /home/hadoop/hbase-1.2.2
    - require:
        - file: hbase-install

env-config:
  file.append:
    - name: /etc/profile
    - text:
       - export HBASE_HOME=/home/hadoop/hbase-1.2.2
       - export PATH=$HBASE_HOME/bin:$PATH
  cmd.run:
       - name: source /etc/profile
       - require:
         - file: env-config

hbase-core-config:
  file.managed:
    - name: /home/hadoop/hbase-1.2.2/conf/hbase-site.xml
    - source: salt://hbase/conf/hbase-site.xml
    - user: hadoop
    - group: hadoop

hbase-env-config:
  file.managed:
    - name: /home/hadoop/hbase-1.2.2/conf/hbase-env.sh
    - source: salt://hbase/conf/hbase-env.sh
    - user: hadoop
    - group: hadoop

hbase-region-config:
  file.managed:
    - name: /home/hadoop/hbase-1.2.2/conf/regionservers
    - source: salt://hbase/conf/regionservers
    - user: hadoop
    - group: hadoop

hbase-backmaster-config:
  file.managed:
    - name: /home/hadoop/hbase-1.2.2/conf/backup-masters
    - source: salt://hbase/conf/backup-masters
    - user: hadoop
    - group: hadoop
