package com.keepfit.posting;


import android.content.Intent;
import android.os.Bundle;

import android.os.Handler;
import android.webkit.JavascriptInterface;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;


import com.keepfit.keepfit.MainActivity;
import com.keepfit.keepfit.R;


public class PostActivity extends AppCompatActivity {

    private WebView webView_post;
    Handler handler = new Handler();


    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Intent intent_web = new Intent(this.getIntent());

        setContentView(R.layout.activity_post);



        webView_post = findViewById(R.id.webView);

        webView_post.getSettings().setJavaScriptEnabled(true);
        WebSettings webSettings = webView_post.getSettings();
        webSettings.setJavaScriptCanOpenWindowsAutomatically(true);
        webSettings.setAllowFileAccessFromFileURLs(true);
        webSettings.setSaveFormData(false);
        webSettings.setSavePassword(false);
        webSettings.setUseWideViewPort(true);
        webSettings.setSupportMultipleWindows(true);
        webSettings.setLayoutAlgorithm(WebSettings.LayoutAlgorithm.SINGLE_COLUMN);


        /*리다이렉트 할 때 브라우저 열리는 것 방지*/
        webView_post.setWebViewClient(new WebViewClient());
        webView_post.setWebChromeClient(new WebChromeClient());
        webView_post.addJavascriptInterface(new AndroidBridge(), "MyTestApp");

        /*웹 뷰 띄우기*/
        //webView_post.loadUrl("http://192.168.0.6:8080/Project_KeepFit/picUpload.do?upload=0");
      webView_post.loadUrl("http://192.168.0.99:8080/Project_KeepFit/picUpload.do?upload=0");


 }
    private class AndroidBridge {

        @JavascriptInterface
        public void AlertMsg(final String arg) { // 웹뷰내의 페이지에서 호출하는 함수

            handler.post(new Runnable() {

                @Override

                public void run() {

                  //  Toast.makeText(PostActivity.this, arg, Toast.LENGTH_SHORT).show();
                   // finish();
                    Intent intent_back = new Intent(getApplicationContext(), MainActivity.class);
                    intent_back.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                    startActivity(intent_back);
                }

            });

        }

    }
}
