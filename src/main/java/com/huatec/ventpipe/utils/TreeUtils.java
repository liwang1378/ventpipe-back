package com.huatec.ventpipe.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.huatec.ventpipe.entity.Building;


public class TreeUtils {
	
	public static List<Building> createTree(List<Building> list) {
		List<Building> children =  new ArrayList<Building>();
		for(Building menu : list){
			if(null == menu.getParentuuid()){
				initChildren(menu,list);
				children.add(menu);
			}
		}
		return children;
	}
	
	private static void initChildren(Building treeNode, List<Building> list) {
		List<Building> children =  new ArrayList<Building>();
		for(Building node : list){
			Integer pid = treeNode.getUuid();
			if(node.getParentuuid()!=null && pid.compareTo(node.getParentuuid())==0){
				initChildren(node,list);
				children.add(node);
			}
		}
		Collections.sort(children, new Comparator<Building>() {
			public int compare(Building o1, Building o2) {
				int i = Integer.parseInt(o1.getOrderseq()) - Integer.parseInt(o2.getOrderseq());  
                if(i == 0){  
                    return 0;  
                }  
                return i; 
			};
		});
		treeNode.setChildren(children);
	}
}
