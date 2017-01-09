jdk-install:
  file.managed:
    - name: /home/software/jdk-8u92-linux-x64.tar.gz
    - source: salt://jdk/files/jdk-8u92-linux-x64.tar.gz
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - cwd: /home/software
    - name: tar zxf jdk-8u92-linux-x64.tar.gz
    - unless: test -d /home/software/jdk1.8.0_92
    - require:
        - file: jdk-install

jdk-config:
  file.append:
    - name: /etc/profile
    - text:
       - export JAVA_HOME=/home/software/jdk1.8.0_92
       - export PATH=$JAVA_HOME/bin:$PATH
       - export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
    - unless: test grep 'JAVA_HOME' /etc/profile
  cmd.run:
       - name: source /etc/profile
       - require:
         - file: jdk-config

