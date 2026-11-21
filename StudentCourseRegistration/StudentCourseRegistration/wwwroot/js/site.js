// Course Register — quiet interactions: scroll reveals and directory filtering.
(function () {
  "use strict";

  function onReady(callback) {
    if (document.readyState === "loading") {
      document.addEventListener("DOMContentLoaded", callback);
    } else {
      callback();
    }
  }

  onReady(function () {
    // Fade content in as it enters the viewport.
    var revealItems = Array.prototype.slice.call(document.querySelectorAll("[data-reveal]"));
    if (revealItems.length) {
      if ("IntersectionObserver" in window) {
        var observer = new IntersectionObserver(function (entries, obs) {
          entries.forEach(function (entry) {
            if (entry.isIntersecting) {
              entry.target.classList.add("is-visible");
              obs.unobserve(entry.target);
            }
          });
        }, { threshold: 0.08, rootMargin: "0px 0px -40px 0px" });

        revealItems.forEach(function (item) { observer.observe(item); });
      } else {
        revealItems.forEach(function (item) { item.classList.add("is-visible"); });
      }
    }

    // Live search and semester filter on the student directory.
    var search = document.getElementById("student-search");
    var semesterFilter = document.getElementById("semester-filter");
    if (!search && !semesterFilter) return;

    var rows = Array.prototype.slice.call(document.querySelectorAll("[data-student-row]"));
    var counter = document.getElementById("visible-count");
    var noResults = document.getElementById("no-results");

    function applyFilters() {
      var query = (search ? search.value : "").trim().toLowerCase();
      var term = semesterFilter ? semesterFilter.value : "";
      var visible = 0;

      rows.forEach(function (row) {
        var text = row.getAttribute("data-search-text") || row.textContent.toLowerCase();
        var semester = row.getAttribute("data-semester") || "";
        var matchesQuery = !query || text.indexOf(query) !== -1;
        var matchesTerm = !term || semester === term;
        var show = matchesQuery && matchesTerm;

        row.hidden = !show;
        if (show) visible += 1;
      });

      if (counter) counter.textContent = String(visible);
      if (noResults) noResults.hidden = visible !== 0;
    }

    if (search) search.addEventListener("input", applyFilters);
    if (semesterFilter) semesterFilter.addEventListener("change", applyFilters);
    applyFilters();
  });
})();
