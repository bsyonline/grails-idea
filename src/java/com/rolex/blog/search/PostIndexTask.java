/*
 * @(#)AddUpdatePostIndexTask.java	1.0 14-10-28
 *
 * 北京木联能软件技术有限公司.
 */
package com.rolex.blog.search;

import com.rolex.blog.Post;

import java.util.TimerTask;

/**
 * Created with IntelliJ IDEA.
 * User: rolex
 * Date: 14-10-28
 * version: 1.0
 */
public class PostIndexTask extends TimerTask{

    private Post post;
    private int operation;
    public static final int OPERATION_ADD = 0;
    public static final int OPERATION_UPDATE = 1;
    public static final int OPERATION_DELETE = 2;

    public PostIndexTask(){}

    public PostIndexTask(Post post, int operation) {
        this.post = post;
        this.operation = operation;
    }

    @Override
    public void run() {
        //log:add post and post id =
        try{
            switch (operation){
                case OPERATION_ADD:
                    PostIndexer.addPostToIndex(post);
                    break;
                case OPERATION_UPDATE:
                    PostIndexer.deletePostFromIndex(post.getId());
                    PostIndexer.addPostToIndex(post);
                    break;
                case OPERATION_DELETE:
                    PostIndexer.deletePostFromIndex(post.getId());
                    break;
                default:
                    //log:no operation
                    break;
            }
        }catch (Exception e){
            //log
            e.printStackTrace();
        }

    }
}
