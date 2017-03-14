<%@ page language="java" import="java.util.*" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<c:forEach var="music" varStatus="musicindex" items="${musics}">
	<div class="ui-row-item ui-track-item" id="J_trackList1776351341" onclick="selectPlay(this)">
		<div class="ui-track-main">
			<div class="ui-track-checkbox">
				<input type="checkbox" class="ui-track-item-id" name="track" id="J_track1776351341" value="1776351341">
			</div>
			<div class="ui-track-sort"><em>${music.id}</em></div>
			<div class="ui-row-item-body">
				<div class="ui-row-item-column c1" data-id="1776351341"><span title="${music.title}">${music.title}</span></div>
				<div class="ui-row-item-column c2" data-artist-id="7158">
					<a href="http://www.xiami.com/search/find/artist/${music.singer}" target="_blank" title="${music.singer}">${music.singer}</a>
				</div>
				<div class="ui-row-item-column c3" data-album-id="2100377381">
					<a href="/album/2100377381" target="_blank" title="${music.album}">${music.album}</a>
				</div>
			</div>
			<div class="ui-track-control">
				<a class="fav-btn icon-track-fav" data-type="track" data-event="fav" title="收藏"></a>
				
				<a class="more-btn icon-track-more" data-type="track" data-event="more" title="更多"></a>
				
				<a class="delete-btn icon-track-delete" data-type="track" data-event="delete" title="删除"></a>
			</div>
		</div>
		<textarea id="lrcont" style="display:none;" data-src="${basePath}${music.playSrc}" data-img="${basePath}${music.image}" data-lrc="${music.lrc}"></textarea>
	</div>
</c:forEach>
