#!/data/data/com.termux/files/usr/bin/bash

BUTTONS='
<style>
#scrollUpBtn,#scrollDownBtn{position:fixed;right:18px;width:46px;height:46px;border-radius:50%;background:#7A1F2B;color:#FFF;border:none;font-size:22px;cursor:pointer;box-shadow:0 3px 10px rgba(0,0,0,0.25);display:none;z-index:999;align-items:center;justify-content:center;transition:opacity 0.3s}
#scrollUpBtn{bottom:80px}
#scrollDownBtn{bottom:20px}
#scrollUpBtn:hover,#scrollDownBtn:hover{background:#5E1721}
#scrollUpBtn.show,#scrollDownBtn.show{display:flex}
@media(max-width:480px){#scrollUpBtn,#scrollDownBtn{width:42px;height:42px;font-size:20px;right:14px}}
</style>
<button id="scrollUpBtn" aria-label="উপরে যাও" title="উপরে যাও">↑</button>
<button id="scrollDownBtn" aria-label="নিচে যাও" title="নিচে যাও">↓</button>
<script>
(function(){
var upBtn=document.getElementById("scrollUpBtn");
var downBtn=document.getElementById("scrollDownBtn");
function updateButtons(){
var s=window.scrollY;
var t=document.documentElement.scrollHeight;
var w=window.innerHeight;
if(s>300){upBtn.classList.add("show")}else{upBtn.classList.remove("show")}
if(s+w<t-400){downBtn.classList.add("show")}else{downBtn.classList.remove("show")}
}
upBtn.addEventListener("click",function(){window.scrollTo({top:0,behavior:"smooth"})});
downBtn.addEventListener("click",function(){window.scrollTo({top:document.documentElement.scrollHeight,behavior:"smooth"})});
window.addEventListener("scroll",updateButtons);
window.addEventListener("resize",updateButtons);
updateButtons();
})();
</script>
'

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17; do
  if ! grep -q "scrollUpBtn" part-$i.html; then
    printf '%s\n' "$BUTTONS" >> part-$i.html
    echo "OK part-$i.html"
  else
    echo "SKIP part-$i.html"
  fi
done

if ! grep -q "scrollUpBtn" index.html; then
  printf '%s\n' "$BUTTONS" >> index.html
  echo "OK index.html"
else
  echo "SKIP index.html"
fi

echo "DONE"
