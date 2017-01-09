mahout-install:
  file.managed:
    - name: /home/hadoop/apache-mahout-distribution-0.12.2.tar.gz
    - source: salt://mahout/files/apache-mahout-distribution-0.12.2.tar.gz
    - user: hadoop
    - group: hadoop
    - mode: 644
  cmd.run:
    - cwd: /home/hadoop
    - name: tar zxf apache-mahout-distribution-0.12.2.tar.gz
    - unless: test -d /home/hadoop/apache-mahout-distribution-0.12.2
    - require:
        - file: mahout-install

mahout-config:
  file.append:
    - name: /etc/profile
    - text:
       - export MAHOUT_HOME=/home/hadoop/apache-mahout-distribution-0.12.2
       - export PATH=$MAHOUT_HOME/bin:$PATH
  cmd.run:
       - name: source /etc/profile
       - require:
         - file: mahout-config
