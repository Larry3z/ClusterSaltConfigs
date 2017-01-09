scala-install:
  file.managed:
    - name: /home/software/scala-2.11.8.tgz
    - source: salt://scala/files/scala-2.11.8.tgz
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - cwd: /home/software
    - name: tar zxf scala-2.11.8.tgz
    - unless: test -d /home/software/scala-2.11.8
    - require:
        - file: scala-install

scala-config:
  file.append:
    - name: /etc/profile
    - text:
       - export SCALA_HOME=/home/software/scala-2.11.8
       - export PATH=$SCALA_HOME/bin:$PATH
  cmd.run:
       - name: source /etc/profile
       - require:
         - file: scala-config

