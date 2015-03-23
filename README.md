# predction_defect
package democheck;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class jsonencodee {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Map<String, String> search=new HashMap<String, String>();
		Map<String, String> filter=new HashMap<String, String>();
		Map<String, String> sort=new HashMap<String, String>();
		Map<String, String> pagination=new HashMap<String, String>();
		
		String value="SSS";
		
		search.put("skey", "value");
		search.put("skey1", "value1");
		search.put("skey2", "value2");
		
		filter.put("fkey", "value");
		filter.put("fkey2", "value2");
		
		pagination.put("pkey", "value");
		pagination.put("pkey1", "value1");
		Map<String, String> map2=new HashMap<String, String>();
		map2.putAll(filter);
	
		for (String key : search.keySet()) {
	        System.out.println(key + " " + search.get(key));
	    }
		for (String key : filter.keySet()) {
	        System.out.println(key + " " + filter.get(key));
	    }
		for (String key : sort.keySet()) {
	        System.out.println(key + " " + sort.get(key));
	    }
		for (String key : pagination.keySet()) {
	        System.out.println(key + " " + pagination.get(key));
	    }
		 /*JSONObject jobj = new JSONObject();
		 List<Map<String,String>> maps = new ArrayList<Map<String,String>>();
		maps.add(search);
		maps.add(pagination);
		maps.add(filter);
		for (int i = 0; i < maps.size(); i++) {
			map2.putAll(maps.get(i));
			for (String key : map2.keySet()) {
		        System.out.println(key + " " + map2.get(key));
			}
		}
		System.out.println("abc");
//		/maps.add(search);
 * 
 */
		Map <String,Map<String,String>> imap=new HashMap<String, Map<String,String>>();
		imap.put("search", search);
		imap.put("pagination", pagination);
		imap.put("filter", filter);
		imap.put("sort", sort);
		
		for (String key : imap.keySet()) {
			Map<String,String> lmap = new HashMap<String, String>();
			lmap.putAll(imap.get(key));
			for (String key1 : lmap.keySet()) {
	        System.out.println(key1 + "abc " + lmap.get(key1));}
		}
		JSONObject jobj1 = new JSONObject();
		
		
		//jobj1= varibaleargu(value,search ,filter,sort,pagination);
		 varibaleargu(value,imap);
		System.out.println(jobj1.toJSONString());
		/* try {  
             jobj.put("Class", value);    
             JSONArray searcharr = new JSONArray();
             JSONObject element = new JSONObject();
             for (String key : search.keySet()) {
            	 element.put(key, search.get(key));
             }
             searcharr.add(element); 
             
             jobj.put("search", searcharr);

             
             System.out.println(jobj.toJSONString());
         } catch (Exception e) {
 // TODO: handle exception
 e.printStackTrace();
}*/
		
		
	}

	
	
	public static JSONObject varibaleargu(String value,Map<String,Map<String,String>> maps ) 
	{
		Map<String, String> map;
		JSONObject jobj = new JSONObject();
	    jobj.put("Class", value);
	    JSONArray searcharr=new JSONArray();
        JSONObject element=new JSONObject();
		 for (String classvalue : maps.keySet()){
			 map=new HashMap<String, String>();
			 searcharr=new JSONArray();
		     element=new JSONObject();
			String classva=classvalue;
			map.putAll(maps.get(classvalue));
			try {  
	                 
	              for (String key : map.keySet()) {
	            	 element.put(key, map.get(key));
	                }
	             searcharr.add(element); 
	             
	             
	             jobj.put(classva, searcharr);
	             
	           
	         } catch (Exception e) {
	
	 e.printStackTrace();
	}
		}
		 return (jobj);
		 //System.out.println(jobj.toJSONString());
		
	}
	public static JSONObject varibaleargu(String value,Map<String,String> search,Map<String,String> filter, Map<String,String> sort,  Map<String,String> pagination )
	 {
		JSONObject jobj = new JSONObject();
	    JSONArray searchmap=new JSONArray();
	    JSONObject searchelement=new JSONObject();
	    JSONArray filtermap=new JSONArray();
	    JSONObject filterelement=new JSONObject();
	    JSONArray sortmap=new JSONArray();
	    JSONObject sortelement=new JSONObject();
	    JSONArray paginationmap=new JSONArray();
	    JSONObject paginationelement=new JSONObject();
	    try {  
	        jobj.put("Class", value);    
	        for (String key : search.keySet()) {
	        	//System.out.println(key+"ketttttttttttt"+ search.get(key));
	        	searchelement.put(key, search.get(key));
	        }
	        searchmap.add(searchelement);
	        
	        for (String key :filter.keySet()) {
	        	filterelement.put(key, filter.get(key));
	        }
	        filtermap.add(filterelement);
	        
	        
	        for (String key : sort.keySet()) {
	        	sortelement.put(key, sort.get(key));
	        }
	        sortmap.add(sortelement);
	        
	        for (String key : pagination.keySet()) {
	        	paginationelement.put(key, pagination.get(key));
	        }
	        paginationmap.add(paginationelement);
	        
	        
	        jobj.put("search", searchmap);
	        jobj.put("Filter", filtermap);
	        jobj.put("Sort", sortmap);
	        jobj.put("Pagination", paginationmap);

	        
	       
	    }
	    catch (Exception e) {

	    						e.printStackTrace();
	    						}
	    return jobj;
			
	 }

	
	
}
