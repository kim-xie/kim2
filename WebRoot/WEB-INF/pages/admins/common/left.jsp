<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- left side start-->
<div class="left-side sticky-left-side">
    <!--logo and iconic logo start-->
    <div class="logo">
        <a href="${basePath}/admin/index"><img src="${basePath}/resources/imgs/logo/logo.png" alt=""></a>
    </div>
    <div class="logo-icon text-center">
        <a href="${basePath}/admin/index"><img src="${basePath}/resources/imgs/logo/logo.png" alt=""></a>
    </div>
    <!--logo and iconic logo end-->
    <div class="left-side-inner">
    
        <!-- visible to small devices only -->
        <div class="visible-xs hidden-sm hidden-md hidden-lg">
            <div class="media logged-user">
                <img alt="" src="${basePath}/resources/admins/images/photos/user-avatar.png" class="media-object">
                <div class="media-body">
                    <h4><a href="#">king</a></h4>
                    <span>"Hello There..."</span>
                </div>
            </div>
            <h5 class="left-nav-title">账号信息</h5>
            <ul class="nav nav-pills nav-stacked custom-nav">
              <li><a href="#"><i class="fa fa-user"></i> <span>个人信息</span></a></li>
              <li><a href="#"><i class="fa fa-cog"></i> <span>设置</span></a></li>
              <li><a href="#"><i class="fa fa-sign-out"></i> <span>退出</span></a></li>
            </ul>
        </div>
        
        <!--sidebar nav start-->
        <ul class="nav nav-pills nav-stacked custom-nav">
            <li class="active"><a href="${basePath}/admin/index"><i class="fa fa-home"></i> <span>首页</span></a></li>
            
            <li class="menu-list"><a href="#"><i class="fa fa-user"></i> <span>用户管理</span></a>
                <ul class="sub-menu-list">
                    <li><a href="${basePath}/admin/user/list">查看</a></li>
                    <li><a href="javascript:void(0)">新增</a></li>
                </ul>
            </li>
            
            <li class="menu-list"><a href="#"><i class="fa fa-th-large"></i> <span>菜单管理</span></a>
                <ul class="sub-menu-list">
                    <li><a href="javascript:void(0)">查看</a></li>
                    <li><a href="javascript:void(0)">新增</a></li>
                </ul>
            </li>
            
            <li class="menu-list"><a href="#"><i class="fa fa-users"></i> <span>角色管理</span></a>
                <ul class="sub-menu-list">
                    <li><a href="javascript:void(0)">查看</a></li>
                    <li><a href="javascript:void(0)">新增</a></li>
                </ul>
            </li>
            
            <li class="menu-list"><a href="#"><i class="fa fa-music"></i> <span>音乐管理</span></a>
                <ul class="sub-menu-list">
                    <li><a href="javascript:void(0)">查看</a></li>
                    <li><a href="javascript:void(0)">新增</a></li>
                </ul>
            </li>
            
            <li class="menu-list"><a href="#"><i class="fa fa-list-ul"></i> <span>学习管理</span></a>
                <ul class="sub-menu-list">
                    <li><a href="javascript:void(0)">查看</a></li>
                    <li><a href="javascript:void(0)">新增</a></li>
                </ul>
            </li>
            
            <li class="menu-list"><a href="#"><i class="fa fa-qrcode"></i> <span>作品管理</span></a>
                <ul class="sub-menu-list">
                    <li><a href="javascript:void(0)">查看</a></li>
                    <li><a href="javascript:void(0)">新增</a></li>
                </ul>
            </li>
            
            <li class="menu-list"><a href="#"><i class="fa fa-pencil-square"></i> <span>文章管理</span></a>
                <ul class="sub-menu-list">
                    <li><a href="javascript:void(0)">查看</a></li>
                    <li><a href="javascript:void(0)">新增</a></li>
                </ul>
            </li>
            
            <li class="menu-list"><a href="#"><i class="fa fa-sitemap"></i> <span>爬虫管理</span></a>
                <ul class="sub-menu-list">
                    <li><a href="javascript:void(0)">查看</a></li>
                    <li><a href="javascript:void(0)">新增</a></li>
                </ul>
            </li>
            
            <li class="menu-list"><a href="#"><i class="fa fa-folder-open-o"></i> <span>日志管理</span></a>
                <ul class="sub-menu-list">
                    <li><a href="javascript:void(0)">查看</a></li>
                    <li><a href="javascript:void(0)">新增</a></li>
                </ul>
            </li>
            
            <li><a href="login.html"><i class="fa fa-sign-in"></i> <span>退出</span></a></li>
        </ul>
        <!--sidebar nav end-->
    </div>
</div>
<!-- left side end-->