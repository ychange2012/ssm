package com.demo.util;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class MapUtil {
	public final static HashMap requestToMap(HttpServletRequest request) {
		HashMap map = new HashMap();
	     Enumeration paramNames = request.getParameterNames();
	    while (paramNames.hasMoreElements()) {
	      String paramName = (String) paramNames.nextElement();
	      String[] paramValues = request.getParameterValues(paramName);
	      if (paramValues.length == 1) {
	        String paramValue = paramValues[0];
	        if (paramValue.length() != 0) {
	          map.put(paramName, paramValue);
	        }
	      }
	    }
	    return map;
	}
}
