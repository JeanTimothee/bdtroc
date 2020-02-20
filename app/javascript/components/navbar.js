const scrolledNav = () => {
  const navbar = document.querySelector('#js-scroll-navbar');
  const balance = document.querySelector('#js-navbar-balance');
  const buttons = document.querySelectorAll('#js-btn-white');
  const navbarSearch = document.querySelector('#js-navbar-search');
  const bannerSearch = document.querySelector('#js-banner-search');
  const navbarBrand = document.querySelector('#js-navbar-brand');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 460) {
        navbarSearch.classList.remove('d-none');
        navbar.classList.remove('bg-transparent');
        buttons.forEach(button => {
          button.classList.remove('white-btn')
        })
        if (balance) {
          balance.classList.remove('text-white');
          balance.classList.remove('border-white');
        }
      } else {
        navbarSearch.classList.add('d-none');
        navbar.classList.add('bg-transparent');
        buttons.forEach(button => {
            button.classList.add('white-btn')
        })
        if (balance) {
          balance.classList.add('text-white');
          balance.classList.add('border-white');
        }
      }

      if (window.scrollY >= 200) {
        navbarSearch.classList.remove('d-none');
        bannerSearch.classList.add('d-none');
        navbarBrand.classList.remove('flex-grow-1');
      } else {
        navbarSearch.classList.add('d-none');
        bannerSearch.classList.remove('d-none');
        navbarBrand.classList.add('flex-grow-1');
      }
    });
  }
}



export { scrolledNav }
