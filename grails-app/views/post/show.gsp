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
            <span class="user"></span><a href="#">${postInstance.publisher}</a>
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
<g:each in="${postInstance.replies}" var="reply">
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
                    <div class="reply-list">
                        <div>
                            <g:each in="${reply.replies}" var="r">
                            <span><img alt="" src="${resource(dir: "images", file: "/avatar.jpg")}" class="avatar" height="42" width="42"/></span>
                            </g:each>
                        </div>
                    </div>
                    </g:if>
                </div>
            </div>
</g:each>
        </div>



<form action="index.html" method="post" id="commentform" class="hidden-xs">

    <div>
        <label for="name">Name <span>*</span></label>
        <input id="name" name="name" value="Your Name" type="text" tabindex="1"/>
    </div>

    <div>
        <label for="email">Email Address <span>*</span></label>
        <input id="email" name="email" value="Your Email" type="text" tabindex="2"/>
    </div>

    <div>
        <label for="website">Website</label>
        <input id="website" name="website" value="Your Website" type="text" tabindex="3"/>
    </div>

    <div>
        <label for="message">Your Message <span>*</span></label>
        <textarea id="message" name="message" rows="10" cols="18" tabindex="4"></textarea>
    </div>

    <div class="no-border">
        <input class="button" type="submit" value="Submit Comment" tabindex="5"/>
    </div>

</form>

<!-- /main -->
</div>

<!-- content -->
</div>

<!-- /content-out -->
</div>
</body>
</html>
