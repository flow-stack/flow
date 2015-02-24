actions
confFrom: aDirectoryEntry
  ^ [ 
  (BinaryOrTextFile openRead: aDirectoryEntry fullName) contentsOfEntireFile
    evaluate ]
    on: Error
    do: [ :x | 'configuration error' ]