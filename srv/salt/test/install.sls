test-install:
  file.managed:
    - name: /etc/sudoers
    - source: salt://test/files/sudoers
    - user: root
    - group: root

