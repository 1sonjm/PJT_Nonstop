package com.nonstop.myapplication;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import com.nonstop.myapplication.rest.RestHttpClient;

import org.json.simple.parser.JSONParser;

public class SessionLogin2Activity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        SharedPreferences pref = getSharedPreferences("session", MODE_PRIVATE);
        String userSessionJson = pref.getString("user", "");
        JSONParser parser = new JSONParser();
        System.out.println("session 확인: " + userSessionJson);
        String sessionId = null;
        if (userSessionJson == "") {
            setContentView(R.layout.activity_session_login2);

            ((Button) findViewById(R.id.button_login)).setOnClickListener(
                    new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            loginProgress(((TextView) findViewById(R.id.editText_user_id)).getText().toString(),
                                    ((TextView) findViewById(R.id.editText_password)).getText().toString());
                        }
                    }
            );
        }else{
            Intent intent = new Intent(getBaseContext(), MainActivity.class);
            startActivity(intent);
            finish();
        }

    }

    private void loginProgress(final String userId, final String pwd) {
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    RestHttpClient restful = new RestHttpClient();
                    String userSessionJson = restful.getJSONUserSession(userId, pwd);
                    ;
                    System.out.println("조회결과:" + userSessionJson);

                    if (userSessionJson != null) {
                        SharedPreferences pref = getSharedPreferences("session", MODE_PRIVATE);
                        SharedPreferences.Editor editor = pref.edit();
                        editor.putString("user", userSessionJson);
                        editor.commit();

                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                Intent intent = new Intent(getBaseContext(), MainActivity.class);
                                startActivity(intent);
                                finish();
                            }
                        });

                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }
}
