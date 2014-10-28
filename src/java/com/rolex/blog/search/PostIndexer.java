/*
 * @(#)PostIndexer.java	1.0 14-10-28
 *
 * 北京木联能软件技术有限公司.
 */
package com.rolex.blog.search;

import com.rolex.blog.Post;
import com.rolex.blog.util.DirectoryUtil;
import com.rolex.blog.util.TimerUtil;
import jeasy.analysis.MMAnalyzer;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.Term;
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
public class PostIndexer {

    public static final String POST_ID = "id";
    public static final String POST_AUTHOR = "author";
    public static final String POST_TITLE = "title";
    public static final String POST_CONTENT = "content";
    public static final String POST_DATE_CREATED = "dateCreated";
    public static final String POST_LAST_UPDATED = "lastUpdated";
    private static long LAST_OPTIMIZE_TIME = 0;
    public static final long HOUR = 3600000L;
    private static Analyzer analyzer;

    static {
        initializeAnalyzer();
    }

    private static void initializeAnalyzer() {
        // 初始化分词器
        analyzer = new MMAnalyzer();
    }

    static Analyzer getAnalyzer() {
        return analyzer;
    }

    /**
     * add task to schedule when post added.
     * @param post
     */
    public static void scheduleAddPostTask(Post post){
        AddUpdatePostIndexTask addUpdatePostIndexTask = new AddUpdatePostIndexTask(post,AddUpdatePostIndexTask.OPERATION_ADD);
        TimerUtil.getInstance().schedule(addUpdatePostIndexTask,0);
    }
    public static void addPostToIndex(Post post){
        Directory directory = null;
        IndexWriter writer = null;
        try {
            directory = DirectoryUtil.getSearchPostIndexDir();
            writer = getIndexWriter(directory, false);
            if (writer == null) {
                //log: Cannot get the IndexWriter
                return;
            }
            doIndexPost(post, writer);

            // now check if we should optimize index (each hour)
            long now = System.currentTimeMillis();
            long timeFromLastOptimize = now - LAST_OPTIMIZE_TIME;
            if (timeFromLastOptimize > HOUR) {
                //log:writer optimize called in addPostToIndex
                writer.optimize();
                LAST_OPTIMIZE_TIME = now;
            }
        }catch (Exception e){
            throw new RuntimeException("Error add Post ToIndex");
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    //log:Error closing Lucene IndexWriter
                }
            }
            if (directory != null) {
                try {
                    directory.close();
                } catch (IOException e) {
                    //log:Cannot close directory
                }
            }
        }
    }

    static IndexWriter getIndexWriter(Directory directory, boolean create) {
        IndexWriter writer = null;
        // If create = false, we will create IndexWriter with false argument
        if (create == false) {
            try {
                writer = new IndexWriter(directory, analyzer, false, IndexWriter.MaxFieldLength.LIMITED);
                // writer.setWriteLockTimeout(100000);
                    writer.setUseCompoundFile(true);
                return writer;
            } catch (IOException e) {
                //log:Cannot open existed index. New index will be created.
                // Ignore Exception. We will try to create index with true
                // parameter
            }
        }
        // We are here in two cases: We wanted to create new index or because
        // index doesn't existed
        try {
            // This will create new index and delete existing
            deleteContent(directory);
            writer = new IndexWriter(directory, analyzer, true, IndexWriter.MaxFieldLength.LIMITED);// actually the
            // directory should be
            // 'create' = true
            // writer.setWriteLockTimeout(100000);
            writer.setUseCompoundFile(true);
            return writer;
        } catch (IOException e) {
            //log:IOException during get index writer
            throw new RuntimeException("Error while creating index writer", e);
        }
    }

    public static void doIndexPost(Post post, IndexWriter writer) {
        if (post == null) {
            return;
        }
        // 如果post的标题和内容为空，不添加索引
        if ((post.getTitle() == null || post.getTitle().equals(""))
                || (post.getContent() == null || post.getContent().equals(""))) {
            return;
        }

        // 每一个post作为一个document
        Document postDocument = new Document();
        // 将post的信息添加到document中
        postDocument.add(new Field(POST_ID, Integer.toString(post.getId()), Field.Store.YES, Field.Index.NOT_ANALYZED));
        postDocument.add(new Field(POST_AUTHOR, post.getAuthor().getUsername(), Field.Store.YES, Field.Index.NOT_ANALYZED));
        postDocument.add(new Field(POST_DATE_CREATED, post.getDateCreated().toString(), Field.Store.YES, Field.Index.NOT_ANALYZED));
        postDocument.add(new Field(POST_LAST_UPDATED, post.getLastUpdated().toString(), Field.Store.YES, Field.Index.NOT_ANALYZED));
        postDocument.add(new Field(POST_TITLE, post.getTitle(), Field.Store.NO, Field.Index.ANALYZED));
        postDocument.add(new Field(POST_CONTENT, post.getContent(), Field.Store.NO, Field.Index.ANALYZED));

        // 保存document
        try {
            writer.addDocument(postDocument);
        } catch (IOException e) {
            //log:PostIndexer doIndexPost failed
            throw new RuntimeException("Error writing new post to index", e);
        } catch (Throwable e) {
            //log:PostIndexer doIndexPost failed
            throw new RuntimeException("Error writing new post to index", e);
        }
    }

    public static void deletePostFromIndex(Post post){
        Directory directory = null;
        IndexReader reader = null;
        try {
            directory = DirectoryUtil.getSearchPostIndexDir();
            reader = IndexReader.open(directory, false/*readOnly*/);
            if (reader == null) {
                //log.warn("Cannot get the IndexReader");
                return;
            }

            Term term = new Term(POST_ID, String.valueOf(post.getId()));
            int deletedCount = reader.deleteDocuments(term);
            //log.debug("deletePostFromIndex: deleted posts = " + deletedCount);
        } catch (IOException e) {
            throw new RuntimeException("Error trying to delete post with postID = " + post.getId(),e);
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    //log.debug("Error closing Lucene IndexReader", e);
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
    }



    public static void deleteContent(Directory directory){

    }
}
