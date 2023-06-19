document.addEventListener('DOMContentLoaded', () => {
  let filterTitles = document.querySelectorAll(".filters p");

  filterTitles.forEach((title) => {
    title.addEventListener('click', () => {
      let filterName = title.getAttribute('data-filter');
      let filter = document.querySelector(`.filter.${filterName}`);

      if (filter.classList.contains('hidden')) {
        filter.classList.remove('hidden');
      } else {
        filter.classList.add('hidden');
      }
    });
  });
});
