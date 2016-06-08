window.onload=function (){
    if(document.getElementById("me").innerHTML!="欢迎您:")
    {
        // alert(document.getElementById("me").innerText);
       document.getElementById("li").style.display="block";
       document.getElementById("li2").style.display="block";
       document.getElementById("me1").style.display="none";
    }
    else{
      // alert(document.getElementById("me").innerHTML);
       document.getElementById("li").style.display="none";
       document.getElementById("li2").style.display="none";
       document.getElementById("me1").style.display="block"; 
    }
  };
function reset(){
   if(confirm("确定清空购物车吗？"))
   {
      return true;
   }
   else{
      return false;
   }
}

function out(){
      if(confirm("确定退出吗？"))
      {
      return true;
      }
      else{
        return false;
      }
    }

