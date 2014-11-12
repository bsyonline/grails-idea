
<%@ page import="com.rolex.map.Project" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="map">
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
		<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
        <script type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=95bAGt119O8pULVQqbY0RZGm"></script>
        <style>
        .content{
            height: 557px;

        }
        .left{
            width: 300px;
            height: 100%;
            float: left;
            border: solid 1px #e5e5e5;
            padding: 10px;
        }
        .right{
            border: solid 1px #e5e5e5;
            margin-left: 300px;
            width: auto;
            height: 100%;
        }
        #project-list ul{
            padding-left: 0px;
            margin-top: 10px;
            line-height: 30px;
        }
        #project-list ul,#project-list li {
            list-style: none;
        }
        #map{
            width: 100%;
            height: 100%;
        }
        </style>
	</head>
	<body>
    <div class="content">
        <div class="left">
        <h1></h1>
        <div class="search">
            <g:formRemote name="search" url="[controller:'project',action:'search']" onSuccess="callback(data);">
                <g:field type="text" id="name" name="projectName"></g:field>
                <g:actionSubmit controller="project" action="search" value="search"></g:actionSubmit>
            </g:formRemote>
        </div>
        <div id="project-list">
            <ul>
                <g:each in="${projectInstanceCount}" var="p">
                    <li>
                        <a href=""><span>${p.name}</span></a>
                        <div>${p.address}</div>
                    </li>
                </g:each>

            </ul>
        </div>
        </div>
        <div class="right">
            <div id="map"></div>
        </div>
    </div>

    <script type="text/javascript">
        var map = new BMap.Map("map");
        map.addControl(new BMap.NavigationControl());
        map.addControl(new BMap.ScaleControl());
        map.addControl(new BMap.OverviewMapControl());
        map.addControl(new BMap.MapTypeControl());
        map.setCurrentCity("北京"); // 仅当设置城市信息时，MapTypeControl的切换功能才能可用
        map.enableScrollWheelZoom(true);
        var myIcon = new BMap.Icon("${resource(dir: 'images',file: 'map-icon.png')}", new BMap.Size(32, 32));

        $(function(){
            load(data);
        })
        function load(data){
            data.each(function(i){

                var point = new BMap.Point(116.25675, 40.222400);  // 创建点坐标
                var marker = new BMap.Marker(point, {icon: myIcon});
                marker.addEventListener("click", function () {
                    var opts = {
                        width: 250,     // 信息窗口宽度
                        height: 100,     // 信息窗口高度
                        title: "Hello"  // 信息窗口标题
                    }
                    var infoWindow = new BMap.InfoWindow("World", opts);  // 创建信息窗口对象
                    map.openInfoWindow(infoWindow, map.getCenter());      // 打开信息窗口
                });
                if(i==0){
                    map.centerAndZoom(point, 15);
                }
                map.addOverlay(marker);
            });

        }

        function callback(data){

        }
    </script>
	</body>
</html>
