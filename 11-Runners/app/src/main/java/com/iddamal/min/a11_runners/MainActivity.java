package com.iddamal.min.a11_runners;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentStatePagerAdapter;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.Menu;

import java.util.ArrayList;
import java.util.List;

import static com.iddamal.min.a11_runners.MainActivity.sCheckOutFragment;
import static com.iddamal.min.a11_runners.MainActivity.sChickenFragment;
import static com.iddamal.min.a11_runners.MainActivity.sFragmentList;
import static com.iddamal.min.a11_runners.MainActivity.sSteakFragment;
import static com.iddamal.min.a11_runners.R.layout.activity_main;

public class MainActivity extends AppCompatActivity {

    // Variables -- model
    public static List<Fragment> sFragmentList;

    // Variables -- controller
    private PagerAdapter mPagerAdapter;

    // Variables -- view
    private ViewPager mViewPager;
    public static SteakFragment sSteakFragment;
    public static ChickenFragment sChickenFragment;
    public static CheckOutFragment sCheckOutFragment;
    private Toolbar toolbar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        sFragmentList = new ArrayList<>();

        // Setting up fragments
        setUpFragments();

        // Adding fragments to sFragmentList
        sFragmentList.add(sSteakFragment);
        sFragmentList.add(sChickenFragment);
        sFragmentList.add(sCheckOutFragment);

        // Setting up ViewPager and PagerAdapter
        mViewPager = (ViewPager) findViewById(R.id.view_pager);
        mPagerAdapter = new FoodPagerAdapter(getSupportFragmentManager());
        mViewPager.setAdapter(mPagerAdapter);
        mViewPager.setPageTransformer(false, new ZoomOutPagerTransformer());

        // Setting up ActionToolbar
        toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

    }

    private void setUpFragments() {
        sSteakFragment = SteakFragment.newInstance();
        sChickenFragment = ChickenFragment.newInstance();
        sCheckOutFragment = CheckOutFragment.newInstance();
    }
}

class FoodPagerAdapter extends FragmentStatePagerAdapter {

    FoodPagerAdapter(FragmentManager fm) {
        super(fm);
    }

    @Override
    public Fragment getItem(int position) {
        return sFragmentList.get(position);
    }

    @Override
    public int getCount() {
        return sFragmentList.size();
    }

    @Override
    public CharSequence getPageTitle(int position) {
        switch (position) {
            case 0:
                return "Steak";
            case 1:
                return "Chicken";
            case 2:
                return "Check Out";
            default:
                return "null";
        }
    }
}
