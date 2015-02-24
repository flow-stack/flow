accessing
confFiles
  ^ (FileDirectory default / 'conf') entries
    select: [ :e | e name endsWith: 'conf' ]