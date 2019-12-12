import "bootstrap";
import "jquery";


import "../plugins/flatpickr"
import {
    initMapbox
} from '../plugins/init_mapbox';
import {
    initJourneyMatchesForm
} from '../components/journey_matches_form'
import {
    initShowMessageLink
} from '../components/show_message_link'

import {
    initTimeOffsetDisplay
} from '../components/time-offset-display'

import {
    initTimeOffsetGet
} from '../components/time-offset-get'

initTimeOffsetGet();
initMapbox();
initJourneyMatchesForm();
initShowMessageLink();
initTimeOffsetDisplay();

// app/javascript/packs/application.js
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
