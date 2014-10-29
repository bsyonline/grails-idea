/*
 * @(#)RebuildPostIndexTask.java	1.0 14-10-29
 *
 * 北京木联能软件技术有限公司.
 */
package com.rolex.blog.search;

import com.rolex.blog.Post;
import com.rolex.blog.util.DirectoryUtil;
import groovy.lang.GroovyClassLoader;
import groovy.lang.GroovyObject;
import liquibase.exception.DatabaseException;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.store.Directory;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.TimerTask;

/**
 * Created with IntelliJ IDEA.
 * User: rolex
 * Date: 14-10-29
 * version: 1.0
 */
public class RebuildPostIndexTask extends TimerTask {
    public static final int POSTS_PER_FETCH = 200;

    public static final int MERGE_FACTOR = 20;

    private static boolean isRebuilding = false;

    public RebuildPostIndexTask() {
    }

    public static boolean isRebuilding() {
        return isRebuilding;
    }

    @Override
    public void run() {
        isRebuilding = true;
        long start = System.currentTimeMillis();

        Directory directory = null;
        IndexWriter writer = null;
        try {
            directory = DirectoryUtil.getSearchPostIndexDir();
            writer = PostIndexer.getIndexWriter(directory, true);
            writer.setMergeFactor(MERGE_FACTOR);
            // note that the maxPostID is got at the beginning of the method
            // so that it will index only these posts. Later while indexing,
            // if new posts are added, then other task will take care it

            ClassLoader parent = getClass().getClassLoader();
            GroovyClassLoader loader = new GroovyClassLoader(parent);
            //找到指定的groovy类
            Class groovyClass = loader.parseClass(new File("grails-app/controllers/com/rolex/blog/PostController.groovy"));
            //将对象实例化并且强制转换为GroovyObject对象
            GroovyObject groovyObject = null;
            try {
                groovyObject = (GroovyObject) groovyClass.newInstance();
            } catch (InstantiationException e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            } catch (IllegalAccessException e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            }

            Collection posts = (List)groovyObject.invokeMethod("findAllPosts", null);

            for (Iterator iter = posts.iterator(); iter.hasNext();) {
                Post post = (Post) iter.next();
                PostIndexer.doIndexPost(post, writer);
            }

            writer.optimize();
            //log.info("Rebuilt index finished successfully! " + count + " post(s) indexed.");
        } catch (Throwable e) {
            //log.error("Error while rebuilding index", e);
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    //log.debug("Error closing Lucene IndexWriter", e);
                }
            }
            if (directory != null) {
                try {
                    directory.close();
                } catch (IOException e) {
                    //log.debug("Cannot close directory.", e);
                }
            }
        }
        //log.info("RebuildPostIndexTask took " + (System.currentTimeMillis() - start) + " ms");
        isRebuilding = false;
    }
}
