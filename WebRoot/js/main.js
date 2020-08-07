 var shade1up = 1;
    var shade2up = 0;
    var shade3up = 0;
    var max=10;
    var mod=7;
    var min=3;
    var big=13;
    function change1()
    {
    	shade1up=1;
    	shade2up =0;
        shade3up = 0; 
    }
    function change2()
    {
    	shade1up=0;
    	shade2up = 1;
        shade3up = 0;
    }
    function change3()
    {
    	shade1up=0;
    	shade2up = 0;
        shade3up = 1;
    }
	$(function() {		
		setInterval(function(){
			if(shade1up){
		    $("#d1").css("z-index",max);
		    $("#d2").css("z-index",mod);
		    $("#d3").css("z-index",min);
		    
		    $("#b1").css("background-color","#00ccff");
			$("#b2").css("background-color","");
			$("#b3").css("background-color","");
//			jQuey--fadeOut
			$("#d1").fadeOut(3000,function(){
				$("#d1").css("z-index",min);
				shade1up = 0; 
				shade2up = 1;
				
				$("#d1").fadeIn(3000);					
			});
			}
			if(shade2up){
				$("#d2").css("z-index",max);
				$("#d3").css("z-index",mod);
				$("#d1").css("z-index",min);
				
				$("#b1").css("background-color","");
				$("#b2").css("background-color","#00ccff");
				$("#b3").css("background-color","");
				$("#d2").fadeOut(3000,function(){
					$("#d2").css("z-index",min);
					shade2up = 0;
					shade3up = 1;
					$("#d2").fadeIn(3000);
				});		
			}
			if(shade3up){
				$("#d3").css("z-index",max);				
				$("#d1").css("z-index",mod);
				$("#d2").css("z-index",min);
				
				$("#b1").css("background-color","");
				$("#b2").css("background-color","");
				$("#b3").css("background-color","#00ccff");
				$("#d3").fadeOut(3000,function(){
					$("#d3").css("z-index",min);
					shade3up = 0;
					shade1up = 1;
					$("#d3").fadeIn(3000);
				});	
			}
			
		},1000)
		
		
	});

//下拉框
	window.onload=menuFix;
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
  

function mouseoverroot(over,big){
//改变宽度
    			var width1 = over.getAttribute("width");
    			var widths = width1.replace("px","");		
    			var width2 = parseFloat(widths)+2;			
    			over.setAttribute("width",width2+"px");			
    			//改变高度
    			var height1 = over.getAttribute("height");			
    			var heights=height1.replace("px","");
    			var height2 = parseFloat(heights)+2;			
    			over.setAttribute("height",height2+"px");			
    			//改变y坐标
    			var top = over.style.top;
    			var tops = top.replace("px","");
    			over.style.top = parseFloat(tops)-1+"px";
    			console.log(over.style.top);
    			//改变x坐标
    			var left = over.style.left;
    			lefts = left.replace("px","");
    			over.style.left = parseFloat(lefts)-1+"px";	
    			if(heights>=400){
    				clearInterval(big);
    				big="";
    				}
}
function mouseoutroot(out,short){
//改变宽度				
    			var width1 = out.getAttribute("width");	
    			var widths = width1.replace("px","");	
    			var width2 = parseFloat(widths)-2;			
    			out.setAttribute("width",width2+"px");			
    			//改变高度		
    			var height1 = out.getAttribute("height");			
    			var heights=height1.replace("px","");
    			var height2 = parseFloat(heights)-2;			
    			out.setAttribute("height",height2+"px");			
    			//改变y坐标
    			var top = out.style.top;
    			var tops = top.replace("px","");
    			out.style.top = parseFloat(tops)+1+"px";
    			console.log(out.style.top);
    			//改变x坐标
    			var left = out.style.left;
    			lefts = left.replace("px","");
    			out.style.left = parseFloat(lefts)+1+"px";	
    			if(heights<=267){
    				clearInterval(short);
    				short="";
    			}
}



    var lefts;
    var big1;
    var big2;
    var big3;
    var big4;
    var short1;
    var short2;
    var short3;
    var short4;
    function mouseover1(over){
    	var n = 0;
    	//setInterval: set time
    	big1 = setInterval(function(){
    		n++;
    		if(n%2==0){
    			mouseoverroot(over,big1);
    			
    		}	
    	},5);
    	
    }

    
    function mouseout1(out){
    	clearInterval(big1);
    	var n = 0;  	
    	var short1 = setInterval(function(){
    		n++;
    		if(n%2==0){
    			mouseoutroot(out,short1);
    		}	
    	},5);
    	
    }
    
	function mouseover2(over){
	    	var n = 0;
	    	big2 = setInterval(function(){
	    		n++;
	    		if(n%2==0){
	    			mouseoverroot(over,big2);
	    			
	    		}	
	    	},5);
	    	
	    }

    
    function mouseout2(out){
    	clearInterval(big2);
    	var n = 0;  	
    	var short2 = setInterval(function(){
    		n++;
    		if(n%2==0){
    			mouseoutroot(out,short2);
    		}	
    	},5);
    	
    }
    
function mouseover3(over){
    	var n = 0;
    	big3 = setInterval(function(){
    		n++;
    		if(n%2==0){
    			mouseoverroot(over,big3);
    			
    		}	
    	},5);
    	
    }

    
    function mouseout3(out){
    	clearInterval(big3);
    	var n = 0;  	
    	var short3 = setInterval(function(){
    		n++;
    		if(n%2==0){
    			mouseoutroot(out,short3);
    		}	
    	},5);
    	
    }

function mouseover4(over){
    	var n = 0;
    	big4 = setInterval(function(){
    		n++;
    		if(n%2==0){
    			mouseoverroot(over,big4);
    			
    		}	
    	},5);
    	
    }

    
    function mouseout4(out){
    	clearInterval(big4);
    	var n = 0;  	
    	var short4 = setInterval(function(){
    		n++;
    		if(n%2==0){
    			mouseoutroot(out,short4);
    		}	
    	},5);
    	
    }


    function imgmouseoverroot(rise,id){
    var risetop = $(rise).css("top");
			var riseheight = $(rise).css("height");
			var riseopa = $(rise).parent().children("p").css("opacity");
			var height = riseheight.replace("px", "");
			var top = risetop.replace("px", "");
			$(rise).css("top", --top + "px");
			$(rise).css("height", ++height + "px");
			$(rise).parent().children("p").css("opacity",
					(parseFloat(riseopa) + 0.03));
			/*
			var height=parseFloat(rise.style.height.substr(0,2));
			var top = parseFloat(rise.style.top.substr(0,3));
			rise.style.height=height+1+"px";
			rise.style.top = top-1+"px";
			 */
			if (height >= 130) {
				clearInterval(id);
				id = "";
}
}

function imgmouseoutroot(down,id){
var downheight = $(down).css("height");
			var height = downheight.replace("px", "");
			$(down).css("height", --height + "px");
			var downtop = $(down).css("top");
			var top = downtop.replace("px", "");
			$(down).css("top", ++top + "px");
			var downopa = $(down).parent().children("p").css("opacity");
			$(down).parent().children("p").css("opacity",
					parseFloat(downopa) - 0.03);
			if (height <= 30) {
				clearInterval(id);
				id= "";
			}
}
    var rise1;
    var rise2;
    var rise3;
    var rise4;
    var rise5;
    var down1;
    var down2; 
    var down3; 
    var down4;
    var down5;  
	function imgmouseover1(rise) {
		clearInterval(down1);
		rise1 = setInterval(function() {
			imgmouseoverroot(rise,rise1);
			
		}, 5);
	}
	function imgmouseout1(down) {
		clearInterval(rise1);
	        down1 = setInterval(function() {
			imgmouseoutroot(down,down1);
		}, 5);
	}

function imgmouseover2(rise) {
		clearInterval(down2);
		rise2 = setInterval(function() {
			imgmouseoverroot(rise,rise2);
			
		}, 5);
	}
	function imgmouseout2(down) {
		clearInterval(rise2);
	        down2= setInterval(function() {
			imgmouseoutroot(down,down2);
		}, 5);
	}

function imgmouseover3(rise) {
		clearInterval(down3);
		rise3 = setInterval(function() {
			imgmouseoverroot(rise,rise3);
			
		}, 5);
	}
	function imgmouseout3(down) {
			clearInterval(rise3);
	        down3= setInterval(function() {
			imgmouseoutroot(down,down3);
		}, 5);
	}
//第四张图片的动画移动
//鼠标移入
function imgmouseover4(rise) {
		clearInterval(down4);
		rise4 = setInterval(function() {
			imgmouseoverroot(rise,rise4);
			}, 5
			);
	}
function imgmouseout4(down) {
		clearInterval(rise4);
	        down4= setInterval(function() {
			imgmouseoutroot(down,down4);
		}, 5);
	}


function imgmouseover5(rise) {
		clearInterval(down5);
		rise5 = setInterval(function() {
			imgmouseoverroot(rise,rise5);
			
		}, 5);
	}
	function imgmouseout5(down) {
		clearInterval(rise5);
	        down5= setInterval(function() {
			imgmouseoutroot(down,down5);
		}, 5);
	}
//视频播放
	function iconvedio(){
		//选择该元素
		$("video").css("display","inline-block");
	}