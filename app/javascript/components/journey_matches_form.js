
const initJourneyMatchesForm = () => {
  // find journey matches form
  const journeyMatchDisplay = document.querySelector('#journey-match-display');
  const journeyMatchForm = journeyMatchDisplay.closest('form');
  const inputs = journeyMatchForm.querySelectorAll('.form-group')
  // if one was found

  const updateForm = (event) => {

      // console.log(`updateForm event listener applied to ${event.currentTarget}`)
    if (event.currentTarget.value != '') {
      console.log(event.currentTarget.value)
    };
  };

  // add the relevant listener
  inputs.forEach( (input) => {
    // input.querySelector('input')
    if (input.childNodes[1]) {
      input.childNodes[1].addEventListener('blur', updateForm);
    };
  });

  
  // ...	
  // debugger
};

export { initJourneyMatchesForm };
