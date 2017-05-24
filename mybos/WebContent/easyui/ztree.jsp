<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ztree demo</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/demo.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/ztree/zTreeStyle.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/ztree/jquery.ztree.all-3.5.js"></script>



</head>
<body class="easyui-layout">
	<div title="XX管理系统" data-options="region:'north'" style="height: 100px">北部区域</div>
	<div title="系统菜单" data-options="region:'west'" style="width: 200px">
		<div title="easyui-accordion" data-otions=""fit:true"" >
			<div title="test1">
					<a class="easyui-linkbutton" onclick="doAdd()">_google</a>
					<script type="text/javascript">
						function doAdd() {
							//动态添加一个选项卡面板
							$("#tt").tabs("add",{
								title : '这个可是动态的',
								content : '<iframe frameborder="0" width="100%" height="100%" src="page_base_staff.action"></iframe>',
								closable : true,
								iconCls : 'icon-search'
							});
						}
					</script>
			</div>
			
			<div title="test2">
				<ul id="ztree1" class="ztree"></ul>
				<script type="text/javascript">
					$(function() {
						var setting = {};
						
						var zNodes =[{name : '系统管理'},{name : '用户管理',
							children : [{name : '用户添加'},{name : '用户修改'}]},{name : '权限管理'}];
						$.fn.zTree.init($("#ztree1"),setting, zNodes);
					});
				</script>
			</div>
			
			<div title="test3">
				<ul id="ztree2" class="ztree"></ul>
				<script type="text/javascript">
					$(function() {
						var setting2 = {
							data : {
								simpleData : {
									enable :true
								}
							}	
						};
						
						var zNodes2 = [{
							id : '1',
							pId : '0',
							name : '系统管理'
						},
						{
							id : '2',
							pId : '0',
							name : '用户管理'
						},
						{
							id : '21',
							pId : '2',
							name : '用户添加'
						},
						{
							id : '22',
							pId : '2',
							name : '用户修改'
						},
						{
							id : '3',
							pId : '0',
							name : '权限管理'
						}
						];
						$.fn.zTree.init($("#ztree2"),setting2,zNodes2);
					});
				</script>
			</div>
			
			<div title="test4">
				<ul id="ztree3" class="ztree"></ul>
				<script type="text/javascript">
					$(function() {
						var settings = {
								data : {
									simpleData : {
										enable :true
									}
								},
								callback : {
									onClick : function(a,b,treeNode) {
										var page = treeNode.page;
										if (page != undefined) {//判断当前选项卡是否打开
											var e = $("#tt").tabs("exists",treeNode.name);
											if(e){
												//已经打开
												$("#tt").tabs("select",treeNode.name);
												
											}else {
											$("#tt")
											.tabs(
													"add",
													{
														title : treeNode.name,
														content : '<iframe frameborder="0" width="100%" height="100%" src="'+page+'"></iframe>',
														closable : true,
														iconCls : 'icon-edit'
													});
										}
										}
									}
								}
						};
						 //发送ajax请求获取json数据构造ztree
					    var url = "${pageContext.request.contextPath}/json/menu.json";
						$.post(url,{},function(data){
							//创建ztree
							$.fn.zTree.init($("#ztree3"), setting3, data);
						},'json');
					});
				</script>
			</div>
		</div>
	</div>
	<div data-options="region:'center'">
		<div id="tt" class="easyui-tabs" data-options="fit:true">
			<!-- 每个子div是其中的一个面板 -->
			<div data-options="closable:true,iconCls:'icon-help'" title="面板一">棉衣一</div>
			<div title="面板二">test2</div>
			<div title="面板三">test3</div>
		</div>
	</div>
	<div data-options="region:'east'" style="width: 100px">东部区域</div>
	<div data-options="region:'south'" style="height: 50px">南部区域</div>
</body>
</html>