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
});
