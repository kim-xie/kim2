package com.kim.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
/**
 * else标签
 * 类名: KimElseTag.java
 * 创建人: Kim 
 * 创建时间：2016年5月31日 下午1:03:17 
 * @version 1.0.0
 */
public class KimElseTag extends TagSupport{
	
	private static final long serialVersionUID = 1L;

	@Override
	public int doStartTag() throws JspException {
		KimIFTag parent = (KimIFTag)this.getParent();
		if(parent!=null && !parent.getTest()){
			return EVAL_BODY_INCLUDE;//继续去执行标签体的内容
		}else{
			return SKIP_BODY;
		}
	}
}