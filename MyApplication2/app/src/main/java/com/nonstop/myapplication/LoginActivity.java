package com.nonstop.myapplication;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.design.widget.BottomNavigationView;
import android.support.v7.app.AppCompatActivity;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.nonstop.myapplication.util.EndToast;

public class LoginActivity extends AppCompatActivity {

	///Field
	private Button buttonEnter;
	private EditText editTextName;
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
					SharedPreferences pref = getSharedPreferences("session", MODE_PRIVATE);
					SharedPreferences.Editor editor = pref.edit();
					editor.remove("user");
					editor.commit();
					intent=new Intent(getBaseContext(),SessionLogin2Activity.class);
					startActivity(intent);
					finish();
					return true;
				case R.id.navigation_chat:
					return true;
			}
			return false;
		}

	};

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.login);

		this.buttonEnter = (Button)findViewById(R.id.button_enter);
		this.editTextName = (EditText)findViewById(R.id.editText_name);

		BottomNavigationView navigation = (BottomNavigationView) findViewById(R.id.navigation);
		navigation.setOnNavigationItemSelectedListener(mOnNavigationItemSelectedListener);
		navigation.setSelectedItemId(R.id.navigation_chat);
		// 대화참여하기 Button Event : 입력 ChatActivity 로 대화명 전달,이동
		buttonEnter.setOnClickListener( new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				// :: 다른 컴포넌트로 이동 위해
				//    컴포넌트를 생산할수 있는 Class 정보를
				//    Intent 생성자를 통해전달 intent instance 생성
				Intent intent = new Intent(LoginActivity.this, ChatActivity.class);

				// :: Activity 이동시 전달할 정보(Message) 가 있다면 저장
				//	  API 확인 : putExtra(name, value)
				intent.putExtra("clientName",editTextName.getText().toString());

				// :: intent 객체가 갖는 정보의 컴포넌트 호출
				startActivity(intent);
			}
		});
	}

	@Override
	// Activity Life Cycle 의 이해
	protected void onPause() {
		super.onPause();
		System.out.println(getClass().getSimpleName()+"LogonActivity.onPause()");
		//Activity 종료
		finish();
	}

	////////////////////////////////////////////////////////////////////////////////////
	// 종료 EndToast Bean 사용
	EndToast endToast = new EndToast(this);

	// Call Back Method 이용 취소버튼이용 App. 종료
	@Override
	public void onBackPressed() {

		// 종료 EndToast Bean 사용
		endToast.showEndToast("'취소' 버튼 한번더 누르시면 종료합니다. ");

	}
	////////////////////////////////////////////////////////////////////////////////////

}// end of Activity