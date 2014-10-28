<%@page defaultCodec="none" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="index"/>
</head>
<body>
<!-- content-wrap -->
<div class="content-wrap">

    <!-- content -->
    <div class="content clearfix">

        <!-- sidebar -->
        <div class="sidebar hidden-xs hidden-sm">

            <div class="about-me">

                <h3>About Me</h3>

                <p>
                    <a href="index.html"><img src="images/gravatar.jpg" width="42" height="42" alt="firefox"
                                              class="align-left"/></a>
                    Lorem ipsum dolor sit, consectetuer adipiscing. Donec libero. Suspendisse bibendum.
                    Cras id urna. Morbi tincidunt, orci ac convallis aliquam, lectus turpis varius lorem, eu
                    posuere nunc justo tempus leo suspendisse bibendum. <a href="index.html">Learn more...</a>
                </p>

            </div>

            <div class="sidemenu" id="tags">

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
            <g:each in="${postInstanceList}" var="post">
                <article class="post">

                    <div class="primary">

                        <h2><a href="index.html">${post.title}</a></h2>

                        <p class="post-info"><span>filed under</span> <a href="index.html">templates</a>, <a
                                href="index.html">internet</a></p>

                        <div class="image-section">
                            <img src="${resource(dir: "images",file: "/img-post.jpg")}" alt="image post" />
                        </div>

                        ${post.content}
                        <p><g:link action='show' controller='post' id='${post.id}' class="more">Continue Reading &raquo;</g:link></p>

                    </div>
                    <aside class="hidden-xs" >

                        <p class="dateinfo">JAN<span>31</span></p>

                        <div class="post-meta">
                            <h4>Post Info</h4>
                            <ul>
                                <li class="user"><a href="#">${post.author.username}</a></li>
                                <li class="time"><a href="#">12:30 PM</a></li>
                                <li class="comment"><a href="#">2 Comments</a></li>
                                <li class="permalink"><a href="#">Permalink</a></li>
                            </ul>
                        </div>

                    </aside>
                </article>
            </g:each>
        <!-- /main -->
        </div>

        <!-- content -->
    </div>

    <!-- /content-out -->
</div>
<script>
    $(function(){
        $.post('${resource(dir: "/")}tag/getTags',{},function(data){
            var tag = "";

            $(data).each(function(i){

                tag += '<li><a href="index.html">'+data[i].name+'</a><span></span></li>';

            });
            $("#tags").children("ul").append(tag);
        });
    });
</script>
</body>
</html>
