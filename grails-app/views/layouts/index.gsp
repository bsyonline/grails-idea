<%--
  Created by IntelliJ IDEA.
  User: rolex
  Date: 14-10-19
  Time: 上午11:43
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<!--[if IE 7 ]>
<html class="ie7 oldie"> <![endif]-->
<!--[if IE 8 ]>
<html class="ie8 oldie"> <![endif]-->
<!--[if IE 9 ]>
<html class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html> <!--<![endif]-->

<head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <meta name="description" content="">
    <meta name="author" content="">

    <title>grails-blog</title>


    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <g:javascript src="jquery-1.11.1.min.js"/>
    <g:javascript src="scrollToTop.js"/>
    <g:javascript src="../ckeditor/ckeditor.js" />
    <g:layoutHead/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap/css/bootstrap.min.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'blog.css')}" type="text/css">
</head>

<body id="top">

<!--header -->
<div class="header-wrap">
    <header>

        <hgroup>

            <h3>Just Another Styleshout Template</h3>
        </hgroup>

        <nav class="nav">
            <ul>

            </ul>
        </nav>

        <div class="subscribe hidden-xs">
            <span>Subscribe:</span> <a href="#">Email</a> | <a href="#">RSS</a>
        </div>

        <form id="quick-search" class="hidden-xs" method="get" action="index.html">
            <fieldset class="search">
                <label for="qsearch">Search:</label>
                <input class="tbox" id="qsearch" type="text" name="qsearch" value="Search..."
                       title="Start typing and hit ENTER"/>
                <button class="btn" title="Submit Search">Search</button>
            </fieldset>
        </form>

        <!--/header-->
    </header>
</div>

<g:layoutBody/>

<!-- extra -->
<div class="extra-wrap hidden-xs hidden-sm">
    <div class="extra clearfix">

        <div class="gallery clearfix">

            <h3>Flickr Photos </h3>

            <p class="thumbs">
                <a href="index.html"><img src="images/thumb.png" width="42" height="43" alt="thumbnail"/></a>
                <a href="index.html"><img src="images/thumb.png" width="42" height="43" alt="thumbnail"/></a>
                <a href="index.html"><img src="images/thumb.png" width="42" height="43" alt="thumbnail"/></a>
                <a href="index.html"><img src="images/thumb.png" width="42" height="43" alt="thumbnail"/></a>
                <a href="index.html"><img src="images/thumb.png" width="42" height="43" alt="thumbnail"/></a>
                <a href="index.html"><img src="images/thumb.png" width="42" height="43" alt="thumbnail"/></a>
                <a href="index.html"><img src="images/thumb.png" width="42" height="43" alt="thumbnail"/></a>
                <a href="index.html"><img src="images/thumb.png" width="42" height="43" alt="thumbnail"/></a>
                <a href="index.html"><img src="images/thumb.png" width="42" height="43" alt="thumbnail"/></a>
                <a href="index.html"><img src="images/thumb.png" width="42" height="43" alt="thumbnail"/></a>
            </p>

        </div>

        <div class="col first">

            <h3>Contact Info</h3>

            <p>
                <strong>Phone: </strong>+1234567<br/>
                <strong>Fax: </strong>+123456789
            </p>

            <p><strong>Address: </strong>123 Put Your Address Here</p>

            <p><strong>E-mail: </strong>me@coolblue.com</p>

            <p>Want more info - go to our <a href="#">contact page</a></p>

            <h3>Updates</h3>

            <ul class="subscribe-stuff">
                <li><a title="RSS" href="index.html" rel="nofollow">
                    <img alt="RSS" title="RSS" src="images/social_rss.png"/></a>
                </li>
                <li><a title="Facebook" href="index.html" rel="nofollow">
                    <img alt="Facebook" title="Facebook" src="images/social_facebook.png"/></a>
                </li>
                <li><a title="Twitter" href="index.html" rel="nofollow">
                    <img alt="Twitter" title="Twitter" src="images/social_twitter.png"/></a>
                </li>
                <li><a title="E-mail this story to a friend!" href="index.html" rel="nofollow">
                    <img alt="E-mail this story to a friend!" title="E-mail this story to a friend!"
                         src="images/social_email.png"/></a>
                </li>
            </ul>

            <p>Stay up to date. Subscribe via
                <a href="index">RSS</a>, <a href="index">Facebook</a>,
                <a href="index">Twitter</a> or <a href="index">Email</a>
            </p>

        </div>

        <div class="col">

            <h3>Site Links</h3>

            <div class="footer-list">
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="index.html">Style Demo</a></li>
                    <li><a href="index.html">Blog</a></li>
                    <li><a href="index.html">Archive</a></li>
                    <li><a href="index.html">About</a></li>
                    <li><a href="index.html">Template Info</a></li>
                    <li><a href="index.html">Site Map</a></li>
                </ul>
            </div>

            <h3>Friends</h3>

            <div class="footer-list">
                <ul>
                    <li><a href="index.html">consequat molestie</a></li>
                    <li><a href="index.html">sem justo</a></li>
                    <li><a href="index.html">semper</a></li>
                    <li><a href="index.html">magna sed purus</a></li>
                    <li><a href="index.html">tincidunt</a></li>
                    <li><a href="index.html">consequat molestie</a></li>
                    <li><a href="index.html">magna sed purus</a></li>
                </ul>
            </div>

        </div>

        <div class="col">

            <h3>Credits</h3>

            <div class="footer-list">
                <ul>
                    <li><a href="http://jasonlarose.com/blog/110-free-classy-social-media-icons">
                        110 Free Classy Social Media Icons by Jason LaRose
                    </a>
                    </li>
                    <li><a href="http://wefunction.com/2009/05/free-social-icons-app-icons/">
                        Free Social Media Icons by WeFunction
                    </a>
                    </li>
                    <li><a href="http://iconsweets2.com/">
                        Free Icons by Yummygum
                    </a>
                    </li>
                </ul>
            </div>

            <h3>Recent Comments</h3>

            <div class="recent-comments">
                <ul>
                    <li><a href="index.html" title="Comment on title">Whoa! This one is really cool...</a><br/> &#45;
                        <cite>Erwin</cite></li>
                    <li><a href="index.html" title="Comment on title">Wow. This theme is really awesome...</a><br/>
                        &#45; <cite>John Doe</cite></li>
                    <li><a href="index.html" title="Comment on title">Type your comment here...</a><br/>&#45; <cite>Naruto</cite>
                    </li>
                    <li><a href="index.html" title="Comment on title">And don't forget this theme is free...</a><br/>
                        &#45; <cite>Shikamaru</cite></li>
                    <li><a href="index.html" title="Comment on title">Just a simple reply test. Thanks...</a><br/> &#45;
                        <cite>ABCD</cite></li>
                </ul>
            </div>

        </div>

        <div class="col">

            <h3>Archives</h3>

            <div class="footer-list">
                <ul>
                    <li><a href="index.html">January 2010</a></li>
                    <li><a href="index.html">December 2009</a></li>
                    <li><a href="index.html">November 2009</a></li>
                    <li><a href="index.html">October 2009</a></li>
                    <li><a href="index.html">September 2009</a></li>
                </ul>
            </div>

            <h3>Recent Bookmarks</h3>

            <div class="footer-list">
                <ul>
                    <li><a href="index.html">5 Must Have Sans Serif Fonts for Web Designers</a></li>
                    <li><a href="index.html">The Basics of CSS3</a></li>
                    <li><a href="index.html">10 Simple Tips for Launching a Website</a></li>
                    <li><a href="index.html">24 ways: Working With RGBA Colour</a></li>
                    <li><a href="index.html">30 Blog Designs with Killer Typography</a></li>
                    <li><a href="index.html">The Principles of Great Design</a></li>
                </ul>
            </div>

        </div>

        <!-- /extra -->
    </div>
</div>

<!-- footer -->
<footer>

    <p class="footer-right">
        <a href="index.html">Home</a> |
        <a href="index.html">Sitemap</a> |
        <a href="index.html">RSS Feed</a> |
        <a href="#top" class="back-to-top">Back to Top</a>
    </p>
    <p class="footer-left hidden-xs">
    &copy; Copyright &copy; 2013.Company name All rights reserved.<a href="http://www.moke8.com" target="_blank">moke8</a>
    </p>
    <!-- /footer -->
</footer>
<script>
    $(function(){
        $.post('${resource(dir: "/")}navigation/getNavs',{},function(data){
            var nav = "";

            $(data).each(function(i){

                nav += '<li ';
                if(i==0){
                    nav += 'class="current"';
                }
                nav += '><a href="index.html">'+data[i].name+'</a><span></span></li>';

            });
            $(".nav").children("ul").append(nav);
        });
    });
</script>
</body>
</html>
