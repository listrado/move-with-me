const journeyMatchQueryTemplate = (journeyMatchObject) => {
  return `journey_match[departure_address]=${journeyMatchObject.departure_address}&journey_match[destination_address]=${journeyMatchObject.destination_address}&journey_match[diference_in_minutes]=${journeyMatchObject.diference_in_minutes}&journey_match[start_at]=${journeyMatchObject.start_at}`;
};

const initJourneyMatchesForm = () => {
  // find journey matches form
  const journeyMatchDisplay = document.querySelector('#journey-match-display');
  const journeyMatchForm = journeyMatchDisplay.closest('form');
  const inputs = journeyMatchForm.querySelectorAll('.form-group');
  // if one was found

  const updateForm = (event) => {
    // console.log(`updateForm event listener applied to ${event.currentTarget}`)
    if (event.currentTarget.value != '') {
      //console.log(event.currentTarget.value)


      // console.log(inputs[4].childNodes)


      const journeyMatch = {
        'departure_address': inputs[0].childNodes[1].childNodes[0].value,
        'destination_address': inputs[1].childNodes[1].childNodes[0].value,
        'start_at': inputs[1].childNodes[1].value
      };

      // console.log(journeyMatch)

      Rails.ajax({
        type: "GET",
        url: `/journey_matches/find?${journeyMatchQueryTemplate(journeyMatch)}`,
        success: function (repsonse) {
          '...'
        },
        error: function (repsonse) {
          '...'
        }
      })
    };
  };

  // Rails.ajax GET journey_matches_find 


  // add the relevant listener
  inputs.forEach((input) => {
    // input.querySelector('input')
    if (input.childNodes[1]) {
      input.childNodes[1].addEventListener('blur', updateForm);
    };
  });


  // ...	
  // debugger
};

export {
  initJourneyMatchesForm
};