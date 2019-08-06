package com.keepfit.cfragment;

import android.content.Intent;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.GridView;
import android.widget.ImageView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.keepfit.ImageAdaptor.ImageAdaptor;
import com.keepfit.keepfit.R;

import java.util.ArrayList;
import java.util.Arrays;

public class childGalleryFragment extends Fragment {

    //멤버 변수 선언
    ImageView imageView = null;
    FloatingActionButton btn_big_gallery = null;
    private View view;

    //ctrl+o 누르면 불러오기 설정 가능 oncreateView
    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {

        //child_galleryfragment 화면 호출
        view = inflater.inflate(R.layout.child_galleryfragment, container, false);

        //이미지 뷰 초기화
        imageView = (ImageView) view.findViewById(R.id.imageView);
        //버튼 초기화
        btn_big_gallery = (FloatingActionButton) view.findViewById(R.id.gallery_button);

        btn_big_gallery.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                //버튼이 눌릴때 갤러리 이동
                Intent intent = new Intent(getActivity(), galleryActivity.class);
                startActivity(intent);
            }
        });


        final ArrayList<Integer> mImagesIds = new ArrayList<>(Arrays.asList(
                R.drawable.img11, R.drawable.img12, R.drawable.keepfit_main, R.drawable.img1, R.drawable.img2, R.drawable.img3
                , R.drawable.img4, R.drawable.img5, R.drawable.img6, R.drawable.img7,
                R.drawable.img8, R.drawable.img9, R.drawable.img10, R.drawable.img13, R.drawable.img14,
                R.drawable.img15, R.drawable.img16, R.drawable.img17
        ));
        //그리드뷰 선언 및 초기화
        GridView gridView = (GridView) view.findViewById(R.id.myGrid);

        gridView.setAdapter(new ImageAdaptor(mImagesIds, getActivity()));

        gridView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int position, long id) {
                int item_pos = mImagesIds.get(position);

            }
        });


        return view;
    }

}
