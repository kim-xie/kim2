package com.kim.bean;
import java.util.List;  

/** 
 * 歌词 
 * @author 李跃东 
 * @mail androiddevelop@qq.com 
 * @date 2013-11-8 
 */  
  
public class OnlineLrc {  
  
    public int count;  
    public int code ;  
    public List<LrcInfo> result;  
    public void setCount(int count) {  
        this.count = count;  
    }  
    public void setCode(int code) {  
        this.code = code;  
    }  
    public void setResult(List<LrcInfo> result) {  
        this.result = result;  
    }  
    public int getCount() {  
        return count;  
    }  
    public int getCode() {  
        return code;  
    }  
    public List<LrcInfo> getResult() {  
        return result;  
    }  
}  
