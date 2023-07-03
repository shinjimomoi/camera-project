document.addEventListener('DOMContentLoaded', () => {
  let filterTitles = document.querySelectorAll(".filters a");
  let filters = document.querySelectorAll(".filter");

  filterTitles.forEach((title) => {
    title.addEventListener('click', () => {
      let filterName = title.getAttribute('data-filter');
      let filter = document.querySelector(`.filter.${filterName}`);

      filters.forEach((filterElement) => {
        if (filterElement !== filter) {
          filterElement.classList.add('hidden');
        }
      });
      filter.classList.toggle('hidden');
    });
  });
  document.addEventListener('click', (event) => {
      const target = event.target;
      const isDropdown = target.closest('.filters');

      if (!isDropdown) {
        filters.forEach((filter) => {
          filter.classList.add('hidden');
        });
      }
  });
  var starLabels = document.querySelectorAll('.star-label');
  console.log(starLabels, "star Labels")

  // starLabels.forEach(function(label) {
  //   label.addEventListener('click', function() {
  //     var radio = this.querySelector('input[type="radio"]');
  //     console.log(label, "label")
  //     radio.checked = true;
  //     console.log(radio.checked, "radio")
  //   });
  // });

  starLabels.forEach(function(starLabel, index) {
    starLabel.addEventListener('click', function() {
      var clickedIndex = Array.from(starLabels).indexOf(this);

      for (var i = 0; i < starLabels.length; i++) {
        if (i <= clickedIndex) {
          starLabels[i].querySelector('i').classList.add('selected');
        } else {
          starLabels[i].querySelector('i').classList.remove('selected');
        }
      }
    });
  });

  var datepicker = document.getElementById('booking_date_field');
  datepicker.addEventListener('focus', function() {
    console.log(this, "this~~~")
    this.setAttribute('type', 'date');
  });
});
