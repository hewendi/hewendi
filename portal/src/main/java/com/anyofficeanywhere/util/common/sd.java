package com.anyofficeanywhere.util.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;

public class sd {
   public static void aa()
   {
	   List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();	   
	   for(int i=0; i<20; i++){
		   Map<String, Object> map1 = new HashMap<String, Object>();
		   map1.put("Name", "One"+i);
		   map1.put("City", "Two"+i);
		   map1.put("Country", "three"+i);	           
		   list.add(map1);
	   }       
	   String listJson = JSON.toJSONString(list);
   }
}
