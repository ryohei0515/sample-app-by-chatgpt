document.addEventListener("DOMContentLoaded", () => {
  const addWorkItemLink = document.querySelector(".add_fields");
  if (addWorkItemLink) {
    addWorkItemLink.addEventListener("click", (event) => {
      event.preventDefault();
      const link = event.currentTarget;
      const id = new Date().getTime();
      const regexp = new RegExp(link.dataset.id, "g");
      const newFields = link.dataset.fields.replace(regexp, id);
      link.insertAdjacentHTML("beforebegin", newFields);
    });
  }
});
