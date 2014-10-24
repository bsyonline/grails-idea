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
<div class="post-bottom-section">
    <ol class="commentlist">
        <li class="depth-1">
            <div class="comment-info">
                <img alt="" src="images/gravatar.jpg" class="avatar" height="42" width="42"/>
                <cite>
                    <a href="index.html">Erwin</a> Says: <br/>
                    <span class="comment-data"><a href="#comment-63" title="">January 31st, 2010 at 10:00 pm</a></span>
                </cite>
            </div>

            <div class="comment-text">
                <p>Comments are great!</p>

                <div class="reply">
                    <a rel="nofollow" class="comment-reply-link" href="index.html">Reply</a>
                </div>
            </div>
            <ul class="children">
                <li class="depth-2">
                    <div class="comment-info">
                        <img alt="" src="images/gravatar.jpg" class="avatar" height="42" width="42"/>
                        <cite>
                            <a href="index.html">Erwin</a> Says: <br/>
                            <span class="comment-data"><a href="#" title="">January 31st, 2010 at 8:15 pm</a></span>
                        </cite>
                    </div>

                    <div class="comment-text">
                        <p>And here is a threaded comment.</p>

                        <div class="reply">
                            <a rel="nofollow" class="comment-reply-link" href="index.html">Reply</a>
                        </div>
                    </div>
                </li>
                <li class="depth-2">
                    <div class="comment-info">
                        <img alt="" src="images/gravatar.jpg" class="avatar" height="42" width="42"/>
                        <cite>
                            <a href="index.html">Erwin</a> Says: <br/>
                            <span class="comment-data"><a href="#" title="">January 31st, 2010 at 8:15 pm</a></span>
                        </cite>
                    </div>

                    <div class="comment-text">
                        <p>And here is another threaded comment.</p>

                        <div class="reply">
                            <a rel="nofollow" class="comment-reply-link" href="index.html">Reply</a>
                        </div>
                    </div>
                    <ul class="children">
                        <li class="depth-3">
                            <div class="comment-info">
                                <img alt="" src="images/gravatar.jpg" class="avatar" height="42" width="42"/>
                                <cite>
                                    <a href="index.html">Erwin</a> Says: <br/>
                                    <span class="comment-data"><a href="#" title="">January 31st, 2010 at 8:10 pm</a>
                                    </span>
                                </cite>
                            </div>

                            <div class="comment-text">
                                <p>Threaded comments are cool!</p>

                                <div class="reply">
                                    <a rel="nofollow" class="comment-reply-link" href="index.html">Reply</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </li>
        <li class="thread-alt depth-1">
            <div class="comment-info">
                <img alt="" src="images/gravatar.jpg" class="avatar" height="42" width="42"/>
                <cite>
                    <a href="index.html">Erwin</a> Says: <br/>
                    <span class="comment-data"><a href="#comment-63" title="">January 31st, 2010 at 8:00 pm</a></span>
                </cite>
            </div>

            <div class="comment-text">
                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero.
                Suspendisse bibendum.</p>

                <div class="reply">
                    <a rel="nofollow" class="comment-reply-link" href="index.html">Reply</a>
                </div>
            </div>
            <ul class="children">
                <li class="depth-2">
                    <div class="comment-info">
                        <img alt="" src="images/gravatar.jpg" class="avatar" height="42" width="42"/>
                        <cite>
                            <a href="index.html">Erwin</a> Says: <br/>
                            <span class="comment-data"><a href="#" title="">January 31st, 2010 7:35 pm</a></span>
                        </cite>
                    </div>

                    <div class="comment-text">
                        <p>Donec libero. Suspendisse bibendum.</p>

                        <div class="reply">
                            <a rel="nofollow" class="comment-reply-link" href="index.html">Reply</a>
                        </div>
                    </div>
                    <ul class="children">
                        <li class="depth-3">
                            <div class="comment-info">
                                <img alt="" src="images/gravatar.jpg" class="avatar" height="42" width="42"/>
                                <cite>
                                    <a href="index.html">Erwin</a> Says: <br/>
                                    <span class="comment-data"><a href="#" title="">January 31st, 2010 at 7:20 pm</a>
                                    </span>
                                </cite>
                            </div>

                            <div class="comment-text">
                                <p>Threaded comments are cool!</p>

                                <div class="reply">
                                    <a rel="nofollow" class="comment-reply-link" href="index.html">Reply</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </li>
        <li class="depth-1">
            <div class="comment-info">
                <img alt="" src="images/gravatar.jpg" class="avatar" height="42" width="42"/>
                <cite>
                    <a href="index.html">Erwin</a> Says: <br/>
                    <span class="comment-data"><a href="#comment-63" title="">January 31st, 2010  at 6:08 pm</a></span>
                </cite>
            </div>

            <div class="comment-text">
                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum.
                Cras id urna. Morbi tincidunt, orci ac convallis aliquam, lectus turpis varius lorem, eu
                posuere nunc justo tempus leo.</p>

                <div class="reply">
                    <a rel="nofollow" class="comment-reply-link" href="index.html">Reply</a>
                </div>
            </div>
            <ul class="children">

                <li class="depth-2">

                    <div class="comment-info">
                        <img alt="" src="images/gravatar.jpg" class="avatar" height="42" width="42"/>
                        <cite>
                            <a href="index.html">Erwin</a> Says: <br/>
                            <span class="comment-data"><a href="#comment-63" title="">January 31st, 2010 at 6:08 pm</a>
                            </span>
                        </cite>
                    </div>

                    <div class="comment-text">
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>

                        <div class="reply">
                            <a rel="nofollow" class="comment-reply-link" href="index.html">Reply</a>
                        </div>
                    </div>

                </li>

            </ul>

        </li>

        <!-- /comment-list -->
    </ol>
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
