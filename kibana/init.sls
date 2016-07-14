{% from "kibana/map.jinja" import kibana with context %}

kibana:
  pkg.installed:
    - name: {{ kibana.lookup.pkg }}

  service.running:
    - name: kibana
    - enable: True
    - require:
      - pkg: kibana

  pkgrepo.managed:
    - humanname: Elasticsearch Kibana
    - name: deb http://packages.elastic.co/kibana/4.5/debian stable main
    - dist: stable
    - file: /etc/apt/sources.list.d/kibana.list
    - keyid: D88E42B4
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: kibana
