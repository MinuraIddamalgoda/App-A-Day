package com.iddamal.min.a11_runners;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

public class CheckOutFragment extends Fragment {

    public static CheckOutFragment newInstance() {
        return new CheckOutFragment();
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.frag_check_out, container, false);

        return view;
    }
}
