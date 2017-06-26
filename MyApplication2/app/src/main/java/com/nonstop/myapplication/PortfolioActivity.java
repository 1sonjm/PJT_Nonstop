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
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.ScrollView;
import android.widget.Spinner;
import android.widget.TextView;

import com.nonstop.myapplication.domain.Portfolio;
import com.nonstop.myapplication.rest.RestHttpClient;
import com.nonstop.myapplication.util.EndToast;

import java.util.List;

import static com.nonstop.myapplication.R.id.massage_box;

/*
 *  Android Client Application
 */
public class PortfolioActivity extends AppCompatActivity {
    private int currentPage = 1;
    ScrollView portfolioListView;
    private String selectedTarget ="develop";

    private BottomNavigationView.OnNavigationItemSelectedListener mOnNavigationItemSelectedListener
            = new BottomNavigationView.OnNavigationItemSelectedListener() {

        @Override
        public boolean onNavigationItemSelected(@NonNull MenuItem item) {
            final Intent[] intent = new Intent[1];
            switch (item.getItemId()) {
                case R.id.navigation_home:
                    intent[0] =new Intent(getBaseContext(),MainActivity.class);
                    startActivity(intent[0]);
                    finish();
                    return true;
                case R.id.navigation_portfolio:
                    return true;
                case R.id.navigation_letter:
                    AlertDialog.Builder alt_bld = new AlertDialog.Builder(PortfolioActivity.this);
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
        setContentView(R.layout.activity_protfolio);

        BottomNavigationView navigation = (BottomNavigationView) findViewById(R.id.navigation);
        final Spinner spinner = (Spinner)findViewById(R.id.spinner_select_item);
        navigation.setOnNavigationItemSelectedListener(mOnNavigationItemSelectedListener);
        navigation.setSelectedItemId(R.id.navigation_portfolio);
        requestPortfolioList(selectedTarget);

        portfolioListView = (ScrollView)findViewById(R.id.portfolio_view);
        portfolioListView.getViewTreeObserver().addOnScrollChangedListener(new ViewTreeObserver.OnScrollChangedListener() {
            @Override
            public void onScrollChanged() {
                int scrollViewPos = portfolioListView.getScrollY();
                int textView_lines = portfolioListView.getChildAt(0).getBottom() - portfolioListView.getHeight();
                if(textView_lines == scrollViewPos){
                    portfolioListView.setScrollY(scrollViewPos-100);
                    requestPortfolioList(selectedTarget);
                }
            }
        });
        String[] facilityList = {"개발 분야", "디자인 분야"};
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(
                this,
                android.R.layout.simple_spinner_dropdown_item,
                facilityList);
        spinner.setAdapter(adapter);
        spinner.setSelection(0);
        spinner.setOnItemSelectedListener(
                new Spinner.OnItemSelectedListener(){

                    @Override
                    public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                        switch (spinner.getSelectedItemPosition()){
                            case 0:
                                selectedTarget ="develop";
                                break;
                            case 1:
                                selectedTarget ="design";
                                break;
                        }
                        currentPage = 1;
                        ((LinearLayout) findViewById(massage_box)).removeAllViews();
                        requestPortfolioList(selectedTarget);
                    }

                    @Override
                    public void onNothingSelected(AdapterView<?> adapterView) {

                    }
                }
        );

    }
    public void requestPortfolioList(final String listTarget){
        final AppCompatActivity thisActivity = this;
        final String taget = listTarget;
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                RestHttpClient restful = new RestHttpClient();
                final List<Portfolio> portfolioList = restful.getJSONPortfolioList(taget,currentPage,1);
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            //System.out.println(portfolioList);
                            if(portfolioList.size() > 0) {
                                for (int i = 0; i < portfolioList.size(); i++) {
                                    final RelativeLayout listItme = (RelativeLayout) View.inflate(thisActivity, R.layout.activity_uibaselayout_module, null);
                                    portfolioListView = (ScrollView)findViewById(R.id.portfolio_view);
                                    LinearLayout linearLayout = (LinearLayout) findViewById(massage_box);

//                                    ImageView thumbnail = (ImageView) listItme.findViewById(R.id.imageView_thumbnail);
                                    final int targetPortNo = portfolioList.get(i).getPortNo();

                                    ((TextView) listItme.findViewById(R.id.textView_list_user_id))
                                            .setText(portfolioList.get(i).getPortUserId());
                                    ((TextView) listItme.findViewById(R.id.textView_list_total_view))
                                            .setText(Integer.toString(portfolioList.get(i).getTotalPortView())+"명");
                                    ((TextView) listItme.findViewById(R.id.textView_list_port_no))
                                            .setText(Integer.toString(portfolioList.get(i).getPortNo()));
                                    ((TextView) listItme.findViewById(R.id.textView_list_regdate))
                                            .setText(portfolioList.get(i).getPortRegdate());
                                    ((TextView) listItme.findViewById(R.id.textView_list_title))
                                            .setText(portfolioList.get(i).getPortTitle());

                                    String portDivision = null;
                                    switch(portfolioList.get(i).getPortDivision()){
                                        case 10:
                                            portDivision = "개발 > 웹/앱";
                                            break;
                                        case 11:
                                            portDivision = "개발 > 웹";
                                            break;
                                        case 12:
                                            portDivision = "개발 > 앱";
                                            break;
                                        case 20:
                                            portDivision = "디자인  > 웹/앱";
                                            break;
                                        case 21:
                                            portDivision = "디자인 > 웹";
                                            break;
                                        case 22:
                                            portDivision = "디자인 > 앱";
                                            break;
                                    }
                                    ((TextView) listItme.findViewById(R.id.textView_list_division))
                                            .setText(portDivision);

                                    //thumbnail.setImageBitmap(portfolioList.get(i).getThumbnail());

                                    listItme.findViewById(R.id.list_item_form).setOnClickListener(
                                            new RelativeLayout.OnClickListener(){
                                                @Override
                                                public void onClick(View view) {
                                                    //System.out.println(((TextView) listItme.findViewById(R.id.textView_port_no)).getText());
                                                    System.out.println("선택 대상:"+targetPortNo);
                                                    Intent intent=new Intent(getBaseContext(),GetPortfolioActivity.class);
                                                    intent.putExtra("portNo",targetPortNo);
                                                    startActivity(intent);
                                                }
                                            }
                                    );

//                                    if (linearLayout.getChildCount() % 2 == 0) {
//                                        listItme.setBackgroundColor(Color.LTGRAY);
//                                    }
                                    linearLayout.addView(listItme);
                                }
                                currentPage++;
                                System.out.println(currentPage + "==");
                            }
                        }
                    });
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }

    EndToast endToast = new EndToast(this);
    @Override
    public void onBackPressed() {

        // 종료 EndToast Bean 사용
        endToast.showEndToast("'취소' 버튼 한번더 누르시면 종료합니다. ");

    }


}