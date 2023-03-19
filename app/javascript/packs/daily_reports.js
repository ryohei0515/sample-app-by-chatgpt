document.addEventListener("turbolinks:load", function () {
  const addButton = document.getElementById("add-work-item");
  if (!addButton) return;

  const workItemTemplate = document.getElementById("work-item-template");
  const workItemsContainer = document.getElementById("work-items-container");

  addButton.addEventListener("click", function (event) {
    event.preventDefault();
    const newWorkItem = workItemTemplate.firstElementChild.cloneNode(true);
    workItemsContainer.appendChild(newWorkItem);
  });
});
