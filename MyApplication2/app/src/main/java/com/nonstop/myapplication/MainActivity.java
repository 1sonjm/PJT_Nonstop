package com.nonstop.myapplication;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.design.widget.BottomNavigationView;
import android.support.v7.app.AppCompatActivity;
import android.view.MenuItem;
import android.widget.TextView;

import com.nonstop.myapplication.rest.RestHttpClient;
import com.nonstop.myapplication.util.EndToast;

import org.json.simple.JSONObject;

public class MainActivity extends AppCompatActivity {

    private BottomNavigationView.OnNavigationItemSelectedListener mOnNavigationItemSelectedListener
            = new BottomNavigationView.OnNavigationItemSelectedListener() {

        @Override
        public boolean onNavigationItemSelected(@NonNull MenuItem item) {
            final Intent[] intent = new Intent[1];
            switch (item.getItemId()) {
                case R.id.navigation_home:
                    return true;
                case R.id.navigation_portfolio:
                    intent[0] =new Intent(getBaseContext(),PortfolioActivity.class);
                    startActivity(intent[0]);
                    finish();
                    return true;
                case R.id.navigation_letter:
                    AlertDialog.Builder alt_bld = new AlertDialog.Builder(MainActivity.this);
                    alt_bld.setMessage("로그아웃 하시겠습니까?").setCancelable(
                            false).setNegativeButton("아니요",
                            new DialogInterface.OnClickListener() {
                                public void onClick(DialogInterface dialog, int id) {
                                    // Action for 'NO' Button
                                    dialog.cancel();
                                }
                            }).setPositiveButton("예",
                            new DialogInterface.OnClickListener() {
                                public void onClick(DialogInterface dialog, int id) {
                                    // Action for 'Yes' Button
                                    SharedPreferences pref = getSharedPreferences("session", MODE_PRIVATE);
                                    SharedPreferences.Editor editor = pref.edit();
                                    editor.remove("user");
                                    editor.commit();
                                    intent[0] =new Intent(getBaseContext(),SessionLogin2Activity.class);
                                    startActivity(intent[0]);
                                    finish();
                                }
                            });
                    AlertDialog alert = alt_bld.create();
                    alert.setTitle("로그아웃");
                    alert.show();

                    return true;
                case R.id.navigation_chat:
                    intent[0] =new Intent(getBaseContext(),ChatActivity.class);
                    startActivity(intent[0]);
                    finish();
                    return true;
            }
            return false;
        }

    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    RestHttpClient restful = new RestHttpClient();
                    final JSONObject jsonData = restful.getJSONPostCountList();
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            TextView project_count = (TextView)findViewById(R.id.project2);
                            project_count.setText(jsonData.get("PROJECT").toString());
                            TextView design_portfolio_count = (TextView)findViewById(R.id.design_portfolio2);
                            design_portfolio_count.setText(jsonData.get("DESIGN").toString());
                            TextView develop_portfolio_count = (TextView)findViewById(R.id.develop_portfolio2);
                            develop_portfolio_count.setText(jsonData.get("DEVELOP").toString());
                        }
                    });
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }).start();

        BottomNavigationView navigation = (BottomNavigationView) findViewById(R.id.navigation);
        navigation.setOnNavigationItemSelectedListener(mOnNavigationItemSelectedListener);
        navigation.setSelectedItemId(R.id.navigation_home);
    }

    EndToast endToast = new EndToast(this);
    @Override
    public void onBackPressed() {

        // 종료 EndToast Bean 사용
        endToast.showEndToast("'취소' 버튼 한번더 누르시면 종료합니다. ");

    }

}
