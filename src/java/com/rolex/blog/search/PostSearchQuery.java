/*
 * @(#)PostSearchQuery.java	1.0 14-10-28
 *
 * 北京木联能软件技术有限公司.
 */
package com.rolex.blog.search;

import com.rolex.blog.Post;
import com.rolex.blog.util.DirectoryUtil;
import com.rolex.blog.util.StringUtil;
import groovy.lang.GroovyClassLoader;
import groovy.lang.GroovyObject;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.*;
import org.apache.lucene.store.Directory;
import org.apache.lucene.util.Version;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: rolex
 * Date: 14-10-28
 * version: 1.0
 */
public class PostSearchQuery {
    private String searchString;
    private int hitCount;
    private List<Post> searchResult;

    public PostSearchQuery() {
    }

    public void setSearchString(String searchString) {
        this.searchString = StringUtil.escapeLuceneSpecialCharacters(searchString);
    }

    public int getHitCount() {
        return hitCount;
    }

    protected IndexSearcher getSearcher(Directory directory) throws IOException {
        try {
            IndexSearcher searcher = new IndexSearcher(directory, true/* readOnly */);
            return searcher;
        } catch (IOException ex) {
            // we throw new IOException because the original exception
            // contain sensitive directory information
            //log:Cannot access the lucene search index for query. You can also go to Admin Zone to rebuild the Lucene index files.",
            throw new IOException(
                    "Cannot access the lucene search index. Please report this error to web site Administrator.");
        }
    }

    public void searchDocuments(int offset, int rowsToReturn)
            throws IOException {

        // 如果要查询的内容为空直接返回
        if ((searchString == null || searchString.equals(""))) {
            // should throw an Exception here, if not, later call
            // getPostResult() will return null
            return;
        }
        // 创建query
        BooleanQuery query = new BooleanQuery();
        try {
            Query postTitleAndTextQuery = getPostTitleAndTextQuery();
            if (postTitleAndTextQuery != null) {
                query.add(postTitleAndTextQuery, BooleanClause.Occur.MUST);
                //log.debug("topicBodyQuery = " + postTitleAndTextQuery);
            }

        } catch (ParseException pe) {
            //log.error("Cannot parse the search query", pe);
        }
        //log.debug("booleanQuery = " + query);

        // 检索 documents
        Directory directory = null;
        IndexSearcher searcher = null;
        try {
            directory = DirectoryUtil.getSearchPostIndexDir();
            searcher = getSearcher(directory);

            // If filter set then use it
            TopFieldDocs postHits = searcher.search(query, null, offset
                    + rowsToReturn, getQuerySort());

            hitCount = postHits.totalHits;
            searchResult = getPosts(searcher, postHits, offset, rowsToReturn);
        } catch (IOException ex) {
            throw ex;
        } finally {
            // NOTE that we don't close directory because searcher.close()
            // already do that
            if (searcher != null) {
                try {
                    searcher.close();
                } catch (IOException ex) {
                    //log.debug("Error closing Lucene IndexSearcher", ex);
                }
            }
        }
    }

    private Query getPostTitleAndTextQuery() throws ParseException {
        if (searchString == null || searchString.equals("")) {
            return null;
        }
        Analyzer analyzer = PostIndexer.getAnalyzer();
        BooleanQuery postTitleAndTextQuery = new BooleanQuery();

        // 添加post title query
        Query postTitleQuery = new QueryParser(Version.LUCENE_29,PostIndexer.POST_TITLE, analyzer)
                .parse(searchString);
        postTitleAndTextQuery.add(postTitleQuery, BooleanClause.Occur.SHOULD);

        // 添加post text query
        Query postTextQuery = new QueryParser(Version.LUCENE_29,PostIndexer.POST_CONTENT, analyzer)
                .parse(searchString);
        postTitleAndTextQuery.add(postTextQuery, BooleanClause.Occur.SHOULD);

        return postTitleAndTextQuery;
    }

    private Sort getQuerySort() {
        Sort sortObj = new Sort(new SortField(PostIndexer.POST_LAST_UPDATED,
                SortField.STRING, true));
        return sortObj;
    }

    private List<Post> getPosts(IndexSearcher searcher, TopFieldDocs postHits,
                                   int offset, int rowsToReturn) throws IOException {

        if (offset < 0) {
            throw new IllegalArgumentException("The offset < 0 is not allowed.");
        }
        if (rowsToReturn <= 0) {
            throw new IllegalArgumentException(
                    "The rowsToReturn <= 0 is not allowed.");
        }

        // int hitCount = getHitCount();
        List<Post> retValue = new ArrayList<Post>(hitCount);

        for (int i = offset; (i < offset + rowsToReturn) && (i < hitCount); i++) {
            int doc = postHits.scoreDocs[i].doc;
            Document postDocument = searcher.doc(doc);
            int postId = Integer.parseInt(postDocument.get(PostIndexer.POST_ID));
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
            Post post = (Post)groovyObject.invokeMethod("get", postId);
            retValue.add(post);
        }
        return retValue;
    }

    public List<Post> getPostResult() {
        if (searchResult == null) {
            // create an empty list, in case result is null
            searchResult = new ArrayList<Post>();
        }
        return searchResult;
    }
}
