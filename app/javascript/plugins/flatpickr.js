import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

flatpickr(".datepicker", {
    enableTime: true,
    altInput: true,
    minDate: "today",
    altFormat: "F j, Y at h:i K",
    dateFormat: "Y-m-d H:i",
    defaultHour: 23,
    defaultMinute: 0,
    minuteIncrement: 30

})