---
# {{range vars}}
# {{.key}}: {{.value}}
# {{end}}
%{ for key, value in vars }${key}: ${value}
%{ endfor ~}