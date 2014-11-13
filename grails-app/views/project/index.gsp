
<%@ page import="com.rolex.map.Project" %>
<%@ page defaultCodec="none" %>>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="map">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
    <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=95bAGt119O8pULVQqbY0RZGm"></script>
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
                <g:each in="${projectInstanceList}" var="p" status="i">
                    <li>
                        <a href=""><span i="${i}" x="${p.x}" y="${p.y}" >${p.name}</span></a>
                        <div>${p.address}</div>
                    </li>
                </g:each>

            </ul>
            <input type="button" onclick="showWalk()" value="show walk"/>
            <input type="button" onclick="hideWalk()" value="hide walk"/>
            <input type="button" onclick="resetPosition()" value="reset position"/>
            <div id="r-result"></div>
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
        load('${json}');
        showPoint();
    });
    var pointArray;
    function load(data){
        var obj = $(eval('(' + data + ')'));
        pointArray = new Array();
        obj.each(function(i){
            var point = new BMap.Point(obj[i].x, obj[i].y);  // 创建点坐标
            if(i==0){
                map.centerAndZoom(point, 16);
            }
            addMarker(point,null);
            pointArray[i]=point;
        });
        map.setViewport(pointArray);
    }
    function showPoint(){
        $("#project-list").find("a").bind("mouseover",function(){
            var p = new BMap.Point($(this).find("span").attr("x"), $(this).find("span").attr("y"))
            map.panTo(p);
        });
    }
    function resetPosition(){
        map.setViewport(pointArray);
    }
    var walking;
    function showWalk(){
        walking = new BMap.WalkingRoute(map, {renderOptions:{map: map, panel: "r-result", autoViewport: true}});
        walking.search(pointArray[0], pointArray[1]);
    }

    function hideWalk(){
        walking.clearResults();
    }
    /*

     $(function(){
     load('${json}');
     $("#project-list").find("a").bind("mouseover",function(){
     deletePoint();
     *//*var p = new BMap.Point($(this).find("span").attr("x"), $(this).find("span").attr("y"))
     map.panTo(p);
     var marker = new BMap.Marker(p,{icon:myIcon});
     var allOverlay = map.getOverlays();
     alert(allOverlay.length);
     for (var i = 0; i < allOverlay.length -1; i++){
     alert(typeof allOverlay[i])
     //alert(allOverlay[i].getLabel().content)
     *//**//*if(allOverlay[i].getLabel().content == $(this).find("span").attr("i")){
     map.removeOverlay(allOverlay[i]);
     return false;
     }*//**//*
     }*//*
     //marker.setAnimation(BMAP_ANIMATION_BOUNCE);
     //map.addOverlay(marker);
     });
     })
     function load(data){


     }
     function deletePoint(){
     var allOverlay = map.getOverlays();
     for (var i = 0; i < allOverlay.length -1; i++){
     if(allOverlay[i].getLabel().content == "我是id=1"){
     map.removeOverlay(allOverlay[i]);
     return false;
     }
     }
     }*/
    // 百度地图API功能
    /*var map = new BMap.Map("map");
    var point = new BMap.Point(116.404, 39.915);
    map.centerAndZoom(point, 15);
    map.disableDoubleClickZoom(true);*/

    // 编写自定义函数,创建标注
    function addMarker(point,label){
        var marker = new BMap.Marker(point);
        map.addOverlay(marker);
        marker.setLabel(label);
        marker.addEventListener("click", function () {
            var opts = {
                width: 250,     // 信息窗口宽度
                height: 100,     // 信息窗口高度
                title: obj[i].address,  // 信息窗口标题
                enableMessage:false
            }
            var infoWindow = new BMap.InfoWindow(obj[i].name, opts);  // 创建信息窗口对象
            map.openInfoWindow(infoWindow, point);      // 打开信息窗口
        });
    }

    function deletePoint(){
        var allOverlay = map.getOverlays();
        for (var i = 0; i < allOverlay.length -1; i++){
            if(allOverlay[i].getLabel().content == "我是id=1"){
                map.removeOverlay(allOverlay[i]);
                return false;
            }
        }
    }
    function callback(data){

    }
</script>
</body>
</html>
