var myBurger = document.getElementById('nav-burger');
var myLinks = document.getElementById('nav-links');

myBurger.addEventListener('click', ()=> {
  myLinks.classList.toggle('is-active')
  myBurger.classList.toggle('is-active')
});
