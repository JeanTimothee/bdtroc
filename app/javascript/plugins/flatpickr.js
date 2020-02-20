import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

// flatpickr(".datepicker-start", {
//   altInput: true,
//   altFormat: "F j, Y",
//   dateFormat: "Y-m-d",
//   defaultDate: new Date().fp_incr(1),
//   minDate:
// });


// flatpickr(".datepicker-end", {
//   altInput: true,
//   altFormat: "F j, Y",
//   dateFormat: "Y-m-d",
//   defaultDate: new Date().fp_incr(4),
//   minDate:
//   maxDate:
// });

const disableRangeDate = []
function booked() {
const bookings = document.getElementById('calendar-form').dataset.bookings;
  JSON.parse(bookings).forEach((element) => {
    const obj = {};
    obj.from = element.start_date;
    obj.to = element.end_date;
    disableRangeDate.push(obj)
  });
}
booked();

flatpickr("#start-date", {
  altInput: true,
  inLine: true,
  mode: "range",
  // defaultDate: new Date().fp_incr(1),
  minDate: new Date().fp_incr(1),
  showMonths: 2,
  "plugins": [new rangePlugin( { input: "#end-date"})],
  disable: disableRangeDate
});
