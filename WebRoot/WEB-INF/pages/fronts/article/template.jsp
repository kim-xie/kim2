<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<c:forEach var="article" varStatus="articleIndex" items="${articles}">
	<li>
       <!--  -->
       <div class="shade" style="opacity: 0;"></div>
       <!--  -->
       <div class="cover pos">
           <a href="javascript:void(0)" target="_blank" title="${article.title}">
               <img width="280" height="210" src="${article.image}" data-original="${article.image}" class="imgloadinglater" alt="${article.title}" rel="nofollow" style="display: inline;">
           </a>
       </div>
       <div class="info">
           <h4 class="title ellipsis download">${article.title}</h4>
           <div class="msg mtn cl">
               <span class="classify">${article.tag}</span>
               <span><i class="iconfont icon-iconeye" title="浏览数"></i><em>${article.hits}</em></span>
               <span><i class="iconfont icon-comment" title="评论数"></i><em>${article.comments}</em></span>
               <span><i class="iconfont icon-leaf" title="点赞数"></i><em>${article.loves}</em></span>
           </div>
           <p class="user cl">
               <a href="javascript:void(0)" target="_blank"><img src="${basePath}${article.image}" title=""> 
                <strong class="name">
                    <em>${article.title}</em> 
                	<i class="cert icon-certified2" title=""></i>                                                                       
                </strong>
               </a>
           </p>
       </div>
       <!--  分隔线  -->
       <div class="line"></div>
   </li>
</c:forEach>