actions
makeConfigurations
  ^ [ :dic | 
  self confFiles
    do: [ :filename | dic at: (self keyFrom: filename) put: (self confFrom: filename) ].
  dic ]
    value: Dictionary new