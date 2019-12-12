const journeyMatchQueryTemplate = journeyMatchObject => {
  return `journey_match[departure_address]=${journeyMatchObject.departure_address}&journey_match[destination_address]=${journeyMatchObject.destination_address}&journey_match[diference_in_minutes]=${journeyMatchObject.diference_in_minutes}&journey_match[start_at]=${journeyMatchObject.start_at}`;
};

const initJourneyMatchesForm = () => {
  // find journey matches form
  const journeyMatchDisplay = document.querySelector("#journey-match-display");

  if (!journeyMatchDisplay) return;

  const journeyMatchForm = journeyMatchDisplay.closest("form");
  const matchDisplay = journeyMatchForm.querySelector("#journey-match-display");

  // if one was found

  const updateForm = event => {
    // console.log(`updateForm event listener applied to ${event.currentTarget}`)
    if (event.currentTarget.value != "") {
      // console.log(event.currentTarget.value)

      // console.log(inputs[4].childNodes)
      const journeyMatch = {
        departure_address: journeyMatchForm.querySelector("[name='journey_match[departure_address]']").value,
        destination_address: journeyMatchForm.querySelector("[name='journey_match[destination_address]']").value,
        start_at: journeyMatchForm.querySelector("[name='journey_match[start_at]']").value,
        diference_in_minutes: journeyMatchForm.querySelector("[name='journey_match[diference_in_minutes]']").value
      };

      // console.log(journeyMatch)

      Rails.ajax({
        type: "GET",
        url: `/journey_matches/find?${journeyMatchQueryTemplate(journeyMatch)}`,
        success: function (repsonse) {
          "...";
        },
        error: function (repsonse) {
          "...";
        }
      });
    }
  };

  // Rails.ajax GET journey_matches_find

  // add the relevant listener
  // inputs.forEach(input => {
  //   // input.querySelector('input')
  //   if (input.childNodes[1]) {
  //     input.childNodes[1].addEventListener("blur", updateForm);
  //   }
  // });

  journeyMatchDisplay.addEventListener('click', (event) => {
    const clickedElement = event.target;
    if (clickedElement.classList.contains('trigger-find-journey')) {
      updateForm(event);
    }
  })

  // journeyMatchDisplay.querySelector('.trigger-find-journey').addEventListener('click', (event) => {
  //   updateForm(event);
  // })

  // ...
  // debugger
};

export {
  initJourneyMatchesForm
};