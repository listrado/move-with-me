import "bootstrap";
import "jquery";

import {
    initMapbox
} from '../plugins/init_mapbox';
import {
    initJourneyMatchesForm
} from '../components/journey_matches_form'

initMapbox();
initJourneyMatchesForm();

// app/javascript/packs/application.js
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
