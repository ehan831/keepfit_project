package com.keepfit.fragment;


import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import com.keepfit.keepfit.R;

public class SearchFragment extends Fragment {

    private View view;

    //ctrl+o 누르면 불러오기 설정 가능 oncreateView
    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {

        view = inflater.inflate(R.layout.searchfragment,container,false);

        //웹뷰 선언 및 초기화
        WebView webView = (WebView)view.findViewById(R.id.webView_search);
        //웹뷰 관련 셋팅
        WebSettings webSettings = webView.getSettings();
        webSettings.setJavaScriptEnabled(true);
        webSettings.setJavaScriptCanOpenWindowsAutomatically(true);
        webSettings.setAllowFileAccessFromFileURLs(true);
        webSettings.setSaveFormData(false);
        webSettings.setSavePassword(false);
        webSettings.setUseWideViewPort(true);
        webSettings.setSupportMultipleWindows(true);
        webSettings.setLayoutAlgorithm(WebSettings.LayoutAlgorithm.SINGLE_COLUMN);

        /*리다이렉트 할 때 브라우저 열리는 것 방지*/
        webView.setWebViewClient(new WebViewClient());
        webView.setWebChromeClient(new WebChromeClient());

        /*웹 뷰 띄우기*/

        webView.loadUrl("http://192.168.0.99:8080/Project_KeepFit/TEST-search.jsp");


        return view;
    }
}
