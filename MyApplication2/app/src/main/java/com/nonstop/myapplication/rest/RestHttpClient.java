package com.nonstop.myapplication.rest;

import android.graphics.BitmapFactory;

import com.nonstop.myapplication.domain.Portfolio;
import com.nonstop.myapplication.domain.Project;
import com.nonstop.myapplication.domain.User;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPatch;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class RestHttpClient {

    ///Field
    String uri = "http://192.168.0.21:8080";

    ///Constructor
    public RestHttpClient() {

    }

    ///Method
    //1.1 Http Protocol GET Request : JsonSimple 3rd party lib 사용
    public User getJsonUser01(String userId) throws Exception {
        HttpClient httpClient = new DefaultHttpClient();

        // HttpClient : Http Protocol 의 client 추상화
        String url = uri + "/user/getJSONUser/" + userId.trim();

        // HttpGet : Http Protocol 의 GET 방식 Request
        HttpGet httpGet = new HttpGet(url);
        httpGet.setHeader("Accept", "application/json");
        httpGet.setHeader("Content-Type", "application/json");

        // HttpResponse : Http Protocol 응답 Message 추상화
        HttpResponse httpResponse = httpClient.execute(httpGet);

        //==> Response 중 entity(DATA) 확인
        HttpEntity httpEntity = httpResponse.getEntity();

        //==> InputStream 생성
        InputStream is = httpEntity.getContent();
        BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

        //System.out.println("[ Server 에서 받은 Data 확인 ] ");
        String serverData = br.readLine();
        //System.out.println(serverData);

        //==> 내용읽기(JSON Value 확인)
        JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
        System.out.println(jsonobj);

        JSONObject userJsonData = (JSONObject) (jsonobj.get("user"));

        if (userJsonData == null) {
            return null;
        }

        User user = new User();
        user.setUserId(userJsonData.get("userId").toString());
        System.out.println(user);

        return user;
    }


    //1.2 Http Protocol GET Request : JsonSimple + codehaus 3rd party lib 사용
    public User getJsonUser02(String userId) throws Exception {
        HttpClient httpClient = new DefaultHttpClient();

        // HttpClient : Http Protocol 의 client 추상화
        String url = uri + "/user/getJSONUser/" + userId.trim();

        // HttpGet : Http Protocol 의 GET 방식 Request
        HttpGet httpGet = new HttpGet(url);
        httpGet.setHeader("Accept", "application/json");
        httpGet.setHeader("Content-Type", "application/json");

        // HttpResponse : Http Protocol 응답 Message 추상화
        HttpResponse httpResponse = httpClient.execute(httpGet);

        //==> Response 중 entity(DATA) 확인
        HttpEntity httpEntity = httpResponse.getEntity();

        //==> InputStream 생성
        InputStream is = httpEntity.getContent();
        BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

        //==> 다른 방법으로 serverData 처리
        //System.out.println("[ Server 에서 받은 Data 확인 ] ");
        //String serverData = br.readLine();
        //System.out.println(serverData);

        //==> API 확인 : Stream 객체를 직접 전달
        JSONObject jsonobj = (JSONObject) JSONValue.parse(br);
        System.out.println(jsonobj);

        JSONObject userJsonData = (JSONObject) (jsonobj.get("user"));

        if (userJsonData == null) {
            return null;
        }

        ObjectMapper objectMapper = new ObjectMapper();
        User user = objectMapper.readValue(jsonobj.get("user").toString(), User.class);
        System.out.println(user);

        return user;
    }

    private Object restHttpSet(String controller, String methodType) throws Exception {
        HttpClient httpClient = new DefaultHttpClient();
        String url = uri + controller;
        System.out.println("요청:" + url);
        HttpResponse httpResponse;
        HttpEntity httpEntity;
        InputStream is;
        BufferedReader br = null;
        switch (methodType) {
            case "get":
                HttpGet httpGet = new HttpGet(url);
                httpGet.setHeader("Accept", "application/json");
                httpGet.setHeader("Content-Type", "application/json");
                httpResponse = httpClient.execute(httpGet);
                httpEntity = httpResponse.getEntity();

                is = httpEntity.getContent();
                br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
                break;
            case "post":
                HttpPost httpPost = new HttpPost(url);
                httpPost.setHeader("Accept", "application/json");
                httpPost.setHeader("Content-Type", "application/json");
                httpResponse = httpClient.execute(httpPost);
                httpEntity = httpResponse.getEntity();

                is = httpEntity.getContent();
                br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
                break;
            case "patch":
                HttpPatch httpPatch = new HttpPatch(url);
                break;
            case "delete":
                HttpDelete httpDelete = new HttpDelete(url);
                break;

            //이렇게하면 안되겠구나, get은 괜찮은데 add나 update,delete 는 전달값이 매번달라지네
        }
        if (br != null) {
            Object jsonObj = JSONValue.parse(br);
            System.out.println("전달JSON:" + jsonObj);

            //JSONObject jsonData = (JSONObject)( jsonobj.get(jsonTarget) );
            //System.out.println(jsonData);

            return jsonObj;
        }

        return null;
    }

    public JSONObject getJSONPostCountList() throws Exception {
        JSONObject jsonObj = (JSONObject) restHttpSet("/statistics/getJSONPostCountList", "get");
        return (JSONObject) (jsonObj.get("dataList"));
    }

    public List<Project> getJSONProjectList(String target, int page, int sort) throws Exception {

        /*
        JSONObject jsonObj = (JSONObject)restHttpSet("/project/getJSONProejctList/","get");

        JSONArray jsonArray = (JSONArray)( jsonObj.get("list") );

        List<Project> projects = new ArrayList<Project>();
        for (int i=0;i<jsonArray.size();i++){

            JSONObject jsonData = (JSONObject)jsonArray.get(i);
            Project project = new Project();
            project.setProjNo(Integer.parseInt(jsonData.get("????").toString()));
            project.setPortUserId(jsonData.get("portUserId").toString());
            project.setPortRegdate(jsonData.get("portRegdate").toString());
            project.setPortTitle(jsonData.get("portTitle").toString());
            project.setTotalPortView(Integer.parseInt(jsonData.get("totalPortView").toString()));
            project.setPortDivision(Integer.parseInt(jsonData.get("portDivision").toString()));

            projects.add(project);
        }
        return projects;
        */
        return null;
    }


    public List<Portfolio> getJSONPortfolioList(String target, int page, int sort) throws Exception {
        JSONObject jsonObj = (JSONObject) restHttpSet("/portfolio/getJSONPortfolioList/" + target + "/" + page + "/" + sort, "get");
        ObjectMapper objectMapper = new ObjectMapper();

        JSONArray jsonArray = (JSONArray) (jsonObj.get("list"));
        //System.out.println(jsonArray);

        List<Portfolio> portfolios = new ArrayList<Portfolio>();
        for (int i = 0; i < jsonArray.size(); i++) {

            JSONObject jsonData = (JSONObject) jsonArray.get(i);
            Portfolio portfolio = new Portfolio();
            portfolio.setPortNo(Integer.parseInt(jsonData.get("portNo").toString()));
            portfolio.setPortUserId(jsonData.get("portUserId").toString());
            portfolio.setPortRegdate(jsonData.get("portRegdate").toString());
            portfolio.setPortTitle(jsonData.get("portTitle").toString());
            portfolio.setTotalPortView(Integer.parseInt(jsonData.get("totalPortView").toString()));
            portfolio.setPortDivision(Integer.parseInt(jsonData.get("portDivision").toString()));

            portfolios.add(portfolio);
        }
        return portfolios;
    }

    public Portfolio getJSONPortfolio(int portNo) throws Exception {
        JSONObject jsonObj = (JSONObject) restHttpSet("/portfolio/getJSONPortfolio/" + portNo, "get");
        JSONObject jsonData = (JSONObject) jsonObj.get("portfolio");

        Portfolio portfolio = new Portfolio();

        portfolio.setPortTitle(jsonData.get("portTitle").toString());
        portfolio.setPortUserId(jsonData.get("portUserId").toString());
        portfolio.setPortRegdate(jsonData.get("portRegdate").toString());
        if (jsonData.get("portUpdate") != null)
            portfolio.setPortRegdate(jsonData.get("portUpdate").toString());
        portfolio.setTotalPortView(Integer.parseInt(jsonData.get("totalPortView").toString()));
        portfolio.setPortDivision(Integer.parseInt(jsonData.get("portDivision").toString()));
        portfolio.setPortDetail(jsonData.get("portDetail").toString());


        URL url = new URL("http://192.168.0.21:8080/resources/images/upload/"
                + jsonData.get("portFile").toString().replaceAll(" ", "%20"));
        portfolio.setThumbnail(BitmapFactory.decodeStream(url.openConnection().getInputStream()));

//        댓글리스트?
//        JSONArray commentList = (JSONArray)jsonObj.get("portCommentList");
//        ObjectMapper objectMapper = new ObjectMapper();
//        User user = objectMapper.readValue(jsonObj.get("portCommentList").toString(), User.class);

        return portfolio;
    }

    public void addJSONProtfolioComment(int portNo, String commentContent) throws Exception {
        String userId = "user01";

        JSONObject sendData = new JSONObject();
        sendData.put("portNo", portNo);
        sendData.put("commentContent", commentContent);
        sendData.put("userId", userId);

        System.out.println(sendData.toString());
    }

    public String getJSONUserSession(String userId, String userPw) throws Exception {


        JSONObject sendData = new JSONObject();
        sendData.put("userId", userId);
        sendData.put("password", userPw);

        final String json = sendData.toString();


        HttpPost post = new HttpPost(uri + "/user/JSONLogin");

        try {
            StringEntity entity = new StringEntity(json);
            entity.setContentEncoding("UTF-8");
            entity.setContentType("application/json");
            post.setEntity(entity);
            post.setHeader("Accept", "application/json");

            DefaultHttpClient client = new DefaultHttpClient();
            BasicResponseHandler handler = new BasicResponseHandler();

            String response = client.execute(post, handler);


            System.out.println("결과값:" + response);

            JSONParser parser = new JSONParser();

            //ObjectMapper objectMapper = new ObjectMapper();
            //User user = objectMapper.readValue(((JSONObject)parser.parse(response)).get("user").toString(), User.class);
            //System.out.println("변환값:" + user);

            return ((JSONObject) parser.parse(response)).get("user").toString();

        } catch (Exception e) {
            e.fillInStackTrace();
        }
        return null;

        /*
        new AsyncTask<Void,Void,String>(){

            @Override
            protected String doInBackground(Void... voids) {
                return getServerResponse(json);
            }

            @Override
            protected void onPostExecute(String result) {
                try {
                System.out.println("결과값:"+result);

                JSONParser parser = new JSONParser();
                    JSONObject json = (JSONObject) parser.parse(result);

                ObjectMapper objectMapper = new ObjectMapper();
                User user = objectMapper.readValue(json.get("user").toString(), User.class);
                System.out.println("변환값:"+user);
                } catch (ParseException e) {
                    e.printStackTrace();
                } catch (JsonParseException e) {
                    e.printStackTrace();
                } catch (JsonMappingException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }.execute();*/

    }

    /*
    private String getServerResponse(String json) {
        String url = uri+"/user/JSONLogin";
        System.out.println("요청주소:"+url);

        HttpPost post = new HttpPost(url);

        try {
            StringEntity entity = new StringEntity(json);
            entity.setContentEncoding("UTF-8");
            entity.setContentType("application/json");
            post.setEntity(entity);
            post.setHeader("Accept", "application/json");

            DefaultHttpClient client = new DefaultHttpClient();
            BasicResponseHandler handler = new BasicResponseHandler();

            String response =  client.execute(post,handler);
            return  response;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "Unable connect to server";
    }*/
}
