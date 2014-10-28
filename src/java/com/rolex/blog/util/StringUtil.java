/*
 * @(#)StringUtil.java	1.0 14-10-28
 *
 * 北京木联能软件技术有限公司.
 */
package com.rolex.blog.util;

import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;

/**
 * Created with IntelliJ IDEA.
 * User: rolex
 * Date: 14-10-28
 * version: 1.0
 */
public class StringUtil {
    public static String escapeLuceneSpecialCharacters(String str) {
        if (str == null)
            return null;
        try {
            StringWriter writer = new StringWriter(str.length() * 2);
            escapeLuceneSpecialCharacterString(writer, str);
            return writer.toString();
        } catch (IOException ioe) {
            ioe.printStackTrace();
        }
        return null;
    }

    private static void escapeLuceneSpecialCharacterString(Writer out,
                                                           String str) throws IOException {
        if (str == null) {
            return;
        }
        int sz = str.length();
        for (int i = 0; i < sz; ++i) {
            char ch = str.charAt(i);

            switch (ch) {
                case '!':
                case '"':
                case '(':
                case ')':
                case '*':
                case '+':
                case '-':
                case ':':
                case '?':
                case '[':
                case '\\':
                case ']':
                case '^':
                case '{':
                case '}':
                case '~':
                    out.write(92);
                    out.write(ch);
                    break;
                case '&':
                case '|':
                    if ((i + 1 < sz) && (str.charAt(i + 1) == ch)) {
                        out.write(92);
                        out.write(ch);
                        ++i;
                    }
                    out.write(ch);
                    break;
                default:
                    out.write(ch);
            }
        }
    }

    public static String delHtmlTag(String str) {
        if (str == null || str == "")
            return "";
        String s = str.replaceAll("<[^>]*>", "");// 去掉所有的html标记
        if (s.length() > 25) {
            s = s.substring(0, 25) + "...";
        }
        return s;
    }
}
