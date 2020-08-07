window.onload =function(){menuFix()};
	function menuFix()
	{
		  var sfEles=document.getElementById("menu").getElementsByTagName("li"); 
		 
		  for(var i=0;i<sfEles.length;i++)
			  {
			  sfEles[i].onmouseover=function()
			     {
				  this.className="listshow";
				  //this.className+=(this.className.length>0?" ":"")+"listshow";
			     };
			  sfEles[i].onmouseout=function()
			     {
				  this.className="";
				  //this.className=this.className.replace("listshow","");
			     };
			  }
	}