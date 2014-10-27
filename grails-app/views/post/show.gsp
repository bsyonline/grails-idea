<%@ page import="com.rolex.blog.Post" %>
<%@ page defaultCodec="none" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="index">
    <style>
    .primary {
        max-width: 700px !important;
        width: expression(this.width>480?"700px":this.width+"px") !important;
        padding-left: 10px !important;
    }

    .post-bottom-section {
        padding: 0 15px 20px 0 !important;
    }
    </style>
</head>

<body>
<div class="content-wrap">
<!-- content -->
<div class="content clearfix">
<!-- sidebar -->
<div class="sidebar hidden-xs hidden-sm">


    <div class="sidemenu">
        <h3>Tags</h3>
        <ul class="tag">
        </ul>
    </div>

    <div class="sidemenu">
        <h3>Sponsors</h3>
        <ul>
            <li><a href="http://themeforest.net?ref=ealigam" title="Site Templates">Themeforest
                <span>Site Templates, Web &amp; CMS Themes.</span></a>
            </li>
            <li><a href="http://www.4templates.com/?go=228858961" title="Website Templates">4Templates
                <span>Low Cost High-Quality Templates.</span></a>
            </li>
            <li><a href="http://store.templatemonster.com?aff=ealigam" title="Web Templates">Templatemonster
                <span>Delivering the Best Templates on the Net!</span></a>
            </li>
            <li><a href="http://graphicriver.net?ref=ealigam" title="Stock Graphics">Graphic River
                <span>Awesome Stock Graphics.</span></a>
            </li>
            <li><a href="http://www.dreamhost.com/r.cgi?287326|sshout" title="Webhosting">Dreamhost
                <span>Premium Webhosting. Use the promocode <strong>sshout</strong> and save <strong>50
                USD</strong>.</span></a>
            </li>
        </ul>
    </div>

    <div class="sidemenu popular">
        <h3>Most Popular</h3>
        <ul>
            <li><a href="index.html">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
                <span>Posted on December 22, 2010</span></a>
            </li>
            <li><a href="index.html">Cras fringilla magna. Phasellus suscipit.
                <span>Posted on December 20, 2010</span></a>
            </li>
            <li><a href="index.html">Morbi tincidunt, orci ac convallis aliquam.
                <span>Posted on December 15, 2010</span></a>
            </li>
            <li><a href="index.html">Ipsum dolor sit amet, consectetuer adipiscing elit.
                <span>Posted on December 14, 2010</span></a>
            </li>
            <li><a href="index.html">Morbi tincidunt, orci ac convallis aliquam, lectus turpis varius lorem
                <span>Posted on December 12, 2010</span></a>
            </li>
        </ul>
    </div>
    <!-- /sidebar -->
</div>

<div class="white-bar hidden-md hidden-lg">
</div>
<!-- main -->
<div class="main">
<article class="post">
    <div class="primary">
        <h2><a href="index.html">${postInstance.title}</a></h2>

        <p class="post-info"><span></span> <a href="index.html">12:30 PM</a>, <a
                href="index.html">internet</a>
            <span class="user"></span><a href="#">${postInstance.publisher.username}</a>
            <span class="time"></span>12:30 PM
            <span class="comment"></span><a href="#">2 Comments</a>
        </p>

        <div class="image-section">
            <img src="${resource(dir: "images", file: "/img-post.jpg")}" alt="image post"/>
        </div>
        ${postInstance.content}
        <!-- /post -->
    </div>
</article>
<!-- post-bottom-section -->
        <div class="comment-list">
<g:each in="${postInstance.replies}" var="reply" status="i">
            <div class="comment-body">
                <div class="avatar"><img alt="" src="${resource(dir: "images", file: "/avatar.jpg")}" class="avatar" height="42" width="42"/></div>
                <div class="comment-info">
                    <div class="author-name">Erwin</div>
                    <div class="comment-text">${reply.content}</div>
                    <div class="comment-data">
                        <span class="comment-time">10:00 pm</span>
                        <span class="comment"><a href="#comment-63" title="">3</a></span>
                    </div>
                    <g:if test="${reply?.replies}">
                        <div class="triangle-up-border"></div>
                        <div class="triangle-up-background"></div>
                        <div class="reply-list" id="reply-list-${i}">

                            <div>
                                <g:each in="${reply.replies}" var="r">
                                <span onclick="show('${i}')"><img alt="" src="${resource(dir: "images", file: "/avatar.jpg")}" class="avatar" height="42" width="42"/></span>
                                </g:each>
                            </div>

                        </div>

                    </g:if>
                    <div id="more-${i}" class="more-replies">
                        <div class="quick-reply">
                        <g:formRemote name="quickReplyForm" url="[controller: 'reply', action:'reply']" onSuccess="quickReplySuccess(data)">
                            <g:hiddenField id="replyTo-id" name="replyTo.id" value=""/>
                            <g:hiddenField id="replier-id" name="replier.id" value="1"/>
                            <input type="text" name="content" class="quick-input">
                            <g:actionSubmit action="reply" class="button quick-btn" value="submit"/>
                        </g:formRemote>
                        </div>
                        <div class="inner-reply-list">
                        <g:each in="${reply.replies}" var="r">
                            <div class="inner-reply-body">
                                <div class="inner-avatar"><img alt="" src="${resource(dir: "images", file: "/avatar.jpg")}" height="42" width="42"/></div>
                                <div class="inner-info">
                                    <div class="inner-author-name" id="inner-author-name-${r.id}">rolex</div>
                                    <div class="inner-comment-text">${r.content}</div>
                                    <div class="inner-comment-data">
                                        <span class="inner-comment-time">${new java.util.Date()}</span>
                                        <span class="inner-comment"><a href="javascript:void(0)" onclick="quickreply('${r.id}')">回复</a></span>
                                    </div>
                                </div>
                            </div>
                        </g:each>
                        </div>
                        <div onclick="hide('${i}')" class="close-btn">关闭</div>
                    </div>
                </div>
            </div>
</g:each>
        </div>



<g:formRemote name="myForm" url="[controller: 'reply', action:'reply']" class="hidden-xs" onSuccess="replySuccess(data)">
    <g:hiddenField id="post-id" name="post.id" value="${postInstance?.id}"/>
    <g:hiddenField id="replier-id" name="replier.id" value="1"/>
    <div>
        <g:textArea class="ckeditor" name="content" id="content"></g:textArea>
    </div>

    <div class="no-border">
        <g:actionSubmit action="reply" class="button" value="Submit comment"/>
    </div>

</g:formRemote>

<!-- /main -->
</div>

<!-- content -->
</div>

<!-- /content-out -->
</div>
<g:javascript>
$(function(){
     if($(window).width() < 300){
        $(".comment-body > .avatar").hide()
     }
     if($(window).width() < 480){
        $(".comment-body > .comment-info").css("margin-left","10px")
        $(".inner-info").css("margin-left","10px")
        $(".quick-input").css("width","72%")

        $(".inner-avatar").hide()
     }
     $(window).resize(function(){
        if($(window).width()<300){
            $(".comment-body > .avatar").hide()
        }else if($(window).width()<480){
            $(".comment-body > .comment-info").css("margin-left","10px")
            $(".inner-info").css("margin-left","10px")
            $(".quick-input").css("width","72%")
            $(".inner-avatar").hide()
        }else{
            $(".comment-body > .comment-info").css("margin-left","100px")
            $(".inner-info").css("margin-left","70px")
            $(".quick-input").css("width","79%")
            $(".comment-body > .avatar").show()
            $(".inner-avatar").show()
        }
     });
});
function show(arg){
    $("#more-"+arg).show()
    $("#reply-list-"+arg).hide()
}
function hide(arg){
    $("#more-"+arg).hide()
    $("#reply-list-"+arg).show()
}
    function replySuccess(data){
        if(data){

            var text="<div class='comment-body'>"
                +"<div class='avatar'><img alt='' src='${resource(dir: 'images', file: '/avatar.jpg')}' class='avatar' height='42' width='42'/></div>"
                +"<div class='comment-info'>"
                +"<div class='author-name'>Erwin</div>"
                +"<div class='comment-text'>"+CKEDITOR.instances.content.getData()+"</div>"
                +"<div class='comment-data'>"
                +"<span class='comment-time'>"+new Date()+"</span>"
                +"<span class='comment'><a href='#comment-63' title=''>3</a></span>"
                +"</div></div></div>"

            $(".comment-list").append($(text))
            CKEDITOR.instances.content.setData("");
        }else{
            alert('false')
        }
    }

    function quickreply(arg){
        var rname = $("#inner-author-name-"+arg).text();
        $("input[name=content]").focus().val("@"+rname+"：");
        $("input[name=content]").val();
    }


</g:javascript>
</body>
</html>
