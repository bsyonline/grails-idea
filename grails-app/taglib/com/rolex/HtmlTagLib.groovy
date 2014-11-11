package com.rolex

import com.rolex.blog.util.StringUtil

class HtmlTagLib {
    static defaultEncodeAs = [taglib:'none']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    def highLight = {
        String s = StringUtil.delHtmlTag(it.content)
        if(it.keyword != null){
            s = s.replace(it.keyword, "<span style='color:red;'>"+it.keyword+"</span>")
        }
        out << s
    }
}
