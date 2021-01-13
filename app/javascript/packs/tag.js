if (location.pathname.match("messages/new")){
  document.addEventListener("DOMContentLoaded", () => {
    const inputElement = document.getElementById("form-tag");
    inputElement.addEventListener("keyup", () => {
      const keyword = document.getElementById("form-tag").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const tagName = XHR.response.keyword;
        const searchResult = document.getElementById("form-tag");
        tagName.forEach((tag) => {
          const childElement = document.createElement("div");
          childElement.setAttribute("class", "child");
          childElement.setAttribute("id", tag.id);
          childElement.innerHTML = tag.name;
          searchResult.appendChild(childElement);
        });
      };
    });
  });
};