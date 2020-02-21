import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"



const initFlatPickr = () => {

  const disableRangeDate = []

  const calendarForm = document.getElementById('calendar-form')
  if(calendarForm) {
    const bookings = calendarForm.dataset.bookings;
    JSON.parse(bookings).forEach((element) => {
      const obj = {};
      obj.from = element.start_date;
      obj.to = element.end_date;
      disableRangeDate.push(obj);
    });


    flatpickr("#start-date", {
      altInput: true,
      inline: true,
      mode: "range",
      minDate: new Date().fp_incr(1),
      showMonths: 2,
      "plugins": [new rangePlugin( { input: "#end-date"})],
      disable: disableRangeDate
    });

  }

}

export { initFlatPickr };
