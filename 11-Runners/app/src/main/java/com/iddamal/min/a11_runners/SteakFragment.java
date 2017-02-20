package com.iddamal.min.a11_runners;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

public class SteakFragment extends Fragment {

    private final static String TAG = "Steak";

    public static String getTAG() {
        return TAG;
    }

    static SteakFragment newInstance() {
        return new SteakFragment();
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.frag_steak, container, false);

        return view;
    }
}
