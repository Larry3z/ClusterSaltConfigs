storm-install:
  file.managed:
    - name: /home/hadoop/apache-storm-1.0.2.tar.gz
    - source: salt://storm/files/apache-storm-1.0.2.tar.gz
    - user: hadoop
    - group: hadoop
  cmd.run:
    - cwd: /home/hadoop
    - user: hadoop
    - group: hadoop
    - name: tar zxf apache-storm-1.0.2.tar.gz
    - unless: test -d /home/hadoop/apache-storm-1.0.2
    - require:
        - file: storm-install

env-config:
  file.append:
    - name: /etc/profile
    - text:
       - export STORM_HOME=/home/hadoop/apache-storm-1.0.2
       - export PATH=$STORM_HOME/bin:$PATH
  cmd.run:
       - name: source /etc/profile
       - require:
         - file: env-config

storm-config:
  file.managed:
    - name: /home/hadoop/apache-storm-1.0.2/conf/storm.yaml
    - source: salt://storm/conf/storm.yaml
    - user: hadoop
    - group: hadoop
