/*
SQLyog Professional v12.09 (64 bit)
MySQL - 5.6.26 : Database - kim
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kim` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `kim`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `article_id` varchar(32) NOT NULL COMMENT '内容id',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户id',
  `article_channel_id` varchar(32) DEFAULT NULL COMMENT '栏目id',
  `article_category_id` varchar(32) DEFAULT NULL COMMENT '分类id',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `subTitle` varchar(100) DEFAULT NULL COMMENT '子标题',
  `description` varchar(1000) DEFAULT NULL COMMENT '描述',
  `article` longtext COMMENT '内容',
  `thumnail` varchar(100) DEFAULT NULL COMMENT '缩略图',
  `image` varchar(100) DEFAULT NULL COMMENT '封面图片',
  `width` int(100) DEFAULT NULL COMMENT '封面图片的宽度',
  `height` int(100) DEFAULT NULL COMMENT '封面图片的高度',
  `static_link` varchar(200) DEFAULT NULL COMMENT '静态页面链接',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `tag` varchar(50) DEFAULT NULL COMMENT '标签',
  `is_top` int(1) DEFAULT NULL COMMENT '1置顶0未置顶',
  `is_delete` int(1) DEFAULT NULL COMMENT '1删除0未删除',
  `is_comment` int(1) DEFAULT NULL COMMENT '1允许0不允许',
  `comments` int(255) DEFAULT NULL COMMENT '评论数据',
  `hits` int(255) DEFAULT NULL COMMENT '点击数',
  `status` int(1) DEFAULT NULL COMMENT '1发布0未发布',
  `push` int(1) DEFAULT NULL COMMENT '1精华0未精华',
  `collections` int(255) DEFAULT NULL COMMENT '收藏数量',
  `loves` int(255) DEFAULT NULL COMMENT '喜欢数量',
  `type` varchar(100) DEFAULT NULL COMMENT '类型',
  `keyword` varchar(1000) DEFAULT NULL COMMENT '关键字',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `article` */

insert  into `article`(`article_id`,`user_id`,`article_channel_id`,`article_category_id`,`title`,`subTitle`,`description`,`article`,`thumnail`,`image`,`width`,`height`,`static_link`,`create_time`,`update_time`,`tag`,`is_top`,`is_delete`,`is_comment`,`comments`,`hits`,`status`,`push`,`collections`,`loves`,`type`,`keyword`) values ('8e30ea33ae744b7e856017326ba6b424','17AD94A9493547D490AD1A3C4DC75F96',NULL,NULL,'Webpack',NULL,'前端打包工具','# Webpack\n#### Webpack 中文指南\nWebpack是当下最热门的前端资源模块化管理和打包工具。它可以将许多松散的模块按照依赖和规则打包成符合生产环境部署的前端资源。还可以将按需加载的模块进行代码分隔，等到实际需要的时候再异步加载。通过loader的转换，任何形式的资源都可以视作模块，比如 CommonJs 模块、 AMD 模块、 ES6 模块、CSS、图片、 JSON、Coffeescript、 LESS 等。\n\n#### 现状\n文件只能按照的书写顺序进行加载\n开发人员必须主观解决模块和代码库的依赖关系\n在大型项目中各种资源难以管理，长期积累的问题导致代码库混乱不堪\n\n#### CommonJS\n服务器端的 Node.js 遵循CommonJS规范，该规范的核心思想是允许模块通过require方法来同步加载所要依赖的其他模块，然后通过exports或module.exports来导出需要暴露的接口。\n\n`require(\"module\");require(\"../file.js\");exports.doStuff=function(){};module.exports = someValue;`\n\n##### 优点：\n	服务器端模块便于重用\n	NPM中已经有将近20万个可以使用模块包\n	简单并容易使用\n\n##### 缺点：\n	同步的模块加载方式不适合在浏览器环境中，同步意味着阻塞加载，浏览器资源是异步加载的\n	不能非阻塞的并行加载多个模块\n\n#### AMD\n	Asynchronous Module Definition规范其实只有一个主要接口define(id?, dependencies?, factory)，它要在声明模块的时候指定所有的依赖dependencies，并且还要当做形参传到factory中，对于依赖的模块提前执行，依赖前置。\n\n`define(\"module\", [\"dep1\",\"dep2\"],function(d1, d2){returnsomeExportedValue;});require([\"module\",\"../file\"],function(module, file){/* ... */});`\n\n##### 优点：\n	适合在浏览器环境中异步加载模块\n	可以并行加载多个模块\n\n##### 缺点：\n	提高了开发成本，代码的阅读和书写比较困难，模块定义方式的语义不顺畅\n	不符合通用的模块化思维方式，是一种妥协的实现\n\n#### CMD\n	Common Module Definition规范和 AMD 很相似，尽量保持简单，并与 CommonJS 和 Node.js 的 Modules 规范保持了很大的兼容性。\n`define(function(require, exports, module){var$ =require(\'jquery\');varSpinning =require(\'./spinning\');  exports.doSomething = ...module.exports = ...})`\n\n##### 优点：\n	依赖就近，延迟执行\n	可以很容易在 Node.js 中运行\n\n##### 缺点：\n	依赖 SPM 打包，模块的加载逻辑偏重\n\n#### UMD\n	Universal Module Definition规范类似于兼容 CommonJS 和 AMD 的语法糖，是模块定义的跨平台解决方案。\n\n#### ES6 模块\n	EcmaScript6 标准增加了 JavaScript 语言层面的模块体系定义。ES6 模块的设计思想，是尽量的静态化，使得编译时就能确定模块的依赖关系，以及输入和输出的变量。CommonJS 和 AMD 模块，都只能在运行时确定这些东西。\n\n`import\"jquery\";exportfunctiondoStuff(){}module\"localModule\"{}`\n\n##### 优点：\n	容易进行静态分析\n	面向未来的 EcmaScript 标准\n\n##### 缺点：\n	原生浏览器端还没有实现该标准\n	全新的命令字，新版的 Node.js才支持\n\n#### 期望的模块系统\n	可以兼容多种模块风格，尽量可以利用已有的代码，不仅仅只是 JavaScript 模块化，还有 CSS、图片、字体等资源也需要模块化。\n	前端模块加载\n	前端模块要在客户端中执行，所以他们需要增量加载到浏览器中。\n	模块的加载和传输，我们首先能想到两种极端的方式，一种是每个模块文件都单独请求，另一种是把所有模块打包成一个文件然后只请求一次。显而易见，每个模块都发起单独的请求造成了请求次数过多，导致应用启动速度慢；一次请求加载所有模块导致流量浪费、初始化过程慢。这两种方式都不是好的解决方案，它们过于简单粗暴。\n	分块传输，按需进行懒加载，在实际用到某些模块的时候再增量更新，才是较为合理的模块加载方案。\n	要实现模块的按需加载，就需要一个对整个代码库中的模块进行静态分析、编译打包的过程。\n\n#### 所有资源都是模块\n	在上面的分析过程中，我们提到的模块仅仅是指JavaScript模块文件。然而，在前端开发过程中还涉及到样式、图片、字体、HTML 模板等等众多的资源。这些资源还会以各种方言的形式存在，比如 coffeescript、 less、 sass、众多的模板库、多语言系统（i18n）等等。\n	如果他们都可以视作模块，并且都可以通过require的方式来加载，将带来优雅的开发体验，比如：\n\n	`require(\"./style.css\");require(\"./style.less\");require(\"./template.jade\");require(\"./image.png\");`\n\n	那么如何做到让require能加载各种资源呢？\n\n#### 静态分析\n	在编译的时候，要对整个代码进行静态分析，分析出各个模块的类型和它们依赖关系，然后将不同类型的模块提交给适配的加载器来处理。比如一个用 LESS 写的样式模块，可以先用 LESS 加载器将它转成一个CSS 模块，在通过 CSS 模块把他插入到页面的标签中执行。Webpack 就是在这样的需求中应运而生。\n\n	同时，为了能利用已经存在的各种框架、库和已经写好的文件，我们还需要一个模块加载的兼容策略，来避免重写所有的模块。\n\n#### 什么是 Webpack\n	Webpack 是一个模块打包器。它将根据模块的依赖关系进行静态分析，然后将这些模块按照指定的规则生成对应的静态资源。\n\n#### 为什么重复造轮子\n	市面上已经存在的模块管理和打包工具并不适合大型的项目，尤其单页面 Web 应用程序。最紧迫的原因是如何在一个大规模的代码库中，维护各种模块资源的分割和存放，维护它们之间的依赖关系，并且无缝的将它们整合到一起生成适合浏览器端请求加载的静态资源。\n	这些已有的模块化工具并不能很好的完成如下的目标：\n	将依赖树拆分成按需加载的块\n	初始化加载的耗时尽量少\n	各种静态资源都可以视作模块\n	将第三方库整合成模块的能力\n	可以自定义打包逻辑的能力\n	适合大项目，无论是单页还是多页的 Web 应用\n\n#### Webpack 的特点\nWebpack 和其他模块化工具有什么区别呢？\n##### 代码拆分\n	Webpack 有两种组织模块依赖的方式，同步和异步。异步依赖作为分割点，形成一个新的块。在优化了依赖树后，每一个异步区块都作为一个文件被打包。\n\n##### Loader\n	Webpack 本身只能处理原生的 JavaScript 模块，但是 loader 转换器可以将各种类型的资源转换成 JavaScript 模块。这样，任何资源都可以成为 Webpack 可以处理的模块。\n\n##### 智能解析\n	Webpack 有一个智能解析器，几乎可以处理任何第三方库，无论它们的模块形式是 CommonJS、 AMD 还是普通的 JS 文件。甚至在加载依赖的时候，允许使用动态表达式require(\"./templates/\" + name + \".jade\")。\n\n##### 插件系统\n	Webpack 还有一个功能丰富的插件系统。大多数内容功能都是基于这个插件系统运行的，还可以开发和使用开源的 Webpack 插件，来满足各式各样的需求。\n\n##### 快速运行\n	Webpack 使用异步 I/O 和多级缓存提高运行效率，这使得 Webpack 能够以令人难以置信的速度快速增量编译。\n\n#### 安装\n	首先要安装Node.js， Node.js 自带了软件包管理器 npm，Webpack 需要 Node.js v0.6 以上支持，建议使用最新版 Node.js。\n	用 npm 安装 Webpack：\n	$ npm install webpack -g\n	此时 Webpack 已经安装到了全局环境下，可以通过命令行webpack -h试试。\n	通常我们会将 Webpack 安装到项目的依赖中，这样就可以使用项目本地版本的 Webpack。\n\n#### 进入项目目录\n#### 确定已经有 package.json，没有就通过 npm init 创建\n#### 安装 webpack 依赖\n	$ npm install webpack --save-dev\n	Webpack 目前有两个主版本，一个是在 master 主干的稳定版，一个是在 webpack-2 分支的测试版，测试版拥有一些实验性功能并且和稳定版不兼容，在正式项目中应该使用稳定版。\n\n#### 查看 webpack 版本信息\n	$ npm info webpack\n\n#### 安装指定版本的 webpack\n	$ npm install webpack@1.12.x --save-dev\n	如果需要使用 Webpack 开发工具，要单独安装：\n	$ npm install webpack-dev-server --save-dev\n\n#### 使用\n	首先创建一个静态页面 index.html 和一个 JS 入口文件 entry.js：\n\n		// entry.js\n		document.write(\'It works.\')\n\n	然后编译 entry.js 并打包到 bundle.js：\n\n	$ webpack entry.js bundle.js\n\n	打包过程会显示日志：\n\n		Hash: e964f90ec65eb2c29bb9\n		Version: webpack 1.12.2\n		Time: 54ms\n		Asset    Size  Chunks            Chunk Names\n		bundle.js  1.42 kB      0  [emitted]  main\n		[0] ./entry.js 27 bytes {0} [built]\n\n	用浏览器打开index.html将会看到It works.。\n	接下来添加一个模块module.js并修改入口entry.js：\n\n		// module.js\n		module.exports =\'It works from module.js.\'\n		// entry.js\n		document.write(\'It works.\')\n		document.write(require(\'./module.js\'))// 添加模块\n\n	重新打包webpack entry.js bundle.js后刷新页面看到变化It works.It works from module.js.\n\n	Hash: 279c7601d5d08396e751\n	Version: webpack 1.12.2\n	Time: 63ms\n	Asset    Size  Chunks            Chunk Names\n	bundle.js  1.57 kB      0  [emitted]  main\n	[0] ./entry.js 66 bytes {0} [built]\n	[1] ./module.js 43 bytes {0} [built]\n\n	Webpack 会分析入口文件，解析包含依赖关系的各个文件。这些文件（模块）都打包到 bundle.js 。Webpack 会给每个模块分配一个唯一的 id 并通过这个 id 索引和访问模块。在页面启动时，会先执行 entry.js 中的代码，其它模块会在运行require的时候再执行。\n\n#### Loader\n	Webpack 本身只能处理 JavaScript 模块，如果要处理其他类型的文件，就需要使用 loader 进行转换。\n	Loader 可以理解为是模块和资源的转换器，它本身是一个函数，接受源文件作为参数，返回转换的结果。这样，我们就可以通过require来加载任何类型的模块或文件，比如 CoffeeScript、 JSX、 LESS 或图片。\n\n	先来看看 loader 有哪些特性？\n		Loader 可以通过管道方式链式调用，每个 loader 可以把资源转换成任意格式并传递给下一个 loader ，但是最后一个 loader 必须返回 JavaScript。\n		Loader 可以同步或异步执行。\n		Loader 运行在 node.js 环境中，所以可以做任何可能的事情。\n		Loader 可以接受参数，以此来传递配置项给 loader。\n		Loader 可以通过文件扩展名（或正则表达式）绑定给不同类型的文件。\n		Loader 可以通过npm发布和安装。\n\n	除了通过package.json的main指定，通常的模块也可以导出一个 loader 来使用。\n		Loader 可以访问配置。\n		插件可以让 loader 拥有更多特性。\n		Loader 可以分发出附加的任意文件。\n		Loader 本身也是运行在 node.js 环境中的 JavaScript 模块，它通常会返回一个函数。大多数情况下，我们通过 npm 来管理 loader，但是你也可以在项目中自己写 loader 模块。\n\n	按照惯例，而非必须，loader 一般以xxx-loader的方式命名，xxx代表了这个 loader 要做的转换功能，比如json-loader。\n\n	在引用 loader 的时候可以使用全名json-loader，或者使用短名json。这个命名规则和搜索优先级顺序在 webpack 的resolveLoader.moduleTemplatesapi 中定义。\n\n		Default: [\"*-webpack-loader\", \"*-web-loader\", \"*-loader\", \"*\"]\n\n		Loader 可以在require()引用模块的时候添加，也可以在 webpack 全局配置中进行绑定，还可以通过命令行的方式使用。\n\n	接上一节的例子，我们要在页面中引入一个 CSS 文件 style.css，首页将 style.css 也看成是一个模块，然后用css-loader来读取它，再用style-loader把它插入到页面中。\n\n/* style.css */\n\nbody{background:yellow; }\n\n修改 entry.js：\n\nrequire(\"!style-loader!css-loader!./style.css\")// 载入 style.css\n\ndocument.write(\'It works.\')\n\ndocument.write(require(\'./module.js\'))\n\n安装 loader：\n\nnpm install css-loader style-loader\n\n重新编译打包，刷新页面，就可以看到黄色的页面背景了。\n\n如果每次requireCSS 文件的时候都要写 loader 前缀，是一件很繁琐的事情。我们可以根据模块类型（扩展名）来自动绑定需要的 loader。\n\n将 entry.js 中的require(\"!style!css!./style.css\")修改为require(\"./style.css\")，然后执行：\n\n$ webpack entry.js bundle.js --module-bind\'css=style-loader!css-loader\'# 有些环境下可能需要使用双引号$ webpack entry.js bundle.js --module-bind\"css=style-loader!css-loader\"\n\n显然，这两种使用 loader 的方式，效果是一样的。\n\n\n\n#### 配置文件\nWebpack 在执行的时候，除了在命令行传入参数，还可以通过指定的配置文件来执行。默认情况下，会搜索当前目录的webpack.config.js文件，这个文件是一个 node.js 模块，返回一个 json 格式的配置信息对象，或者通过--config选项来指定配置文件。\n\n继续我们的案例，在根目录创建package.json来添加 webpack 需要的依赖：\n\n{\n\n     \"name\":\"webpack-example\",\n\n     \"version\":\"1.0.0\",\n\n     \"description\":\"A simple webpack example.\",\n\n    \"main\":\"bundle.js\",\n\n     \"scripts\": {\"test\":\"echo \\\"Error: no test specified\\\" && exit 1\"},\n\n     \"keywords\": [\"webpack\"],\n\n     \"author\":\"zhaoda\",\n\n     \"license\":\"MIT\",\n\n     \"devDependencies\": {\n\n           \"css-loader\":\"^0.21.0\",\n\n           \"style-loader\":\"^0.13.0\",\n\n           \"webpack\":\"^1.12.2\"\n     }\n}\n\n#### 如果没有写入权限，请尝试如下代码更改权限\n	chflags -R nouchg .\n	sudo chmod775package.json\n	别忘了运行npm install。\n	然后创建一个配置文件webpack.config.js：\n	var webpack =require(\'webpack\')\nmodule.exports = { \n\n     entry:\'./entry.js\',  \n\n     output: {   path: __dirname,    filename:\'bundle.js\'},\n\n     module: {    loaders: [      {test:/\\.css$/, loader:\'style-loader!css-loader\'}    ]  }\n\n}\n	同时简化entry.js中的style.css加载方式：\n	require(\'./style.css\')\n	最后运行webpack，可以看到 webpack 通过配置文件执行的结果和上一章节通过命令行webpack entry.js bundle.js --module-bind \'css=style-loader!css-loader\'执行的结果是一样的。\n\n#### 插件\n	插件可以完成更多 loader 不能完成的功能。\n	插件的使用一般是在 webpack 的配置信息plugins选项中指定。\n	Webpack 本身内置了一些常用的插件，还可以通过 npm 安装第三方插件。\n	接下来，我们利用一个最简单的BannerPlugin内置插件来实践插件的配置和运行，这个插件的作用是给输出的文件头部添加注释信息。\n	修改webpack.config.js，添加plugins：\n	var webpack =require(\'webpack\')\nmodule.exports = {  \n\n     entry:\'./entry.js\',  \n\n     output: {    path: __dirname,    filename:\'bundle.js\'},\n\n     module: {    loaders: [      {test:/\\.css$/, loader:\'style-loader!css-loader\'}    ]  },  \n\n     plugins: [newwebpack.BannerPlugin(\'This file is created by zhaoda\')  ]\n\n}\n\n然后运行webpack，打开bundle.js，可以看到文件头部出现了我们指定的注释信息：\n\n/*! This file is created by zhaoda *//******/(function(modules){// webpackBootstrap/******/// The module cache/******/varinstalledModules = {};// 后面代码省略\n\n\n\n#### 开发环境\n	当项目逐渐变大，webpack 的编译时间会变长，可以通过参数让编译的输出内容带有进度和颜色。\n	$ webpack --progress --colors\n	如果不想每次修改模块后都重新编译，那么可以启动监听模式。开启监听模式后，没有变化的模块会在编译后缓存到内存中，而不会每次都被重新编译，所以监听模式的整体速度是很快的。\n	$ webpack --progress --colors --watch\n	当然，使用webpack-dev-server开发服务是一个更好的选择。它将在 localhost:8080 启动一个 express 静态资源 web 服务器，并且会以监听模式自动运行 webpack，在浏览器打开http://localhost:8080/或http://localhost:8080/webpack-dev-server/可以浏览项目中的页面和编译后的资源输出，并且通过一个 socket.io 服务实时监听它们的变化并自动刷新页面。\n\n#### 安装\n	$ npm install webpack-dev-server -g\n\n#### 运行\n	$ webpack-dev-server --progress --colors\n\n#### 故障处理\n	Webpack 的配置比较复杂，很容出现错误，下面是一些通常的故障处理手段。\n	一般情况下，webpack 如果出问题，会打印一些简单的错误信息，比如模块没有找到。我们还可以通过参数--display-error-details来打印错误详情。\n	$ webpack --display-error-details\n	Webpack 的配置提供了resolve和resolveLoader参数来设置模块解析的处理细节，resolve用来配置应用层的模块（要被打包的模块）解析，resolveLoader用来配置loader模块的解析。\n	当引入通过 npm 安装的 node.js 模块时，可能出现找不到依赖的错误。Node.js 模块的依赖解析算法很简单，是通过查看模块的每一层父目录中的node_modules文件夹来查询依赖的。当出现 Node.js 模块依赖查找失败的时候，可以尝试设置resolve.fallback和resolveLoader.fallback来解决问题。\n\nmodule.exports = {  \n\n             resolve: { fallback: path.join(__dirname,\"node_modules\") }, \n\n             resolveLoader: { fallback: path.join(__dirname,\"node_modules\") }\n\n};\n\nWebpack 中涉及路径配置最好使用绝对路径，建议通过path.resolve(__dirname, \"app/folder\")或path.join(__dirname, \"app\", \"folder\")的方式来配置，以兼容 Windows 环境。\n\n#### CommonJS 规范\nCommonJS 是以在浏览器环境之外构建 JavaScript 生态系统为目标而产生的项目，比如在服务器和桌面环境中。\n\n这个项目最开始是由 Mozilla 的工程师 Kevin Dangoor 在2009年1月创建的，当时的名字是 ServerJS。\n\n我在这里描述的并不是一个技术问题，而是一件重大的事情，让大家走到一起来做决定，迈出第一步，来建立一个更大更酷的东西。 —— Kevin Dangoor\'sWhat Server Side JavaScript needs\n\n2009年8月，这个项目改名为 CommonJS，以显示其 API 的更广泛实用性。CommonJS 是一套规范，它的创建和核准是开放的。这个规范已经有很多版本和具体实现。CommonJS 并不是属于 ECMAScript TC39 小组的工作，但 TC39 中的一些成员参与 CommonJS 的制定。2013年5月，Node.js 的包管理器 NPM 的作者 Isaac Z. Schlueter 说CommonJS 已经过时，Node.js 的内核开发者已经废弃了该规范。\n\nCommonJS 规范是为了解决 JavaScript 的作用域问题而定义的模块形式，可以使每个模块它自身的命名空间中执行。该规范的主要内容是，模块必须通过module.exports导出对外的变量或接口，通过require()来导入其他模块的输出到当前模块作用域中。\n\n一个直观的例子：\n\n// moduleA.jsmodule.exports =function(value){returnvalue *2;}\n\n// moduleB.jsvarmultiplyBy2 =require(\'./moduleA\');varresult = multiplyBy2(4);\n\nCommonJS 是同步加载模块，但其实也有浏览器端的实现，其原理是现将所有模块都定义好并通过id索引，这样就可以方便的在浏览器环境中解析了，可以参考require1k和tiny-browser-require的源码来理解其解析（resolve）的过程。\n\n#### AMD 规范\nAMD（异步模块定义）是为浏览器环境设计的，因为 CommonJS 模块系统是同步加载的，当前浏览器环境还没有准备好同步加载模块的条件。\n\nAMD 定义了一套 JavaScript 模块依赖异步加载标准，来解决同步加载的问题。\n\n模块通过define函数定义在闭包中，格式如下：\n\ndefine(id?:String, dependencies?:String[], factory:Function|Object);\n\nid是模块的名字，它是可选的参数。\n\ndependencies指定了所要依赖的模块列表，它是一个数组，也是可选的参数，每个依赖的模块的输出将作为参数一次传入factory中。如果没有指定dependencies，那么它的默认值是[\"require\", \"exports\", \"module\"]。\n\ndefine(function(require, exports, module){}）\n\nfactory是最后一个参数，它包裹了模块的具体实现，它是一个函数或者对象。如果是函数，那么它的返回值就是模块的输出接口或值。\n\n一些用例：\n\n定义一个名为myModule的模块，它依赖jQuery模块：\n\ndefine(\'myModule\', [\'jquery\'],function($){// $ 是 jquery 模块的输出$(\'body\').text(\'hello world\');});// 使用define([\'myModule\'],function(myModule){});\n\n注意：在 webpack 中，模块名只有局部作用域，在 Require.js 中模块名是全局作用域，可以在全局引用。\n\n定义一个没有id值的匿名模块，通常作为应用的启动函数：\n\ndefine([\'jquery\'],function($){    $(\'body\').text(\'hello world\');});\n\n依赖多个模块的定义：\n\ndefine([\'jquery\',\'./math.js\'],function($, math){// $ 和 math 一次传入 factory$(\'body\').text(\'hello world\');});\n\n模块输出：\n\ndefine([\'jquery\'],function($){varHelloWorldize =function(selector){       \n\n $(selector).text(\'hello world\');    };// HelloWorldize 是该模块输出的对外接口returnHelloWorldize;});\n\n在模块定义内部引用依赖：\n\ndefine(function(require){var$ =require(\'jquery\');    $(\'body\').text(\'hello world\');});',NULL,'http://localhost:8080/kim/resources/imgs/contentImg/201705032156053.png',NULL,NULL,NULL,'2017-05-03 22:55:08','2017-05-04 23:45:11','工具介绍',1,0,1,0,2,1,1,2,2,NULL,NULL),('d4fef14c19a440cb837f4685c5073804','991836cc46424212aed16d38964f22cd',NULL,NULL,'这次给你讲清楚，H5究竟是什么？',NULL,'html5介绍','#####一直都没有人能讲清楚H5是什么，讲过我2年的拜访和研究，我在试图警示清楚这个问题\n\n',NULL,'http://localhost:8080/kim/resources/imgs/contentImg/201705012217578.jpg',NULL,NULL,NULL,'2017-05-01 22:19:08',NULL,'html/css',1,0,1,0,0,1,1,0,0,NULL,NULL),('efcda03d2b2b44b883388a0cb9ff97ea','991836cc46424212aed16d38964f22cd',NULL,NULL,'谈谈jQuery中的事件',NULL,'jQuery事件','#总结\n####鼠标事件\n	click与dbclick事件\n   		$ele.click()\n   		$ele.click(handler(eventObject))\n   		$ele.click([eventData],handler(eventObject))\n\n	mousedown,mouseover\n\n	mouseover,mouseout\n\n	mouseenter,mouseleave\n\n	hover\n\n	focusin,focusout\n\n####表单事件\n	blur,focus\n\n	change\n\n	select\n\n	submit\n\n####键盘事件\n	keydown()\n\n	keyup()\n\n	keypress()\n\n####多事件\n	on()\n\n	off()\n\n	event\n\n	event.type\n\n	event.pageX,event.pageY\n\n	event.preventDefault()\n\n	event.stopPropagation()\n\n	event.which\n\n	this,event.target\n\n####自定义事件\n	trigger\n\n	triggerHandler\n\n##jQuery鼠标事件之click与dbclick事件\n\n用交互操作中，最简单直接的操作就是点击操作。jQuery提供了两个方法一个是click方法用于监听用户单击操作，另一个方法是dbclick方法用于监听用户双击操作。这两个方法的用法是类似的，下面以click()事件为例\n使用上非常简单：\n方法一：$ele.click()\n	绑定$ele元素，不带任何参数一般是用来指定触发一个事件，用的比较少\n`<div id=\"test\">点击触发<div>`\n```javascript\n $(\"ele\").click(function(){\n    alert(\'触发指定事件\')\n })\n$(\"#test\").click(function(){\n  $(\"ele\").click()  //手动指定触发事件 \n});```\n\n方法二：$ele.click( handler(eventObject) )\n绑定$ele元素，每次$ele元素触发点击操作会执行回调 handler函数，这样可以针对事件的反馈做很多操作了，方法中的this是指向了绑定事件的元素\n`<div id=\"test\">点击触发<div>`\n```javascript\n$(\"#test\").click(11111,function(e) {\n    //this指向 div元素\n    //e.data  => 11111 传递数据\n});```\n\ndblclick()的用法和click()的用法是类似的，可以参考以上click()的用法。\ndbclick与click事件不同的是：\nclick事件触发需要以下几点：\n1. click事件其实是由mousedown与mouseup 2个动作构成，所以点击的动作只有在松手后才触发\n\ndblclick事件触发需要以下几点：\n1. 	dblclick又是由2个click叠加而来的，所以dblclick事件只有在满足以下条件的情况下才能被触发\n2. 	鼠标指针在元素里面时点击。\n3. 	鼠标指针在元素里面时释放。\n4. 	鼠标指针在元素里面时再次点击，点击间隔时间，是系统而定。\n5. 	鼠标指针在元素里面时再次释放。\n\n注意：在同一元素上同时绑定 click 和 dblclick 事件是不可取的。各个浏览器事件触发的顺序是不同的，一些浏览器在dblclick之前接受两个 click 事件 ，而一些浏览器只接受一个 click 事件。用户往往可通过不同的操作系统和浏览器配置双击灵敏度\n例子：\n```javascript\n$(“button:eq(0)”).click(function(){\n    alert(this)\n})\n结果：this指向button元素\n\n[object HTMLButtonElement]\n\n$(‘p’).click(function(e){\n    alert(e.target.textContent)\n})               //取了p元素的文字部分\n$(“button:eq(1)”).click(function(){\n    $(‘p’).click()   //手动指定触发事件\n})\n\nfunction data(e) {\n    alert(e.data)\n}\nfunction a() {\n    $(“button:eq(2)”).click(1111,data)\n}\na();\nfunction a() {} 是自定义一个a()方法 , 如果在你上下文中不调用是不会执行a()中方法的， 结尾处写一个函数a()是调用a()方法体。\n```\n\n\n',NULL,'http://localhost:8080/kim/resources/imgs/contentImg/201705012345544.jpg',NULL,NULL,NULL,'2017-05-02 00:02:50',NULL,'jquery',1,0,1,0,0,1,1,0,0,NULL,NULL);

/*Table structure for table `collection` */

DROP TABLE IF EXISTS `collection`;

CREATE TABLE `collection` (
  `collection_id` varchar(32) NOT NULL,
  `article_id` varchar(32) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `is_delete` int(1) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `collection` */

insert  into `collection`(`collection_id`,`article_id`,`user_id`,`is_delete`,`create_time`,`update_time`) values ('1e4905aeff074513823a4ccfd72cbbc7','8e30ea33ae744b7e856017326ba6b424','17AD94A9493547D490AD1A3C4DC75F96',0,'2017-05-04 22:38:22','2017-05-04 22:44:18'),('839b93b003b14e07a2200f83836c1f59','8e30ea33ae744b7e856017326ba6b424','991836cc46424212aed16d38964f22cd',0,'2017-05-03 22:55:07','2017-05-04 22:40:41');

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `feedback_id` varchar(32) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `feedback_content` varchar(100) DEFAULT NULL,
  `app_version` varchar(100) DEFAULT NULL,
  `feedback_description` varchar(100) DEFAULT NULL,
  `feedback_status` int(1) NOT NULL,
  `is_delete` int(1) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `feedback` */

insert  into `feedback`(`feedback_id`,`user_id`,`feedback_content`,`app_version`,`feedback_description`,`feedback_status`,`is_delete`,`create_time`,`update_time`) values ('187EB5C15F4F4F98B34CBEF11AD0017F','17AD94A9493547D490AD1A3C4DC75F96','测试数据','1.0.0',NULL,0,0,'2017-04-17 21:03:56','2017-04-17 21:03:56'),('1CDF096473554C3BA26F6DFC940F4D2C','17AD94A9493547D490AD1A3C4DC75F96','好阿红啊玩','1.0.0',NULL,0,0,'2017-04-17 21:29:31','2017-04-17 21:29:31'),('301EA7BD7F7C42719C00B1E3540F5036','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/cj_thumb.gif\" title=\"[吃惊]\">','1.0.0',NULL,0,0,'2017-04-19 19:33:51','2017-04-19 19:33:51'),('314B159ECF054897B5A12B47DFC1C713','17AD94A9493547D490AD1A3C4DC75F96','呵呵呵','1.0.0',NULL,0,0,'2017-04-17 21:15:24','2017-04-17 21:15:24'),('3C7C78B0CDC243A8B3F7DDAFBE9EDFD3','17AD94A9493547D490AD1A3C4DC75F96','12345678','1.0.0',NULL,0,0,'2017-04-17 21:32:09','2017-04-17 21:32:09'),('3D2F20679BD648C992478AE95A87242D','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/x_thumb.gif\" title=\"[嘘]\">','1.0.0',NULL,0,0,'2017-04-19 19:05:40','2017-04-19 19:05:40'),('40A17D2CB8874F92BEF8453F0AAA6815','17AD94A9493547D490AD1A3C4DC75F96','214325253253','1.0.0',NULL,0,0,'2017-04-17 21:31:08','2017-04-17 21:31:08'),('5327CF9E738045C8846511661639C173','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/sad_thumb.gif\" title=\"[弱]\">','1.0.0',NULL,0,0,'2017-04-19 19:49:54','2017-04-19 19:49:54'),('64B5B03A79AD448C940CA8094FEFE524','17AD94A9493547D490AD1A3C4DC75F96','酷酷的呀','1.0.0',NULL,0,0,'2017-04-17 21:19:56','2017-04-17 21:19:56'),('66AFCE37D94D463CB577A9D78CE5AF7D','17AD94A9493547D490AD1A3C4DC75F96','发表反馈','1.0.0',NULL,0,0,'2017-04-17 21:28:39','2017-04-17 21:28:39'),('66CFFC1A1A6241CE8434F34EC1A373BF','991836cc46424212aed16d38964f22cd','测试表情<img src=\"http://localhost:8080/kim/resources/imgs/face/laugh.gif\" title=\"[哈哈]\">','1.0.0',NULL,0,0,'2017-04-18 22:32:57','2017-04-18 22:32:57'),('6A751B7EA2204C4E9D716566F61C4B76','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/wg_thumb.gif\" title=\"[围观]\">','1.0.0',NULL,0,0,'2017-04-19 19:42:30','2017-04-19 19:42:30'),('6E8D4F3D5B5C4EDBA130086E37251252','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/horse2_thumb.gif\" title=\"[神马]\">','1.0.0',NULL,0,0,'2017-04-19 19:31:35','2017-04-19 19:31:35'),('6F8E874EBC2A43F98E592ECF3CBDC331','17AD94A9493547D490AD1A3C4DC75F96','哈坎HDKHDKAHDKAHSD','1.0.0',NULL,0,0,'2017-04-17 21:29:48','2017-04-17 21:29:48'),('79DB6242A6D5470F9F1C09E38A72648A','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/j_thumb.gif\" title=\"[囧]\">','1.0.0',NULL,0,0,'2017-04-19 19:48:42','2017-04-19 19:48:42'),('83F1F4F8770444DB85458F5A9812E746','17AD94A9493547D490AD1A3C4DC75F96','差不多了','1.0.0',NULL,0,0,'2017-04-17 21:16:23','2017-04-17 21:16:23'),('876C8F4782DF46E3B624ABF27BFE63A3','17AD94A9493547D490AD1A3C4DC75F96','呵呵呵呵','1.0.0',NULL,0,0,'2017-04-17 21:16:03','2017-04-17 21:16:03'),('8D3F65F0A65A424CB3FE6DF06A2E8C09','991836cc46424212aed16d38964f22cd','反馈','1.0.0',NULL,0,0,'2017-04-18 22:18:23','2017-04-18 22:18:23'),('8E3FEFCBA4394B6382DFA388D6173325','17AD94A9493547D490AD1A3C4DC75F96','123特意打电话','1.0.0',NULL,0,0,'2017-04-17 21:33:42','2017-04-17 21:33:42'),('8EE82242913E46838F6AF85241848A94','17AD94A9493547D490AD1A3C4DC75F96','13插入WRV','1.0.0',NULL,0,0,'2017-04-17 21:34:55','2017-04-17 21:34:55'),('906F17B43C7D4C3FBA46F57276452A88','17AD94A9493547D490AD1A3C4DC75F96','拉斯加福禄寿解答老师解放路附近','1.0.0',NULL,0,0,'2017-04-17 21:30:44','2017-04-17 21:30:44'),('9A70BEC7B56D432586FEAA50C9A06329','991836cc46424212aed16d38964f22cd','测试刚刚发布的数据','1.0.0',NULL,0,0,'2017-04-18 22:29:54','2017-04-18 22:29:54'),('9FEB5D8D34BE4DB784D60C3CCE8D4DD0','17AD94A9493547D490AD1A3C4DC75F96','酷酷的','1.0.0',NULL,0,0,'2017-04-17 21:19:11','2017-04-17 21:19:11'),('A3E4E75427D8453BB6E6C96837AC7880','17AD94A9493547D490AD1A3C4DC75F96','额外热瓦被淘汰','1.0.0',NULL,0,0,'2017-04-17 21:33:15','2017-04-17 21:33:15'),('A970E5E936394787901AFDCFF88C2A8A','17AD94A9493547D490AD1A3C4DC75F96','测试layer控件','1.0.0',NULL,0,0,'2017-04-17 21:12:57','2017-04-17 21:12:57'),('A99AC5C8639A4D008740EC915254F14F','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/geili_thumb.gif\" title=\"[给力]\">','1.0.0',NULL,0,0,'2017-04-19 19:04:04','2017-04-19 19:04:04'),('B8BD53BE0972496889B4FE3F579C078B','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/geili_thumb.gif\" title=\"[给力]\">','1.0.0',NULL,0,0,'2017-04-19 19:33:28','2017-04-19 19:33:28'),('C74FF1D5BA5C41E68AD000FDF491C6F3','17AD94A9493547D490AD1A3C4DC75F96','哈哈哈','1.0.0',NULL,0,0,'2017-04-17 21:15:02','2017-04-17 21:15:02'),('C875F4AC22CF4927A4640273BF01F4D7','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/geili_thumb.gif\" title=\"[给力]\">','1.0.0',NULL,0,0,'2017-04-19 19:49:07','2017-04-19 19:49:07'),('D8A56EDD7D8944C1B17AD14DB7DB33B0','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/vw_thumb.gif\" title=\"[威武]\">','1.0.0',NULL,0,0,'2017-04-19 19:46:00','2017-04-19 19:46:00'),('DC337B6FF2834C338137D9456135A55E','991836cc46424212aed16d38964f22cd','刚刚发布','1.0.0',NULL,0,0,'2017-04-18 22:23:30','2017-04-18 22:23:30'),('DDE8DEA9743A4E028DDE142C845A3DE1','17AD94A9493547D490AD1A3C4DC75F96','测试layer的loading组件','1.0.0',NULL,0,0,'2017-04-17 21:14:00','2017-04-17 21:14:00'),('DF8EC12C1D3F49CA85FA23AA533A0754','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/good_thumb.gif\" title=\"[good]\">','1.0.0',NULL,0,0,'2017-04-19 19:02:22','2017-04-19 19:02:22'),('E52CCD062F76402C88A8EAA14600F4AA','17AD94A9493547D490AD1A3C4DC75F96','哈哈哈哈！','1.0.0',NULL,0,0,'2017-04-17 21:23:04','2017-04-17 21:23:04'),('EEC72D3B8936463F9C7C2DBD545EDAFB','17AD94A9493547D490AD1A3C4DC75F96','213456789','1.0.0',NULL,0,0,'2017-04-17 21:31:34','2017-04-17 21:31:34'),('FB0CBABB3EFD4EECAC7B6EB7E99963BB','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/z2_thumb.gif\" title=\"[赞]\">','1.0.0',NULL,0,0,'2017-04-19 19:01:29','2017-04-19 19:01:29'),('FCE7902B74BF45A0A2D5AEDBBC5B80FE','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/geili_thumb.gif\" title=\"[给力]\">','1.0.0',NULL,0,0,'2017-04-19 19:41:55','2017-04-19 19:41:55'),('FF27B14126CC4391AE281B5AB9CE72D7','991836cc46424212aed16d38964f22cd','<img src=\"http://localhost:8080/kim/resources/imgs/face/tza_thumb.gif\" title=\"[可爱]\">','1.0.0',NULL,0,0,'2017-04-19 18:58:34','2017-04-19 18:58:34');

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `log_id` varchar(32) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `className` varchar(100) DEFAULT NULL,
  `method` varchar(100) DEFAULT NULL,
  `time` int(10) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `ipAddress` varchar(100) DEFAULT NULL,
  `is_delete` int(1) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `log` */

insert  into `log`(`log_id`,`user_id`,`user_name`,`description`,`model`,`className`,`method`,`time`,`ip`,`ipAddress`,`is_delete`,`create_time`) values ('149a5e72ef11461ba3a16f8a333c4fef','991836cc46424212aed16d38964f22cd','kim','kim调用了checkUserEmail方法','user','com.kim.service.user.impl.UserServiceImpl','checkUserEmail',3,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:11:11'),('15cb327a2d014d0a8998bc4439295c84','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',1,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-29 22:38:17'),('192cc41b1408418880f968291c8a3353','991836cc46424212aed16d38964f22cd','kim','kim调用了findArticles方法','article','com.kim.service.article.impl.ArticleServiceImpl','findArticles',23,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-25 22:40:08'),('285340415a49443293b9700c125c21c7','991836cc46424212aed16d38964f22cd','kim','kim调用了findArticles方法','article','com.kim.service.article.impl.ArticleServiceImpl','findArticles',23,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-26 14:56:00'),('297c87f1c6fc4b879cc9aaf547bfaeb9','991836cc46424212aed16d38964f22cd','kim','kim调用了saveArticle方法','article','com.kim.service.article.impl.ArticleServiceImpl','saveArticle',2,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-23 10:36:18'),('343e1978f03f49a2a57ba59f138b7d59','991836cc46424212aed16d38964f22cd','kim','kim调用了checkUserEmail方法','user','com.kim.service.user.impl.UserServiceImpl','checkUserEmail',3,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:11:08'),('350082b128b24575b63b258d903b9dbe','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',6,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:09:06'),('4011217da8f04ec99e66a1612b19ec13','991836cc46424212aed16d38964f22cd','kim','kim调用了countArticle方法','article','com.kim.service.article.impl.ArticleServiceImpl','countArticle',0,'127.0.0.1','广东省 深圳市 南山区',0,'2017-04-09 22:42:32'),('40b792dfff064e0fafa7b3c616f34fe9','991836cc46424212aed16d38964f22cd','kim','kim调用了countArticle方法','article','com.kim.service.article.impl.ArticleServiceImpl','countArticle',1,'127.0.0.1','广东省 深圳市 南山区',NULL,'2017-03-23 10:18:41'),('4c36df4073cd46a8829cffbba843fc38','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',4,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:10:49'),('4db3764797a940f88edee447fbdd8b65','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',2,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-29 22:30:56'),('54f1f48f8f7d4ab293b3c9d3eb42cee8','991836cc46424212aed16d38964f22cd','kim','kim调用了checkUserEmail方法','user','com.kim.service.user.impl.UserServiceImpl','checkUserEmail',2,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:13:01'),('55fb9591426d4e05bf735429c3a4c95a','991836cc46424212aed16d38964f22cd','kim','kim调用了checkUserEmail方法','user','com.kim.service.user.impl.UserServiceImpl','checkUserEmail',2,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:16:49'),('5634a903ed7f4c52b393a91d61f24287','991836cc46424212aed16d38964f22cd','kim','kim调用了findArticles方法','article','com.kim.service.article.impl.ArticleServiceImpl','findArticles',1,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-25 22:57:13'),('58449c8d4ff7434aaba31a31c566c570','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',7,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:10:33'),('5956f17f03ff46bf903d21d8bcef7689','991836cc46424212aed16d38964f22cd','kim','kim调用了countArticle方法','article','com.kim.service.article.impl.ArticleServiceImpl','countArticle',1,'127.0.0.1','本地 ',0,'2017-03-23 10:27:40'),('598a7cdfc0f1478390721ec673e8e417','991836cc46424212aed16d38964f22cd','kim','kim调用了findArticles方法','article','com.kim.service.article.impl.ArticleServiceImpl','findArticles',2,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-26 15:06:49'),('5e993cd774804017971a4d2d2aa0fac0','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',3,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:12:34'),('6614a18d71a74476928a6a93e9d951d6','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',4,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:12:32'),('6663f918c3274cf8a8dd55874a1d6eec','991836cc46424212aed16d38964f22cd','kim','kim调用了findArticles方法','article','com.kim.service.article.impl.ArticleServiceImpl','findArticles',84,'127.0.0.1','广东省 深圳市 南山区',0,'2017-04-09 22:42:32'),('69d860092ff74a3292db67491242023f','991836cc46424212aed16d38964f22cd','kim','kim调用了countArticle方法','article','com.kim.service.article.impl.ArticleServiceImpl','countArticle',1,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-26 15:06:49'),('6c3265c877a6471299b77d5ee1104c5a','991836cc46424212aed16d38964f22cd','kim','kim调用了findArticles方法','article','com.kim.service.article.impl.ArticleServiceImpl','findArticles',22,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:06:15'),('72e95240f9284b2fb80c21f0d2351e7f','991836cc46424212aed16d38964f22cd','kim','kim调用了checkUserEmail方法','user','com.kim.service.user.impl.UserServiceImpl','checkUserEmail',2,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:16:38'),('857d019803a748f7a9552ffeca6de8ba','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',5,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:09:16'),('85bd4ea087064377a421badf703daf9c','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',2,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-29 22:34:37'),('90a61480445d4b1cba0b803430fa6650','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',4,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:10:53'),('94df0e988fa5494caea93f62eb052e61','991836cc46424212aed16d38964f22cd','kim','kim调用了countArticle方法','article','com.kim.service.article.impl.ArticleServiceImpl','countArticle',1,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-25 22:57:13'),('959e5cd4a141496f861a2da4217b5d0d','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',4,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:12:43'),('9aa6e7d360b7432dbd8230d336c7eda3','991836cc46424212aed16d38964f22cd','kim','kim调用了checkUserEmail方法','user','com.kim.service.user.impl.UserServiceImpl','checkUserEmail',0,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:12:56'),('a9932319770740d1905d1958d3f8fb9e','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',4,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:10:43'),('b61eeb74485045089890b70708d770e7','991836cc46424212aed16d38964f22cd','kim','kim调用了countArticle方法','article','com.kim.service.article.impl.ArticleServiceImpl','countArticle',2,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:06:15'),('b96ed1bda1a4427c8954dce3096f9ab6','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',3,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:09:22'),('c2d00644026c435d99e66904c50ce01f','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',5,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:16:26'),('cb1bc261319841c0b8aca0b71ae37a6f','991836cc46424212aed16d38964f22cd','kim','kim调用了findArticles方法','article','com.kim.service.article.impl.ArticleServiceImpl','findArticles',39,'127.0.0.1','本地 ',0,'2017-03-23 10:27:40'),('d86830c66dc3490bbe8ba624541beec8','991836cc46424212aed16d38964f22cd','kim','kim调用了findArticles方法','article','com.kim.service.article.impl.ArticleServiceImpl','findArticles',35,'127.0.0.1','广东省 深圳市 南山区',NULL,'2017-03-23 10:18:41'),('dc6882745632448eb20ce877000db0f6','991836cc46424212aed16d38964f22cd','kim','kim调用了countArticle方法','article','com.kim.service.article.impl.ArticleServiceImpl','countArticle',1,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-25 22:40:08'),('e950b6995037441f8dfaf5d1faa4a7cb','991836cc46424212aed16d38964f22cd','kim','kim调用了checkUserEmail方法','user','com.kim.service.user.impl.UserServiceImpl','checkUserEmail',2,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:09:44'),('eb1d8696db1a403897eccbc4ad1c2279','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',4,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:12:38'),('ee63794e91554198be5205aa8ee7d08e','991836cc46424212aed16d38964f22cd','kim','kim调用了checkUserEmail方法','user','com.kim.service.user.impl.UserServiceImpl','checkUserEmail',2,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-31 23:09:37'),('ee9b071726eb467bbb6ee1342c7d0bc9','991836cc46424212aed16d38964f22cd','kim','kim调用了countArticle方法','article','com.kim.service.article.impl.ArticleServiceImpl','countArticle',1,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-26 14:56:00'),('f29f80a0ab1b4b63beac27ccf17459f8','991836cc46424212aed16d38964f22cd','kim','kim调用了getUser方法','user','com.kim.service.user.impl.UserServiceImpl','getUser',2,'127.0.0.1','广东省 深圳市 南山区',0,'2017-03-29 22:38:13');

/*Table structure for table `look` */

DROP TABLE IF EXISTS `look`;

CREATE TABLE `look` (
  `look_id` varchar(32) NOT NULL,
  `article_id` varchar(32) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `is_delete` int(1) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`look_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `look` */

insert  into `look`(`look_id`,`article_id`,`user_id`,`is_delete`,`create_time`,`update_time`) values ('7363444f1c394f66a7d7e9ce211144bf','8e30ea33ae744b7e856017326ba6b424','17AD94A9493547D490AD1A3C4DC75F96',0,'2017-05-04 23:45:11','2017-05-04 23:45:11'),('8e30ea33ae744b9e856017326ba6b242','8e30ea33ae744b7e856017326ba6b424','991836cc46424212aed16d38964f22cd',0,'2017-05-04 23:29:05','2017-05-04 23:43:48');

/*Table structure for table `lookup` */

DROP TABLE IF EXISTS `lookup`;

CREATE TABLE `lookup` (
  `lookup_id` varchar(32) NOT NULL,
  `lookupdf_id` varchar(32) DEFAULT NULL,
  `lookup_code` varchar(100) DEFAULT NULL,
  `lookup_name` varchar(100) DEFAULT NULL,
  `lookup_description` varchar(100) DEFAULT NULL,
  `lookup_status` int(1) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `is_delete` int(1) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`lookup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `lookup` */

/*Table structure for table `lookupdf` */

DROP TABLE IF EXISTS `lookupdf`;

CREATE TABLE `lookupdf` (
  `lookupdf_id` varchar(32) NOT NULL,
  `lookupdf_code` varchar(100) DEFAULT NULL,
  `lookupdf_name` varchar(100) DEFAULT NULL,
  `lookupdf_description` varchar(100) DEFAULT NULL,
  `lookupdf_status` int(1) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `is_delete` int(1) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`lookupdf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `lookupdf` */

/*Table structure for table `music` */

DROP TABLE IF EXISTS `music`;

CREATE TABLE `music` (
  `music_id` varchar(32) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `music_ategory_id` varchar(32) DEFAULT NULL,
  `singer` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `album` varchar(100) DEFAULT NULL,
  `size` text,
  `time` varchar(10) DEFAULT NULL,
  `playSrc` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `lrc` text,
  `is_delete` int(1) DEFAULT NULL,
  `listens` int(11) DEFAULT NULL,
  `loves` int(11) DEFAULT NULL,
  `collections` int(11) DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `descriptions` varchar(1000) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`music_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `music` */

/*Table structure for table `music_category` */

DROP TABLE IF EXISTS `music_category`;

CREATE TABLE `music_category` (
  `music_category_id` varchar(32) NOT NULL,
  `code` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `is_delete` int(1) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`music_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `music_category` */

insert  into `music_category`(`music_category_id`,`code`,`type`,`is_delete`,`create_time`,`update_time`) values ('231e6ef1ea374a099b93f84d0b4e84e5',5,'重金属',0,'2016-11-06 00:41:43','2017-03-22 10:51:48'),('3575af4380b34d928b1af8574bd71fd0',6,'轻音乐',0,'2016-11-06 00:42:00','2017-03-22 10:52:07'),('44b5ef4cfcc74dbb8c384e16e07a4b17',7,'黑暗',0,'2016-11-06 00:42:18','2017-03-22 10:52:22'),('53dd2cd1d4f04719ba18e107e154cda1',3,'民谣',0,'2016-11-06 00:40:28','2017-03-22 10:51:22'),('9e72002288f54a43a6b017562f7968e1',8,'爵士',0,'2016-11-06 00:42:41','2017-03-22 10:52:40'),('a271a99167a34097b9a0a916a1de8e2b',9,'乡村',0,'2016-11-06 00:42:52','2017-03-22 10:52:45'),('a4cafaee1d9542dcb9f58f2429f8a4e0',4,'名族风',0,'2016-11-06 00:41:08','2017-03-22 10:51:36'),('a730ed359f2143faaffb23b1bfe9feea',11,'拉丁',0,'2016-11-06 00:43:17','2017-03-22 10:50:14'),('ceb57470cded4a3db2421a403f6c2da0',13,'迷幻',0,'2016-11-06 00:43:36','2017-03-22 10:50:49'),('d289c6bdb187406bb677df7929a67c00',10,'古典',0,'2016-11-06 00:43:02','2017-03-22 10:49:59'),('eaced10ac7f44b0fadb1a14f04b2f162',12,'儿童',0,'2016-11-06 00:43:23','2017-03-22 10:50:31'),('f2d994bee79e4140bcaa02629cc7d064',1,'流行',0,'2016-11-06 00:40:36','2017-03-22 10:49:45'),('f38cc30569e4482588f09ad4d05af62d',2,'摇滚',0,'2016-11-06 00:40:41','2017-03-22 10:51:03');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `name` varchar(100) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '用户密码',
  `ip` varchar(100) DEFAULT NULL COMMENT 'IP',
  `ipAddress` varchar(100) DEFAULT NULL COMMENT 'IP地址',
  `header_pic` varchar(200) DEFAULT NULL COMMENT '用户头像',
  `address` varchar(200) DEFAULT NULL COMMENT '用户地址',
  `activeCode` char(32) DEFAULT NULL COMMENT '激活码',
  `level` int(3) DEFAULT NULL COMMENT '用户级别',
  `is_active` int(1) DEFAULT NULL COMMENT '是否已激活  1--已激活 0--未激活',
  `is_forbid` int(1) DEFAULT NULL COMMENT '是否已禁用  1--已禁用 0--未禁用',
  `is_delete` int(1) DEFAULT NULL COMMENT '是否已删除  1--已删除 0--未删除',
  `sex` int(1) DEFAULT NULL COMMENT '性别  0--女 1--男 3--保密',
  `age` int(10) DEFAULT NULL COMMENT '年龄',
  `tel` varchar(100) DEFAULT NULL COMMENT '电话',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `qq` int(11) DEFAULT NULL COMMENT 'qq',
  `weixin` varchar(100) DEFAULT NULL COMMENT '微信',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `description` varchar(1000) DEFAULT NULL COMMENT '个人简介',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `role_id` int(100) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`name`,`password`,`ip`,`ipAddress`,`header_pic`,`address`,`activeCode`,`level`,`is_active`,`is_forbid`,`is_delete`,`sex`,`age`,`tel`,`email`,`qq`,`weixin`,`birthday`,`description`,`create_time`,`update_time`,`role_id`) values ('17AD94A9493547D490AD1A3C4DC75F96','kimi','4QrcOUm6Wau+VuBX8g+IPg==','127.0.0.1','本地 ','/resources/imgs/user/small.png',NULL,'6EFE933965BF4FB1A84E67FBF3457DB5',NULL,1,0,0,NULL,NULL,NULL,'2053868842@qq.com',NULL,NULL,NULL,NULL,'2017-04-10 23:31:49','2017-04-11 09:16:40',1),('991836cc46424212aed16d38964f22cd','kim','4QrcOUm6Wau+VuBX8g+IPg==','127.0.0.1','广东省 深圳市 南山区','/resources/imgs/user/small.png','广东省 深圳市 南山区',NULL,NULL,1,0,0,1,23,'18378311282','1134771121@qq.com',1134771121,'xdj1888',NULL,NULL,'2016-09-04 11:13:16','2017-04-12 22:46:58',1);

/*Table structure for table `zan` */

DROP TABLE IF EXISTS `zan`;

CREATE TABLE `zan` (
  `zan_id` varchar(32) NOT NULL,
  `article_id` varchar(32) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `is_delete` int(1) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`zan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zan` */

insert  into `zan`(`zan_id`,`article_id`,`user_id`,`is_delete`,`create_time`,`update_time`) values ('6341a796c50948018b5924404e61f257','8e30ea33ae744b7e856017326ba6b424','17AD94A9493547D490AD1A3C4DC75F96',0,'2017-05-03 22:55:08','2017-05-04 22:44:14'),('d27b1cb3f3204b7f9ab5f5417b02c732','8e30ea33ae744b7e856017326ba6b424','991836cc46424212aed16d38964f22cd',0,'2017-05-04 10:10:28','2017-05-04 22:40:37');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
