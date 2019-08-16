const DomNodeCollection = require("./dom_node_collection");

 window.$l = (arg) => {
  switch (typeof arg) {
    case "object":
      if (arg instanceof HTMLElement) {
        return new DomNodeCollection([arg]);
      }
    case "string":
      return getNodes(arg);
    
  }
}



getNodes = selector => {
  const nodes = document.querySelectorAll(selector);
  const nodesArray = Array.from(nodes);
  return new DomNodeCollection(nodesArray);
}