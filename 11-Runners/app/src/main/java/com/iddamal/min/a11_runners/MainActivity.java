package com.iddamal.min.a11_runners;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentStatePagerAdapter;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

public class MainActivity extends FragmentActivity {

    // Variables -- model
    private PagerAdapter mPagerAdapter;

    // Variables -- view
    private ViewPager mViewPager;

    // Constants
    private static final int NUM_PAGES = 3;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Setting up view and adapter
        mViewPager = (ViewPager) findViewById(R.id.view_pager);
        mPagerAdapter = new FoodPagerAdapter(getSupportFragmentManager());
        mViewPager.setAdapter(mPagerAdapter);

    }
}

class FoodPagerAdapter extends FragmentStatePagerAdapter {

    // Variables -- view
    private SteakFragment mSteakFragment;
    private ChickenFragment mChickenFragment;
    private CheckOutFragment mCheckOutFragment;


    FoodPagerAdapter(FragmentManager fm) {
        super(fm);

        // Instantiating fragments
        mSteakFragment = SteakFragment.newInstance();
        mChickenFragment = ChickenFragment.newInstance();
        mCheckOutFragment = CheckOutFragment.newInstance();
    }

    @Override
    public Fragment getItem(int position) {
        switch (position) {
            case 0:
                return mSteakFragment;
            case 1:
                return mChickenFragment;
            case 2:
                return mCheckOutFragment;
            default:
                return SteakFragment.newInstance();
        }
    }

    @Override
    public int getCount() {
        return 3;
    }
}
