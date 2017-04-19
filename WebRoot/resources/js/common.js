	$(function(){
		windowResize();
	});
	
	$(window).resize(function(){
		windowResize();
	});
	
	function windowResize(){
		var windowHeight = document.documentElement.clientHeight  || document.body.clientHeight ;
		var windowWidth = document.documentElement.clientWidth  || document.body.clientWidth ;
		//alert("窗体的高度："+windowHeight+"窗体的宽度："+windowWidth);
		//$("#mainWrap").height(windowHeight-100);
	}
	
	//cookie的封装	
	var cookie = {
	    set: function(key,value,iday){//设置cookie方法
	        var date = new Date(); //获取当前时间
	        date.setDate(date.getDate() + iday); //格式化为cookie识别的时间   iday--缓存的天数
	        document.cookie = key + "=" + value +";expires="+date.toGMTString();  //设置cookie
	    },
	    get: function(key){//获取cookie方法
	        /*获取cookie参数*/
	        var getCookie = document.cookie.replace(/[ ]/g,"");  //获取cookie，并且将获得的cookie格式化，去掉空格字符
	        var arrCookie = getCookie.split(";")  //将获得的cookie以"分号"为标识 将cookie保存到arrCookie的数组中
	        for(var i=0;i<arrCookie.length;i++){   //使用for循环查找cookie中的tips变量
	            var arr = arrCookie[i].split("=");   //将单条cookie用"等号"为标识，将单条cookie保存为arr数组
	            if(key == arr[0]){  //匹配变量名称，其中arr[0]是指的cookie名称，如果该条变量为tips则执行判断语句中的赋值操作
	                return arr[1]; 
	                break;   //终止for循环遍历
	            }
	        }
	     },
	     remove: function(key){ //删除cookie方法
	    	 cookie.set(key,cookie.get(key),-1); //将时间设置为过去的一天
	     }
	}
	
	
