"serviceWorker"in navigator&&navigator.serviceWorker.register("sw.js").then(e=>{console.log("Service Worker registered: ",e)}).catch(e=>{console.error("Error registering the Service Worker: ",e)});const nav=document.querySelector("#nav2"),navTop=nav.offsetTop;function stickyNavigation(){window.scrollY>=navTop?(document.body.style.paddingTop=nav.offsetHeight+"px",document.body.classList.add("fixed-nav")):(document.body.style.paddingTop=0,document.body.classList.remove("fixed-nav"))}function openNav(){document.getElementById("nav3").style.display="block";const e=["skiptocontent","title-div","main","manuscript-div","journal-div","credits-div","credits1-div","credits2-div","footer-div"];for(const t of e)null!==document.getElementById(t)&&(document.getElementById(t).style.display="none")}function closeNav(){document.getElementById("nav3").style.display="none";const e=["skiptocontent","title-div","main","manuscript-div","journal-div","credits-div","credits1-div","credits2-div","footer-div"];for(const t of e)null!==document.getElementById(t)&&(document.getElementById(t).style.display="block")}window.addEventListener("scroll",stickyNavigation);const menu=document.getElementById("nav1");menu.addEventListener("keydown",handleKeydown),menu.addEventListener("focusin",handleFocusIn);const lastMenuItem=Array.from(menu.querySelectorAll('[role="menuitem"]')).pop(),topLevelItems=Array.from(menu.querySelectorAll("[aria-haspopup]"));function handleFocusIn(e){e.target.attributes["aria-haspopup"]&&Array.from(menu.querySelectorAll("[aria-haspopup]")).filter(t=>t!==e.target).forEach(e=>{e.checked=!1})}function handleKeydown(e){const t=Object.freeze({TAB:9,RETURN:13,ESC:27,SPACE:32,PAGEUP:33,PAGEDOWN:34,END:35,HOME:36,LEFT:37,UP:38,RIGHT:39,DOWN:40}),r=e.target;let o=null;switch(e.keyCode){case t.DOWN:if(e.preventDefault(),r.attributes["aria-haspopup"]&&"true"===r.attributes["aria-haspopup"].value)if(r.checked){r.parentElement.querySelector('[role="menuitem"]').focus()}else r.checked=!0;else if(r.attributes.role&&"menuitem"===r.attributes.role.value){getNextElement(Array.from(r.closest("ul").querySelectorAll('[role="menuitem"]')),r).focus()}break;case t.UP:if(e.preventDefault(),r.attributes["aria-haspopup"]&&"true"===r.attributes["aria-haspopup"].value&&r.checked)r.checked=!1;else if(r.attributes.role&&"menuitem"===r.attributes.role.value){const e=getPreviousElement(Array.from(r.closest("ul").querySelectorAll('[role="menuitem"]')),r);if(e===r){const e=r.closest(".dropdown").querySelector("input");e.checked=!1,e.focus()}else e.focus()}break;case t.LEFT:if(e.preventDefault(),r.attributes["aria-haspopup"])o=r;else{if(!r.attributes.role||"menuitem"!==r.attributes.role.value)break;o=r.closest(".dropdown").querySelector("input")}const a=getPreviousElement(topLevelItems,o);a.attributes["aria-haspopup"]&&"true"===a.attributes["aria-haspopup"].value?a.checked=o.checked:a.checked=!1,a.focus();break;case t.RIGHT:if(e.preventDefault(),r.attributes["aria-haspopup"])o=r;else{if(!r.attributes.role||"menuitem"!==r.attributes.role.value)break;o=r.closest(".dropdown").querySelector("input")}const n=getNextElement(topLevelItems,o);n.attributes["aria-haspopup"]&&"true"===n.attributes["aria-haspopup"].value?n.checked=o.checked:n.checked=!1,n.focus();break;case t.RETURN:r.attributes["aria-haspopup"]&&"true"===r.attributes["aria-haspopup"].value&&(r.checked=!r.checked);break;case t.TAB:if(e.target===lastMenuItem){Array.from(menu.querySelectorAll("[aria-haspopup]")).pop().checked=!1}break;case t.ESC:let i;r.attributes["aria-haspopup"]?i=r:r.attributes.role&&"menuitem"===r.attributes.role.value&&(i=r.closest(".dropdown").querySelector("input")),i.checked=!1,i.focus()}}function getNextElement(e,t){const r=e.findIndex(e=>e==t);return e[Math.min(r+1,e.length-1)]}function getPreviousElement(e,t){const r=e.findIndex(e=>e==t);return e[Math.max(r-1,0)]}function AddRelNoopener(){for(var e=document.querySelectorAll("a"),t=0;t<e.length;t++)e[t].setAttribute("rel","noopener")}AddRelNoopener();const terminationEvent="onpagehide"in self?"pagehide":"unload";addEventListener(terminationEvent,e=>{},{capture:!0});