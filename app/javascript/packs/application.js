import "bootstrap";
import "jquery";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import "../plugins/flatpickr"
import {
    initMapbox
} from '../plugins/init_mapbox';
import {
    initJourneyMatchesForm
} from '../components/journey_matches_form'

initMapbox();
initJourneyMatchesForm();