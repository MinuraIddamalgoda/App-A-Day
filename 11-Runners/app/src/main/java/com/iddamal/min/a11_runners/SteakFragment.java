package com.iddamal.min.a11_runners;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

public class SteakFragment extends Fragment {

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);

        // Set up
    }

    public static SteakFragment newInstance() {
        return new SteakFragment();
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        super.onCreateView(inflater, container, savedInstanceState);

        View view = inflater.inflate(R.layout.fragment_steak, container, false);

        return view;
    }
}
