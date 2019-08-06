package com.keepfit.capture;


import android.content.Intent;

import android.os.Bundle;


import android.view.MenuItem;


import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import androidx.viewpager.widget.PagerAdapter;
import androidx.viewpager.widget.ViewPager;


import com.google.android.material.tabs.TabLayout;


import com.keepfit.keepfit.R;


public class CaptureActivity extends AppCompatActivity {

    //멤버 변수 선언

    private ViewPager mViewPager;

    // Activity가 최초 생성할때 호출, 초기화 설정을 하는 부분
    // 상태를 저장중인 Bundle객체를 받아서 사용
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        //activiy_capture 화면을 호출
        setContentView(R.layout.activity_capture);

        // 전화면에서 Intent 이동
        Intent intent = new Intent(this.getIntent());

        //툴바 선언 및 초기화
        Toolbar mToolBar = (Toolbar) findViewById(R.id.capture_toolbar);
        setSupportActionBar(mToolBar);

        // 툴바 Back키 지정
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setHomeAsUpIndicator(R.drawable.ic_arrow_back_black_24dp);


        //탭레이아웃 선언 및 초기화
        TabLayout tabLayout = (TabLayout) findViewById(R.id.camera_tab);
        tabLayout.setTabGravity(TabLayout.GRAVITY_FILL);

        //뷰페이저 선언 및 초기화
        final ViewPager viewPager = (ViewPager) findViewById(R.id.pager);
        // 페이저어뎁터 호출 및 프래그먼트 변경 호출
        final PagerAdapter adapter = new com.keepfit.PagerAdapter.PagerAdapter(getSupportFragmentManager(), tabLayout.getTabCount());
        viewPager.setAdapter(adapter);
        viewPager.addOnPageChangeListener(new TabLayout.TabLayoutOnPageChangeListener(tabLayout));
        viewPager.setCurrentItem(1);


        //탭 레이아웃 터치 리스너 설정
        tabLayout.setOnTabSelectedListener(new TabLayout.OnTabSelectedListener() {
            @Override
            public void onTabSelected(TabLayout.Tab tab) {
                viewPager.setCurrentItem(tab.getPosition());
            }

            @Override
            public void onTabUnselected(TabLayout.Tab tab) {

            }

            @Override
            public void onTabReselected(TabLayout.Tab tab) {

            }
        });

    }


    //툴바의 버튼 설정
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            //home = MainActivity
            //메인 화면으로 이동
            case android.R.id.home: {
                finish();
                return true;
            }
        }
        return super.onOptionsItemSelected(item);
    }

    // 안드로이드 뒤로가기 버튼을 눌렀을때
    @Override
    public void onBackPressed() {
        super.onBackPressed();
        finish();
    }

}
