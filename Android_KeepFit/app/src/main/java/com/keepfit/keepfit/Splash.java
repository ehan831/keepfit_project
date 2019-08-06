package com.keepfit.keepfit;


import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.PersistableBundle;


public class Splash extends Activity {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_splash);
        Handler hd = new Handler();
        hd.postDelayed(new Runnable() {

            public void run() {

                finish();            //2초동안 보여준 후, SplashActivity를 종료한 후 MainActivity로 돌아갑니다.
            }
        }, 2000);                //2000millis. 즉 2초동안 해당 화면을 보여준 후, finish() 됩니다.
    }

    @Override
    public void onBackPressed() {
        //초반 플래시 화면에서 넘어갈때 뒤로가기 버튼 못누르게 함
    }


}
