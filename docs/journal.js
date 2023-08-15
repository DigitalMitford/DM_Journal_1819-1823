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
/*const showButton = document.getElementById("showAll")*/
/* 2023-08-15 ebb with srr and tsa: We seem to be missing a button with id="showAll" at this point. 
 * In the HTML this would be <button id="showAll"/>  */
   /* showButton.addEventListener('click', showAll, false);*/
    /* The line above triggers an event listener on click of the button. 
     * On a second click the function automatically toggles off, a feature of the classList toggle in JS.  */
    for (var i = 0; i < highlights.length; i++) {
        highlights[i].addEventListener('mouseover', toggle, false);
        /*highlights[i].addEventListener('mouseleave', toggleOff, false);*/
        highlights[i].addEventListener('click', toggle, false);
        highlights[i].addEventListener('touchenter', toggle, false);
    }
   
}

/* ebb" Currently this is not firing because there's no button. It shouldn't cause problems to be here though.  */
function showAll() {
    /* Look for everything that's a gloss entry and display them all. 
     * Maybe we want to say on a second click of this button, shut this off. */
     /* Look at the options in w3schools on how to change the font-size with JS: 
      * https://www.w3schools.com/jsref/prop_style_fontsize.asp  */
     for (var i = 0; i < entries.length; i++) {
     entries[i].style.fontSize = 'smaller';
     /* Maybe we don't need to change the size with JS. Just change it to be smaller across the site in CSS. */
     entries[i].classList.toggle("on");
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

   
   
  

