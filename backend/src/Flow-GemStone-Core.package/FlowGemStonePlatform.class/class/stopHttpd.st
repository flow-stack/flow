actions
stopHttpd
  (GemServerRegistry gemServerNamed: self flowServerName)
    stopGems;
    unregister