package com.kim.util;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AjaxUtils {

	public static final String HEADER_X_REQUESTED_WITH = "X-Requested-With";
	public static final String HEADER_CONTENT_TYPE = "Content-Type";
	public static final String HEADER_ACCEPT = "Accept";
	public static final String XML_HTTP_REQUEST = "XMLHttpRequest";
	public static final String MULTIPART_FORM_DATA = "multipart/form-data";
	public static final String APPLICATION_JSON = "application/json";
	public static final String APPLICATION_XML = "application/xml";
	public static final String APPLICATION_JSONP = "application/javascript";
	public static final String APPLICATION_JSON_EXT = ".json";
	public static final String APPLICATION_XML_EXT = ".xml";
	public static final String APPLICATION_JSONP_EXT = ".jsonp";

	public static final String FORWARD_SERVLET_PATH_ATTRIBUTE = "javax.servlet.forward.servlet_path";

	public static boolean isHttp(ServletRequest request) {
		return request instanceof HttpServletRequest;
	}

	public static boolean isHttp(ServletResponse response) {
		return response instanceof HttpServletResponse;
	}

	public static HttpServletRequest toHttp(ServletRequest request) {
		return (HttpServletRequest) request;
	}

	public static HttpServletResponse toHttp(ServletResponse response) {
		return (HttpServletResponse) response;
	}

	public static boolean isAjaxRequest(HttpServletRequest request) {
		if (null != request.getHeader(HEADER_X_REQUESTED_WITH) && request.getHeader(HEADER_X_REQUESTED_WITH).indexOf(XML_HTTP_REQUEST) > -1) {
			return true;
		}
		return false;
	}

	public static boolean isJsonContextTypeOrUriOrForward(HttpServletRequest request) {
		String forwardURI = getForwardURI(request);
		return isJsonContextTypeOrUri(request) || (forwardURI != null && forwardURI.endsWith(APPLICATION_JSON_EXT));
	}

	public static boolean isXmlContextTypeOrUriOrForward(HttpServletRequest request) {
		String forwardURI = getForwardURI(request);
		return isXmlContextTypeOrUri(request) || (forwardURI != null && forwardURI.endsWith(APPLICATION_XML_EXT));
	}

	public static boolean isJsonpContextTypeOrUriOrForward(HttpServletRequest request) {
		String forwardURI = getForwardURI(request);
		return isJsonpContextTypeOrUri(request) || (forwardURI != null && forwardURI.endsWith(APPLICATION_JSONP_EXT));
	}
	
	public static boolean isJsonAcceptOrUriOrForward(HttpServletRequest request) {
		String forwardURI = getForwardURI(request);
		return isJsonAcceptOrUri(request) || (forwardURI != null && forwardURI.endsWith(APPLICATION_JSON_EXT));
	}

	public static boolean isXmlAcceptOrUriOrForward(HttpServletRequest request) {
		String forwardURI = getForwardURI(request);
		return isXmlAcceptOrUri(request) || (forwardURI != null && forwardURI.endsWith(APPLICATION_XML_EXT));
	}
	
	public static boolean isJsonpAcceptOrUriOrForward(HttpServletRequest request) {
		String forwardURI = getForwardURI(request);
		return isJsonpAcceptOrUri(request) || (forwardURI != null && forwardURI.endsWith(APPLICATION_JSONP_EXT));
	}
	
	public static boolean isJsonContextTypeOrUri(ServletRequest request) {
		return isJsonContextType(request) || isJsonUri(request);
	}

	public static boolean isXmlContextTypeOrUri(ServletRequest request) {
		return isXmlContextType(request) || isXmlUri(request);
	}
	
	public static boolean isJsonpContextTypeOrUri(ServletRequest request) {
		return isJsonpContextType(request) || isJsonpUri(request);
	}
	
	public static boolean isJsonAcceptOrUri(ServletRequest request) {
		return isJsonAccept(request) || isJsonUri(request);
	}

	public static boolean isXmlAcceptOrUri(ServletRequest request) {
		return isXmlAccept(request) || isXmlUri(request);
	}
	
	public static boolean isJsonpAcceptOrUri(ServletRequest request) {
		return isJsonpAccept(request) || isJsonpUri(request);
	}
	
	public static boolean isJsonContextType(ServletRequest request) {
		HttpServletRequest httpRequest = toHttp(request);
		String contentType = httpRequest.getHeader(HEADER_CONTENT_TYPE);
		return contentType != null && contentType.startsWith(APPLICATION_JSON);
	}

	public static boolean isXmlContextType(ServletRequest request) {
		HttpServletRequest httpRequest = toHttp(request);
		String contentType = httpRequest.getHeader(HEADER_CONTENT_TYPE);
		return contentType != null && contentType.startsWith(APPLICATION_XML);
	}
	
	public static boolean isJsonpContextType(ServletRequest request) {
		HttpServletRequest httpRequest = toHttp(request);
		String contentType = httpRequest.getHeader(HEADER_CONTENT_TYPE);
		return contentType != null && contentType.startsWith(APPLICATION_JSONP);
	}
	
	public static boolean isJsonUri(ServletRequest request) {
		HttpServletRequest httpRequest = toHttp(request);
		return httpRequest.getRequestURI() != null && httpRequest.getRequestURI().endsWith(APPLICATION_JSON_EXT);
	}

	public static boolean isXmlUri(ServletRequest request) {
		HttpServletRequest httpRequest = toHttp(request);
		return httpRequest.getRequestURI() != null && httpRequest.getRequestURI().endsWith(APPLICATION_XML_EXT);
	}
	
	public static boolean isJsonpUri(ServletRequest request) {
		HttpServletRequest httpRequest = toHttp(request);
		return httpRequest.getRequestURI() != null && httpRequest.getRequestURI().endsWith(APPLICATION_JSONP_EXT);
	}
	
	public static boolean isJsonAccept(ServletRequest request) {
		HttpServletRequest httpRequest = toHttp(request);
		String accept = httpRequest.getHeader(HEADER_ACCEPT);
		return accept != null && accept.startsWith(APPLICATION_JSON);
	}

	public static boolean isXmlAccept(ServletRequest request) {
		HttpServletRequest httpRequest = toHttp(request);
		String accept = httpRequest.getHeader(HEADER_ACCEPT);
		return accept != null && accept.startsWith(APPLICATION_XML);
	}
	
	public static boolean isJsonpAccept(ServletRequest request) {
		HttpServletRequest httpRequest = toHttp(request);
		String accept = httpRequest.getHeader(HEADER_ACCEPT);
		return accept != null && accept.startsWith(APPLICATION_JSONP);
	}

	public static String getForwardURI(HttpServletRequest request) {
		return (String) request.getAttribute(FORWARD_SERVLET_PATH_ATTRIBUTE);
	}
}

