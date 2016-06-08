package com.yeepay;

import java.util.ResourceBundle;
/**
 * 读取配置文件
 * @author a
 *
 */
public class ConfigInfo {
	//获取id 密钥
   private  static ResourceBundle cache=null;
   static{
	   try {
		   cache=ResourceBundle.getBundle("info");
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	   
   }
   /**
    * 获取值定制
    * @param key
    * @return
    */
   
   public static String getVlaue(String key)
   {
	   return cache.getString(key);
   }
}
