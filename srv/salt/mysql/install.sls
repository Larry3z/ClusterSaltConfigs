mysql-copy:
  file.managed:
    - name: /home/software/mysql-5.7.16-1.el6.x86_64.rpm-bundle.tar
    - source: salt://mysql/files/mysql-5.7.16-1.el6.x86_64.rpm-bundle.tar
    - user: root
    - group: root
    - mode: 755
mysql-config:
  file.managed:
    - name: /etc/my.cnf
    - source: salt://mysql/files/my.cnf
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - cwd: /home/software
    - name: mkdir -p /home/data/mysql && tar xf mysql-5.7.16-1.el6.x86_64.rpm-bundle.tar && rpm -ih mysql-community-common-5.7.16-1.el6.x86_64.rpm && rpm -ih mysql-community-libs-5.7.16-1.el6.x86_64.rpm && rpm -ih mysql-community-client-5.7.16-1.el6.x86_64.rpm && rpm -ih mysql-community-server-5.7.16-1.el6.x86_64.rpm && mysqld --initialize --user=mysql --datadir=/home/data/mysql && chown -R mysql:mysql /usr/lib64/mysql && chown -R mysql:mysql /usr/share/mysql
    - require:
      - file: mysql-copy
      - file: mysql-config
