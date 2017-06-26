package com.nonstop.myapplication;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.design.widget.BottomNavigationView;
import android.support.v7.app.AppCompatActivity;
import android.view.MenuItem;

/*
 *  Android Client Application
 */
public class LetterActivity extends AppCompatActivity {

    private BottomNavigationView.OnNavigationItemSelectedListener mOnNavigationItemSelectedListener
            = new BottomNavigationView.OnNavigationItemSelectedListener() {

        @Override
        public boolean onNavigationItemSelected(@NonNull MenuItem item) {
            Intent intent;
            switch (item.getItemId()) {
                case R.id.navigation_home:
                    intent=new Intent(getBaseContext(),MainActivity.class);
                    startActivity(intent);
                    finish();
                    return true;
                case R.id.navigation_portfolio:
                    intent=new Intent(getBaseContext(),PortfolioActivity.class);
                    startActivity(intent);
                    finish();
                    return true;
                case R.id.navigation_letter:
                    return true;
                case R.id.navigation_chat:
                    intent=new Intent(getBaseContext(),ChatActivity.class);
                    startActivity(intent);
                    finish();
                    return true;
            }
            return false;
        }

    };
    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_letter);

        BottomNavigationView navigation = (BottomNavigationView) findViewById(R.id.navigation);
        navigation.setOnNavigationItemSelectedListener(mOnNavigationItemSelectedListener);
        navigation.setSelectedItemId(R.id.navigation_letter);
    }
}