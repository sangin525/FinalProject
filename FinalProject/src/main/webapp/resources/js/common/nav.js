function toggleNav() {
  var myNav = document.getElementById("myNav");
  if (myNav.style.height === "0%") {
    myNav.style.height = "30%";
  } else {
    myNav.style.height = "0%";
  }
}