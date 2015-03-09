define([
    'amber/deploy',
    // --- packages to be deployed begin here ---
    'amber-contrib-web/Web',   

    'text',
    'sightglass',
    'rlite',
    'rivets',

    'domevents/DOMEvents',

    'minimapless/MiniMapless',

    'amber-mvc/MVC-Core',
    
    'amber-flow/Flow-Core',
    'amber-flow/Flow-API',
    'flow-app/App'
    // --- packages to be deployed end here ---
], function (amber) {
    return amber;
});
