  function check(name,reg,spanId,successinfo,errorinfo,info){
   		var flag; 
   		var val = document.getElementsByName(name)[0];
   		var oSpanNode = document.getElementById(spanId);
   		
/*   		if(val==""){
			oSpanNode.innerHTML = info.fontcolor("red");
     	}*/
    	if(!reg.test(val.value)){
/*    		alert(val=="");*/
    		if(val.value==""){
    			val.value = info;
         	}
    		else{
    		oSpanNode.innerHTML = errorinfo.fontcolor("red");
    		flag = false;
    		}
    	}
    	else{
    		oSpanNode.innerHTML = successinfo.fontcolor("green");
    		flag = true;
    	}
    	return flag;
   }
   
   function checkName(){
   		var reg =  /^[\u4e00-\u9fa5]{1,7}$/;
   		if(check("username",reg,"user_msg","用户名正确","用户名格式不正确，必须是1-7位的中文","用户名为1-7位的中文")){
   			return true;
   		}
   		else
   			return false;
   			
   }
   
   function checkPwd(){
   		var reg=/\w{5,10}/;
   		if(check("userpass",reg,"pwd_msg","密码正确","密码格式不正确，必须是5-10位的英文或数字","12345678"))
   			return true;
   		else
   			return false;
   }
   
   function checkPwd1(){
   		if(userinfo.userpass.value != userinfo.userpass1.value){
   				document.getElementById("pwd1_msg").innerHTML = "两次密码不一致".fontcolor("red");
   				return false;
   		}
   		else{
   		document.getElementById("pwd1_msg").innerHTML = "两次密码一致".fontcolor("green");
   		return true;
   		}
   }
   
   
   function checkEmail(){
   		var reg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
   		if(check("email",reg,"email_msg","邮箱正确","邮箱格式不正确,例如26357878@126.com","例如：26357878@126.com")){
   			return true;
   		}
   		else
   			return false;
   }
   
   function checkBir(){
   		var reg = /^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$/;
   		if(check("birthday",reg,"bir_msg","格式正确","格式不正确,例如1991-01-01","例如：1991-01-01")){
   			return true;
   		}
   		else
   			return false;
   }
   
   function checkPhone(){
	   var reg = /^1[3|4|5|8][0-8]\d{4,8}$/;
	   if(check("phone",reg,"tel_msg","格式正确","格式不正确，手机号码必须是11位的数字","例如：13684139863"))
		   return true;
	   else
  			return false;
   }
   
   function checkForm(){
   		if(checkName()&&checkPwd()&&checkPwd1()&&checkEmail()&&checkBir()&&checkPhone()){
   			documentgetElementsByClassName("img_1-1")[0].src="./images/img_1-2.png";
 
   			return true;
   		}
   		else
   			return false;
   }
   
   function selectCity(){
	   var collCities = [[],['杭州西湖','乌镇','千岛湖','普陀山','南浔古镇'],
	                     ['峨眉之秀','青城之幽','剑门之险','竹海之翠','九寨之奇'],
	                     ['凤凰古城','张家界','武陵源','衡山','岳阳楼'],
	                     ['丽江古城','香格里拉','西双版纳','玉龙雪山','哈尼梯田'],
	                     ['三亚','大小洞天','南山','槟榔谷','分界洲岛'],
	                     ['庐山','三清山','龙虎山','瑶里古镇','武功山'],
	                     ['千户苗寨','黄果树瀑布','织金洞','镇远古镇','遵义会议会址'],
	                     ['漓江','阳朔','北海银滩','涠洲岛','龙胜梯田'],
	                     ['周庄古镇','拙政园','瘦西湖','苏州太湖','鼋头渚'],
	                     ['布达拉宫','大昭寺','纳木错','唐古拉山-怒江源','雅鲁藏布大峡谷']];
	   
	   var oSelNode = document.getElementById("selid");
	   var oSubSelNode = document.getElementById("subselid");
	   var index = oSelNode.selectedIndex;
	   var arrCities = collCities[index];
	   
	 /*  for(var y=0;y<oSubSelNode.options.length;y++){
		   oSubSelNode.removeChild(oSubSelNode.options[y]);
	   }*/
	   oSubSelNode.length = 0;
	   
	   
	   for(var x=0; x<arrCities.length;x++ ){
		   var oOptNode = document.createElement("option");
		   oOptNode.innerHTML = arrCities[x];
		   oSubSelNode.appendChild(oOptNode);
	   }
	   
   }

   function destroyName(){
	   var x = document.getElementById("loginname");
	  /* if(count==0){
		   x.value="";
		   count++;
	   }*/
	   if("用户名为1-7位的中文"==x.value){
		   x.value="";
	   }
		   
   }
   
   function destroyPwd(){
	   var x = document.getElementById("pwd");
	   if("12345678"==x.value){
		   x.value="";
	   }
   }
   
   function destroyEmail(){
	   var x = document.getElementById("email");
	   if("例如：26357878@126.com"==x.value){
		   x.value="";
	   }
   }
   
   function destroyPhone(){
	   var x = document.getElementById("telephone");
	   if("例如：13684139863"==x.value){
		   x.value="";
	   }
   }
   
   function destroyBir(){
	   var x = document.getElementById("birthday");
	   if("例如：1991-01-01"==x.value){
		   x.value="";
	   }
   }