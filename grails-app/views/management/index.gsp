<%--
  Created by IntelliJ IDEA.
  User: rolex
  Date: 14-10-27
  Time: 下午9:44
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title></title>
</head>
<body>
    <div class="container">
        <div class="row">
            <ul class="nav nav-tabs" role="tablist" id="myTab">
                <li role="presentation" class="active"><a href="#article">文章管理</a></li>
                <li role="presentation"><a href="#tag">类别管理</a></li>
                <li role="presentation"><a href="#reply">评论管理</a></li>
                <li role="presentation"><a href="#post">新文章</a></li>
            </ul>

        </div>
        <div class="row content">
            <div class="tab-content">
                <div class="tab-pane active" id="article">
                    <table class="table table-striped table-hover">
                        <tr>
                            <th>#</th>
                            <th>标题</th>
                            <th>日期</th>
                        </tr>
                        <g:each in="${postInstanceList}" var="post" status="i">
                        <tr>
                            <th>${i}</th>
                            <th>${post.title}</th>
                            <th>${post.lastUpdated}</th>
                        </tr>
                        </g:each>
                    </table>
                </div>
                <div class="tab-pane" id="tag">
                    <table class="table table-striped table-hover">
                        <tr>
                            <th>#</th>
                            <th>名字</th>
                            <th>日期</th>
                        </tr>
                        <g:each in="${tagInstanceList}" var="tag" status="i">
                            <tr>
                                <th>${i}</th>
                                <th>${tag.name}</th>
                                <th>${tag.url}</th>
                            </tr>
                        </g:each>
                    </table>
                </div>
                <div class="tab-pane" id="reply">
                    <table class="table table-striped table-hover">
                        <tr>
                            <th>#</th>
                            <th>标题</th>
                            <th>日期</th>
                        </tr>
                        <g:each in="${replyInstanceList}" var="reply" status="i">
                            <tr>
                                <th>${i}</th>
                                <th>${reply?.post?.title}</th>
                                <th>${reply.lastUpdated}</th>
                            </tr>
                        </g:each>
                    </table>
                </div>
                <div class="tab-pane" id="post">
                    <g:form url="[action:'save',controller:'post']" class="post-form">
                        <fieldset class="form">

                            <div class="fieldcontain ${hasErrors(bean: postInstance, field: 'title', 'error')} required">
                                <label for="title">
                                    <g:message code="post.title.label" default="Title" />
                                    <span class="required-indicator">*</span>
                                </label>
                                <g:textField name="title" required="" value="${postInstance?.title}"/>

                            </div>

                            <div class="fieldcontain ${hasErrors(bean: postInstance, field: 'author', 'error')} required">
                                <label for="author">
                                    <g:message code="post.author.label" default="Author" />
                                    <span class="required-indicator">*</span>
                                </label>
                                <g:textField name="author.id" required="" value="${postInstance?.author?.id}"/>

                            </div>

                            <div class="fieldcontain ${hasErrors(bean: postInstance, field: 'content', 'error')} required">
                                <label for="content">
                                    <g:message code="post.content.label" default="Content" />
                                    <span class="required-indicator">*</span>
                                </label>
                                <g:textArea class="ckeditor" name="content">${postInstance?.content}</g:textArea>
                            </div>

                            <div class="fieldcontain ${hasErrors(bean: postInstance, field: 'pic', 'error')} ">
                                <label for="pic">
                                    <g:message code="post.pic.label" default="Pic" />

                                </label>
                                <g:textField name="pic" value="${postInstance?.pic}"/>

                            </div>


                        </fieldset>
                        <fieldset class="buttons">
                            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                        </fieldset>
                    </g:form>
                </div>
            </div>
        </div>

    </div>
<g:javascript>
    $('#myTab a').click(function (e) {
        e.preventDefault()
        $(this).tab('show')
    })
</g:javascript>
</body>
</html>