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
    <g:layoutHead/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap/css/bootstrap.min.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'store.css')}" type="text/css">
</head>

<body>
<div class="container">
    <header>
        <div class="cart">
            <ul>
                <li>
                    <a href="#"><span>cart</span></a>
                    <ul>
                        <li><span>aaaa</span></li>
                        <li>
                            <div class="cart-item">
                                <div class="item-icon">
                                    <a><img src="${resource(dir: 'images', file: 'avatar.jpg')}"></a>
                                </div>
                                <div class="item-info">
                                    <div class="item-name">iphone 6 plusiphone 6 plusiphone 6 plusiphone 6 plus</div>
                                    <div><span>￥1000.00</span>x<span>2</span></div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="cart-item">
                                <div class="item-icon">
                                    <a><img src="${resource(dir: 'images', file: 'avatar.jpg')}"></a>
                                </div>
                                <div class="item-info">
                                    <div>iphone 6 plus</div>
                                    <div><span>￥1000.00</span>x<span>2</span></div>
                                </div>
                            </div>
                        </li>

                        <li><a><span>aaaa</span></a><a><span>bbbb</span></a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </header>
    <g:layoutBody/>
</div>


</body>
</html>
