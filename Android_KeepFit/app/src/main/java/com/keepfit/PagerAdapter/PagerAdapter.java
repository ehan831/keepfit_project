package com.keepfit.PagerAdapter;

import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentStatePagerAdapter;

import com.keepfit.cfragment.childGalleryFragment;
import com.keepfit.cfragment.childCameraFragment;

public class PagerAdapter extends FragmentStatePagerAdapter {

    int mNumOfTabs;

    public PagerAdapter(FragmentManager fm, int mNumOfTabs) {
        super(fm);
        this.mNumOfTabs = mNumOfTabs;

    }

    @Override
    public Fragment getItem(int position) {
        switch (position) {
            case 0:
                childGalleryFragment cfrag1 = new childGalleryFragment();
                return cfrag1;
            case 1:
                childCameraFragment cfrag2 = new childCameraFragment();
                return cfrag2;
            default:
                return null;

        }

    }

    @Override
    public int getCount() {
        return mNumOfTabs;
    }

}
