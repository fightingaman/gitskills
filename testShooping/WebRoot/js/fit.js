/**
 * Created by a on 2015/10/21.
 */
var eg = {};
eg.$ = function (id) {
    return document.getElementById(id);
};	
function nute() {
	var username=document.getElementById("username").value;
    if($.trim(username)!="")
    {
        $.ajax({
            url:"Userset",
            type:"post",
            data:{
          	  username:username
            },
            dataType:"json",
            success:function(data)
            {     	 
                 isFlag=data;   
                 //alert("isFlag"+isFlag);   
                 if (isFlag) {
             		eg.$("lable4").innerHTML = "用户已存在！";
             		return false;
             	} else  {
             		eg.$("lable4").innerHTML = '';
             	}
            },
            error:function(){
                alert("网络加载失败！");
            }
        });
    };
}
function na() {
      var username=document.getElementById("username").value;
      var userid=document.getElementById("userid").value;
      var phone=document.getElementById("phone").value;
      var email=document.getElementById("email").value;
      var password=document.getElementById("password").value;
        $.ajax({
        	async:false,
            url:"ajaxLogin",
            type:"post",
            data:{
            	username:username,
            	firstname:userid,
            	phone:phone,
            	email:email,
            	password:password
            },
            dataType:"json",
            success:function(data)
            {     
            	if(data)
            	{
                 alert('注册成功!');
                // window.open("login.jsp","_self");
            	}else{
            		alert('注册失败!');
            	}
            },
            error:function(){
                alert("网络加载失败！");
            }
        });
    }

eg.regCheck = function () {
	/**
	 * 验证
	 */
    if (eg.$("userid").value == '') {
    	 eg.$("lable1").innerHTML = "请输入姓名！";

        return false;
    }
    else {
        eg.$("lable1").innerHTML = "";
    }
    var a=eg.$('userid').value;
    for(var i=0;i< a.length;i++)
    {
        var b= a.charAt(i);
        if(!isNaN(b))
        {   
        	//alert('1');
        	
            eg.$("lable1").innerHTML = "请不要输入数字！";
            mui=1;
            break;
        }
        mui=0;
    }
     if (mui==1){                   //判断是否为数字
         return false;
    }
    else {
        eg.$("lable1").innerHTML = " ";
    }
     //用户唯一性验证
     //alert(eg.$("lable4").innerHTML);
     if(eg.$("lable4").innerHTML!="")
     {
     	 return false;
     }else{
    	 eg.$("lable1").innerHTML = "";
     }
    if(eg.$("username").value=='')
    {
        eg.$("lable4").innerHTML= "用户名不能为空！";
        return false;
    }
    else{
        eg.$("lable4").innerHTML='';
    }
   
    if (eg.$("email").value == '') {
        eg.$("Elable").innerHTML = "邮箱不能为空！";
        return false;
    }
    else {
        eg.$("Elable").innerHTML = "";
    }

    apos = eg.$("email").value.indexOf("@");
    point=eg.$("email").value.indexOf(".");
    dotpos = eg.$("email").value.lastIndexOf(".");
    if (apos < 1 || dotpos - apos < 2||point<1) {
        eg.$("Elable").innerHTML = "邮箱格式不正确";
        return false;
    }
    else {
        eg.$("email").innerHTML = "";
    }

    if (eg.$("password").value == '') {

        eg.$("lable2").innerHTML = "密码不能为空！";
        return false;
    }
    else {
        eg.$("lable2").innerHTML = "";
    }
    
    if (eg.$("password1").value == '') {

        eg.$("lable3").innerHTML =  "确认密码不能为空！";
        return false;
    }
    else {
        eg.$("lable3").innerHTML = "";
    }
    if (eg.$("password").value != eg.$("password1").value) {

        eg.$("lable3").innerHTML = "两次密码不一致！";
        return false;
    }
    else {
        eg.$("lable3").innerHTML = "";
        //return true;
        na();
    }
    

    //var cage = eg.$("age");
    //if (cage.value == "0") {
    //    //cage.focus();
    //    eg.$("lable5").innerHTML = "请选择年龄！";
    //
    //    return false;
    //}
    //else {
    //    eg.$("lable5").innerHTML = "";
    //}
    //var likes = document.getElementsByClassName("like");
    //var likenum = 0;
    //for (var i = 0; i < likes.length; i++) {
    //    if (likes[i].checked)
    //        likenum++;
    //}
    /**
    if (likenum == 0) {
        eg.$("lable6").innerHTML = "请选择至少一个！";

        return false;
    }
    else {
        eg.$("lable6").innerHTML = "";
        return true;
    }
    */

};

