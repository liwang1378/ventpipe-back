package com.huatec.ventpipe.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;


public class TreeUtils<T> {
	/*	
	public static<T> List<T> createTree(List<T> list) {
		List<T> children =  new ArrayList<T>();
		for(T menu : list){
			if(0 == menu.getPid()){
				initChildren(menu,list);
				children.add(menu);
			}
		}
		
		return children;
	}
	
	private static<T> void initChildren(T treeNode, List<T> list) {
		List<T> children =  new ArrayList<T>();
		for(T node : list){
			Integer pid = treeNode.getId();
			
			if(node.getPid()!=null && pid.compareTo(node.getPid())==0){
				initChildren(node,list);
				children.add(node);
			}
		}
		Collections.sort(children, new Comparator<T>() {
			public int compare(T o1, T o2) {
				int i = o1.getSort() - o2.getSort();  
                if(i == 0){  
                    return 0;  
                }  
                return i; 
			};
		});
		treeNode.setChildren(children);
	}*/
}
