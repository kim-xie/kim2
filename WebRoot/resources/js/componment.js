
var KimCmpFactory = function(type,callback){
	if(this instanceof KimCmpFactory){
		var obj = new this[type](callback);
		return this;
	}else{
		return new KimCmpFactory(type,callback);
	}
};

KimCmpFactory.arr = [];
KimCmpFactory.prototype = {
	clock:function(callback){
		$("body").append("<div id='kim_clockbox' class='ke_drag kim_clockbox'><span class='clock_overy'></span>"+
//		"	 <span id='clocktime' class='mr5'></span>"+
		"	    <div id='clockbox'>"+
		"	       	<div class='clock'>"+
		"				<div class='hclock'>"+
		"					<span class='hms'><img onerror='' class='hour' draggable='false' src= '"+basePath +"/resources/imgs/clock/clock_hour.png'/></span>"+
		"					<span class='hms'><img onerror='' class='minute' draggable='false' src='"+basePath +"/resources/imgs/clock/clock_min.png'/></span>"+
		"					<span class='hms'><img onerror='' class='second' draggable='false' src='"+basePath +"/resources/imgs/clock/clock_sec.png'/></span>"+
		"					<img draggable='false' onerror='' draggable='false' src='"+basePath +"/resources/imgs/clock/clock.png'/>"+
		"				</div>"+
		"			</div>"+
		"	     </div>"+
		"	</div>"+
		"</div>");

		var hourDom = domClass("clockbox","hour")[0];
		var minuteDom = domClass("clockbox","minute")[0];
		var secDom = domClass("clockbox","second")[0];
		function init(){
			var date = new Date();
			var sec = date.getSeconds();
			var min = date.getMinutes();
			var hour = date.getHours();
			secDom.style.transform = "rotate("+(sec * 6)+"deg)";
			minuteDom.style.transform = "rotate("+(min * 6)+"deg)";
			hourDom.style.transform = "rotate("+(hour * 30)+"deg)";
			var h = hour <10 ? "0"+hour:hour;
			var m = min <10 ? "0"+min:min;
			var s = sec <10 ? "0"+sec:sec;
			var mk = "AM";
			if(h>12 && h<18)mk="PM";
			if(h>=18)mk="NG";

			if(callback)callback.call(date,h,m,s,mk);
		}
		init();
		setInterval(function(){
			init();
		},1000);

		return this;
	},
}

var KimCommon = {
	drag:function(dragDom){
		var prevX = 0;
		var prevY = 0;
		var iSpeedX = 0;
		var iSpeedY = 0;
		var timer = null;
		dragDom.addEventListener("mousedown",function(e){
			var pos = getXY(e);
			var x =pos.x - dragDom.offsetLeft;
			var y =pos.y - dragDom.offsetTop;
			prevX =pos.x;
			prevY =pos.y;
			document.onmousemove = function(e){
				var p = getXY(e);
				dragDom.style.left = p.x - x + 'px';
				dragDom.style.top = p.y - y + 'px';

				iSpeedX = p.x - prevX;
				iSpeedY = p.y - prevY;

				prevX = p.x;
				prevY = p.y;
			};
			dragDom.onmouseleave = document.onmouseup = function(){
				document.onmousemove = null;
				document.onmouseup = null;
				startMove();
			};
			return false;
		});

		function startMove(){
			clearInterval(timer);
			timer = setInterval(function(){
				iSpeedY += 3;
				var L = dragDom.offsetLeft + iSpeedX;
				var T = dragDom.offsetTop + iSpeedY;
				if(T>document.documentElement.clientHeight - dragDom.offsetHeight){
					T = document.documentElement.clientHeight - dragDom.offsetHeight;
					iSpeedY *= -1;
					iSpeedY *= 0.75;
					iSpeedX *= 0.75;
				}else if(T<0){
					T = 0;
					iSpeedY *= -1;
					iSpeedY *= 0.75;
				}

				if(L>document.documentElement.clientWidth - dragDom.offsetWidth){
					L = document.documentElement.clientWidth - dragDom.offsetWidth;
					iSpeedX *= -1;
					iSpeedX *= 0.75;
				}else if(L<0){
					L = 0;
					iSpeedX *= -1;
					iSpeedX *= 0.75;
				}

				dragDom.style.left = L + 'px';
				dragDom.style.top = T + 'px';
				if(Math.abs(Math.floor(iSpeedY))==2 && Math.abs(Math.floor(iSpeedX))==0 )clearInterval(timer);
			},30);
		}
	}
};
function isEmpty(val) {
  val = $.trim(val);
  if (val == null)
    return true;
  if (val == undefined || val == 'undefined')
    return true;
  if (val == "")
    return true;
  if (val.length == 0)
    return true;
  if (!/[^(^\s*)|(\s*$)]/.test(val))
    return true;
  return false;
}
function isNotEmpty(val) {
  return !isEmpty(val);
}
function dom(id){
	return document.getElementById(id);
};
function domClass(pid,sClass){
	var aEle = dom(pid).getElementsByTagName('*');
	var arrs = [];
	for(var i=0;i<aEle.length;i++){
		if(aEle[i].className.indexOf(sClass)!=-1){
			arrs.push(aEle[i]);
		}
	}
	return arrs;
}
//获取鼠标的位置。兼容ie678
function getXY(e){
	var ev = e || window.event;
	var x=0,y=0;
	if(ev.pageX){
		x = ev.pageX;
		y = ev.pageY;
	}else{
		//拿到scrollTop 和scrollLeft
		var sleft = 0,stop = 0;
		//ie678---
		if(document.documentElement){
			stop =document.documentElement.scrollTop;
			sleft = document.documentElement.scrollLeft;
		}else{
		//ie9+ 谷歌
			stop = document.body.scrollTop;
			sleft = document.body.scrollLeft;
		}
		x = ev.clientX + sleft;
		y = ev.clientY + stop;
	}
	return {x:x,y:y};
};

window.onload = function(){
	/*var iscommpent = $("body").data("iscommpent");
	if(isNotEmpty(iscommpent)){
		if(window.innerWidth >=1600){
			KimCmpFactory("clock",function(h,m,s,mk){});
			KimCommon.drag(dom("kim_clockbox"));
		}
	}*/

};
