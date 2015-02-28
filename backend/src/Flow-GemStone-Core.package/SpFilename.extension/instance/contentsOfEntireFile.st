*Flow-GemStone-Core
contentsOfEntireFile
  | stream |
  [ ^ (stream := self readStream) contents ]
    ensure: [ stream close ]