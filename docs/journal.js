/* 2023-06-22 ebb with srr and tsa 
 * This JS is to show and hide gloss entries on user interaction with highlighted named entities
 * 
 * SI gloss entries are coded in div element like this with @class="si" and id attributes
 *  <div class="si on" id="Burney_SH">
 *  
 * We need to match on the @id attribute in order to show (unhide) the gloss entry.
 * 
 * Elements with glosses to reveal are coded like this: 
 * <span class="persName gloss" data-gloss="#Burney_SH"><a href="#Burney_SH">Miss
                              Burney</a></span>
                               
 * On mouse-enter (or click) of the span, JS will read the @data-gloss attribute, and cut the string after the '#" to 
 * locate its matching si entry. It will then add a class 'on' to the si entry to display.
 * 
 * A toggle-off function will be necessary to hide the element again. This can simply look for any si entries wtih a class "on"
 * and remove the class. 
 * Our JS is adapted from Piper Baron's Poems project.
 *   */
 
 window.onload = init;
const highlights = document.getElementsByClassName("gloss");
const entries = document.getElementsByClassName("si");

function init() {
    for (var i = 0; i < highlights.length; i++) {
        highlights[i].addEventListener('mouseover', toggle, false);
        highlights[i].addEventListener('mouseleave', toggleOff, false);
        highlights[i].addEventListener('click', toggle, false);
        highlights[i].addEventListener('touchenter', toggle, false);
    }
   
}

function toggle() {
/* First, we'll fire the toggleOff which removes the "on" class from any displaying entries to clean off the page. */
toggleOff()
/* Then we show the gloss entry associated with "this", which is literally the highlighted element
 *  the user clicked on or visited  */
    var idVal = this.getAttribute("data-gloss").split("#")[1];
     /* test whether the id matches THIS substring after # */
    var entry = document.getElementById(idVal)
    /* I think we're getting errors in the console when JS fails to locate a matching entry element. */
    entry.classList.toggle("on");
}
    
function toggleOff()
/* Test each one to see if it has a class of "on". If it does, shut it off. */
{let displays = document.getElementsByClassName("on")
for (var i = 0; i < displays.length; i++) {
    displays[i].classList.remove("on");
    }
}

   
   
  

