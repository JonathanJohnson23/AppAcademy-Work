class DomNodeCollection {
  constructor(nodes) {
    this.nodes = nodes;
  }
  html(html) {
    if (typeof html === "string") {
      this.each((node) => {
        node.innerHTML = html;
      });
    } else if (this.nodes.length > 0) {
      return this.nodes[0].innerHTML;
    }
  }
  empty() {
    this.html("");
  }

  append(outerHTML){
      if (outerHTML.length > 0){
         this.nodes.forEach(node => {
            outerHTML.forEach(html => {
               node.appendChild(html);
            })
         });
      }
  }
  
   children() {
   let childNodes = [];
   this.nodes.forEach(node => {
      const childNodeList = node.children;
      childNodes = childNodes.concat(Array.from(childNodeList));
   });
   return new DomNodeCollection(childNodes);
   }


  
}



module.exports = DomNodeCollection