document.addEventListener('DOMContentLoaded', () => {
  let filterTitles = document.querySelectorAll(".filters p");
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
});
