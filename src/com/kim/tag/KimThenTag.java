package com.kim.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
/**
 * then标签
 * 类名: KimThenTag.java
 * 创建人: kim 
 * 创建时间：2016年5月31日 下午12:56:17 
 * @version 1.0.0
 */
public class KimThenTag extends TagSupport{
	
	private static final long serialVersionUID = 1L;

	@Override
	public int doStartTag() throws JspException {
		KimIFTag parent = (KimIFTag)this.getParent();
		if(parent!=null && parent.getTest()){
			return EVAL_BODY_INCLUDE;//继续去执行标签体的内容
		}else{
			return SKIP_BODY;
		}
	}
	
//	kim:if
//	kim:elseif
//	kim:elseif
//	kim:else
}
