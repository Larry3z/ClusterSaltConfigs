maven-install:
  file.managed:
    - name: /home/software/apache-maven-3.3.9-bin.tar.gz
    - source: salt://maven/files/apache-maven-3.3.9-bin.tar.gz
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - cwd: /home/software
    - name: tar zxf apache-maven-3.3.9-bin.tar.gz
    - unless: test -d /home/software/apache-maven-3.3.9
    - require:
        - file: maven-install

maven-config:
  file.append:
    - name: /etc/profile
    - text:
       - export MAVEN_HOME=/home/software/apache-maven-3.3.9
       - export PATH=$MAVEN_HOME/bin:$PATH
  cmd.run:
       - name: source /etc/profile
       - require:
         - file: maven-config

