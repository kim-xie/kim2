package com.kim.bean;
/** 
 * 歌词 
 * @author 李跃东 
 * @mail androiddevelop@qq.com 
 * @date 2013-11-8 
 */  
  
public class OnlineMusic {  
  
	private String musicName; //音乐名字  
    private String musicAuthor; //歌手  
    private String musicAbsolutePath; //音乐绝对路径  
    private long musicTime; //音乐总时长 (ms)  
    private int musicFrameNumber; // 音乐总帧数  
  
    public String getMusicName() {  
        return musicName;  
    }  
    public void setMusicName(String musicName) {  
        this.musicName = musicName;  
    }  
  
    public String getMusicAuthor() {  
        return musicAuthor;  
    }  
    public void setMusicAuthor(String musicAuthor) {  
        this.musicAuthor = musicAuthor;  
    }  
    public String getMusicAbsolutePath() {  
        return musicAbsolutePath;  
    }  
    public void setMusicAbsolutePath(String musicAbsolutePath) {  
        this.musicAbsolutePath = musicAbsolutePath;  
    }  
    public long getMusicTime() {  
        return musicTime;  
    }  
    public void setMusicTime(long musicTime) {  
        this.musicTime = musicTime;  
    }  
    public int getMusicFrameNumber() {  
        return musicFrameNumber;  
    }  
    public void setMusicFrameNumber(int musicFrameNumber) {  
        this.musicFrameNumber = musicFrameNumber;  
    }  
}   
