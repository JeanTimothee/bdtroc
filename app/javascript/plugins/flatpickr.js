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
function booked() {
const bookings = document.getElementById('test').dataset.bookings;
  JSON.parse(bookings).forEach((element) => {
    console.log(element.start_date);
    let start = element.start_date;
    let end = element.end_date;
    const booking = [start, end];
    return booking;
  });
}

flatpickr("#start-date", {
  altInput: true,
  mode: "range",
  // defaultDate: new Date().fp_incr(1),
  minDate: new Date().fp_incr(1),
  showMonths: 2,
  "plugins": [new rangePlugin( { input: "#end-date"})],
  disable: [
    {
      from: "2020-02-22",
      to: "2020-02_27"
    }
  ],
});

