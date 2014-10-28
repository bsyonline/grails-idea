/*
 * @(#)TimerUtil.java	1.0 14-10-28
 *
 * 北京木联能软件技术有限公司.
 */
package com.rolex.blog.util;

import java.util.Timer;
import java.util.TimerTask;

/**
 * Created with IntelliJ IDEA.
 * User: rolex
 * Date: 14-10-28
 * version: 1.0
 */
public class TimerUtil {

    private static TimerUtil instance = null;
    private Timer timer = null;
    private static boolean isCanceled = false;

    public static synchronized TimerUtil getInstance(){
        if(instance == null){
            instance = new TimerUtil();
        }
        return instance;
    }


    private TimerUtil() {
        this.timer = new Timer();
    }

    public void cancel(){
        isCanceled = true;
        this.timer.cancel();
    }

    public void reloadTimer(){
        if(!isCanceled){
            this.timer.cancel();
            this.timer = new Timer();
        }else{
            //log:can not reload timer
        }
    }

    public void schedule(TimerTask task,long delay){
        try{
            this.timer.schedule(task,delay);
        }catch (Exception e){
            //log
            reloadTimer();
        }
    }
}
