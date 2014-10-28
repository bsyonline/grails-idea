/*
 * @(#)DirectoryUtil.java	1.0 14-10-28
 *
 * 北京木联能软件技术有限公司.
 */
package com.rolex.blog.util;

import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

import java.io.File;
import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * User: rolex
 * Date: 14-10-28
 * version: 1.0
 */
public class DirectoryUtil {

    public static final String SEARCH_POST_INDEX_DIR = "blog/search/post";

    public static Directory getSearchPostIndexDir() throws IOException {
        File dir = new File(SEARCH_POST_INDEX_DIR);
        if(!dir.exists()){
            dir.mkdir();
        }
        return FSDirectory.open(dir);
    }
}
