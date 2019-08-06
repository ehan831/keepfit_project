package com.keepfit.keepfit;

import android.content.Intent;
import android.os.Bundle;
import android.view.MenuItem;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;


import com.google.android.material.bottomnavigation.BottomNavigationView;

import com.keepfit.Handler.MainBackPressCloseHandler;

import com.keepfit.capture.CaptureActivity;
import com.keepfit.fragment.HomeFragment;
import com.keepfit.fragment.SearchFragment;
import com.keepfit.fragment.LikeListFragment;
import com.keepfit.fragment.MyPageFragment;


public class MainActivity extends AppCompatActivity {

    /*전역 변수 선언 */
    private BottomNavigationView bottomNavigationView;
    private FragmentManager fm;
    private FragmentTransaction ft;

    // 프레그먼트 선언
    private HomeFragment homeFragment;
    private SearchFragment searchFragment;
    private LikeListFragment likeListFragment;
    private MyPageFragment myPageFragment;

    // MainBackPressCloseHandler
    private MainBackPressCloseHandler mainBackPressCloseHandler;


    //onCreate 실행
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);




        //메인화면 보이기
        setContentView(R.layout.activity_main);

        //Splash 화면 실행
        startActivity(new Intent(this,Splash.class));


        //BottomNavigationView 초기화
        bottomNavigationView = findViewById(R.id.bottomNavi);

        //BottomNavigationView Listener
        bottomNavigationView.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem menuItem) {

                switch (menuItem.getItemId()) {

                    case R.id.action_home:
                        setFrag(0);
                        break;
                    case R.id.action_search:
                        setFrag(1);
                        break;
                    case R.id.action_add:
                        setFrag(2);
                        break;
                    case R.id.action_call:
                        setFrag(3);
                        break;
                    case R.id.action_run:
                        setFrag(4);
                        break;
                }


                return true;
            }
        });

        //프레그먼트 초기화
        homeFragment = new HomeFragment();
        searchFragment = new SearchFragment();
        likeListFragment = new LikeListFragment();
        myPageFragment = new MyPageFragment();

        //메인 엑티비티 실행에 시작할 화면
        setFrag(0);

        //핸들러 초기화
       mainBackPressCloseHandler = new MainBackPressCloseHandler(this);


    }

    // 프래그먼트 교체가 일어나는 실행문
    private void setFrag(int n) {
        fm = getSupportFragmentManager();
        ft = fm.beginTransaction(); // 프래그먼트 교체
        switch (n) {
            case 0:
                ft.replace(R.id.main_frame, homeFragment);
                ft.commit();
                break;

            case 1:
                ft.replace(R.id.main_frame, searchFragment);
                ft.commit();
                break;
            case 2:
                Intent intent = new Intent(this, CaptureActivity.class);
                startActivity(intent);
                break;
            case 3:
                ft.replace(R.id.main_frame, likeListFragment);
                ft.commit();
                break;
            case 4:
                ft.replace(R.id.main_frame, myPageFragment);
                ft.commit();
                break;
        }
    }

    // 뒤로가기 버튼을 클릭 하였을때 실행
    @Override
    public void onBackPressed() {
      mainBackPressCloseHandler.onBackPressed();
      //  finish();
    }


}
