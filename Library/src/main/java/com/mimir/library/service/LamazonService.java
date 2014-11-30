package com.mimir.library.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class LamazonService {

	private String lHome = "http://localhost:8080/Llamazon/";
	private String lDataContr = "data/";
	private String lBookContr = "book/";
	private String lGet = "create?";
	private String lDel = "delete?";
	private String lGo = "display?";
	
	private String getBook = lHome + lDataContr + lGet;
	private String delBook = lHome + lDataContr + lDel;
	private String goBook = lHome + lBookContr + lGo;
	
	public static final String LLAMAZON_ERROR_CODE_1 = "NoBookFound";
	public static final String LLAMAZON_ERROR_CODE_2 = "UserAlreadyHasBook";
	
	public LamazonService(){
		
	}
	
	public String getBookKey(int bookId, String userCode, String bookFormatType){
		String url = getBook + "bookId=" + bookId + "&userCode=" + userCode + "&bookFormatType=" + bookFormatType;
		System.out.println("DEBUG - Sending Http Request to " + url);
		String response = sendHttpGet(url);
		return response;		
	}
	
	public boolean deleteBookKey(int bookId, String userCode, String bookFormatType){
		String url = delBook + "bookId=" + bookId + "&userCode=" + userCode + "&bookFormatType=" + bookFormatType;
		System.out.println("DEBUG - Sending Http Request to " + url);
		String response = sendHttpGet(url);
		System.out.println("DEBUG - Delete From Lamazon returned: " + Boolean.parseBoolean(response.trim()) + " " + Boolean.parseBoolean(response));
		return Boolean.parseBoolean(response.trim());
	}
	
	public String getBookPageUrl(int bookId, String userCode, String bookKey, String bookFormatType){
		String url = goBook + "bookId=" + bookId + "&userCode=" + userCode + "&bookKey=" + bookKey + "&bookFormatType=" + bookFormatType;
		System.out.println("DEBUG - Book page url " + url);
		return url;
	}
	
	private final String USER_AGENT = "Mozilla/5.0";
	
	private String sendHttpGet(String urlPath){
		try{
			URL url = new URL(urlPath);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("User-Agent", USER_AGENT);
			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
	 
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			return response.toString();
		}catch(Exception e){
			System.out.println("DEBUG - Cannot create http request");
			return null;
		}
	}
	
}
