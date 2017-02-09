package com.iddamal.min.a9_anim8;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    // Views
    private Button mFadeInButton;
    private Button mFadeOutButton;
    private Button mSlideUpButton;
    private Button mSlideDownButton;
    private TextView mTextView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Setting up views
        mFadeInButton = (Button) findViewById(R.id.btnFadeIn);
        mFadeOutButton = (Button) findViewById(R.id.btnFadeOut);
        mSlideUpButton = (Button) findViewById(R.id.btnUp);
        mSlideDownButton = (Button) findViewById(R.id.btnDown);
        mTextView = (TextView) findViewById(R.id.textview);

        // Constants
        final float TEXT_VIEW_X_CO = mTextView.getX();
        final float TEXT_VIEW_Y_CO = mTextView.getY();

        mFadeInButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mTextView.animate()
                        .alpha(1.0f)
                        .setDuration(150L);
                
            }
        });

        mFadeOutButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mTextView.animate()
                        .alpha(0.0f)
                        .setDuration(150L);
            }
        });

        mSlideUpButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mTextView.setAlpha(0f);
                //mTextView.setX(TEXT_VIEW_X_CO);
                mTextView.setY(TEXT_VIEW_Y_CO);
                mTextView.animate()
                        .alpha(1f)
                        .translationYBy(10f)
                        .setDuration(300L);
            }
        });

        mSlideDownButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mTextView.setAlpha(0f);
                //mTextView.setX(TEXT_VIEW_X_CO);
                mTextView.setY(TEXT_VIEW_Y_CO);
                mTextView.animate()
                        .alpha(1f)
                        .translationYBy(-10f)
                        .setDuration(300L);
            }
        });

    }
}
