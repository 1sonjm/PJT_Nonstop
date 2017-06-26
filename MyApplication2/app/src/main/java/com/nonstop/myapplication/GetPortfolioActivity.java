package com.nonstop.myapplication;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.nonstop.myapplication.domain.Portfolio;
import com.nonstop.myapplication.rest.RestHttpClient;

public class GetPortfolioActivity extends AppCompatActivity {

//    final private int portNo;

//    public GetPortfolioActivity() {
//        Intent intent = getIntent();
//        this.portNo = intent.getExtras().getInt("portNo");
//        System.out.println("넘어온 값:"+intent.getExtras().getInt("portNo"));
//
//    }
    int portNo;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_get_portfolio);

        Intent intent = getIntent();
        System.out.println("넘어온 값:"+intent.getExtras().getInt("portNo"));
        portNo = intent.getExtras().getInt("portNo");

        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    RestHttpClient restful = new RestHttpClient();
                    final Portfolio portfolio = restful.getJSONPortfolio(portNo);
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            System.out.println("조회된 객체:"+portfolio);
                            ((TextView)findViewById(R.id.textView_regdate)).setText(portfolio.getPortRegdate());
                            ((TextView)findViewById(R.id.textView_title)).setText(portfolio.getPortTitle());
                            ((TextView)findViewById(R.id.textView_detail)).setText(portfolio.getPortDetail());
                            ((TextView)findViewById(R.id.textView_user_id)).setText(portfolio.getPortUserId());
                            //((TextView)findViewById(R.id.textView_total_view)).setText(portfolio.getTotalPortView()+"명");
                            ((ImageView)findViewById(R.id.imageView_thumbnail)).setImageBitmap(portfolio.getThumbnail());


                            ((TextView)findViewById(R.id.textview_division)).setText("");
                        }
                    });
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }).start();
        ((Button)findViewById(R.id.button_comment_add)).setOnClickListener(
                new RelativeLayout.OnClickListener(){
                    @Override
                    public void onClick(View view) {
                        new Thread(new Runnable() {
                            @Override
                            public void run() {
                                try {
                                    RestHttpClient restful = new RestHttpClient();
                                    restful.addJSONProtfolioComment(portNo,((EditText)findViewById(R.id.editText_comment)).getText().toString());
                                    /*
                                    runOnUiThread(new Runnable() {
                                        @Override
                                        public void run() {
                                        }
                                    });*/
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            }
                        }).start();
                    }
                }
        );

    }

}
