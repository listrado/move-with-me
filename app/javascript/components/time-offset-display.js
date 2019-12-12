import * as moment from "moment";

const initTimeOffsetDisplay = () => {
  const timeLocal = (display) => {
    const now = new Date;
    const offset = Number(now.getTimezoneOffset(), 10) / 60;
    const createdAt = display.dataset.createdAt
    const time = moment(createdAt).subtract(offset, 'hours').fromNow();;
    return time;
  };
  window.timeLocal = timeLocal;

  const timeOffsetDisplays = document.querySelectorAll('.time-offset-display');
  timeOffsetDisplays.forEach((display) => {
    display.innerText = timeLocal(display);
  })
}

export { initTimeOffsetDisplay };
