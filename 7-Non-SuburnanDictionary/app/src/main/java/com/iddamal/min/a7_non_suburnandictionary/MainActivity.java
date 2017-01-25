package com.iddamal.min.a7_non_suburnandictionary;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.CardView;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    // Variables -- model
    public static List<Definition> mDefinitions;

    // Variables -- controller
    GetDefinitionAsyncTask getDefinition;

    // Variables -- view
    private EditText mSearchEditText;
    private Button mSearchButton;
    private CardView mCardView;
    private TextView mSearchTermTextView;
    private TextView mDefinitionTextView;
    private TextView mThumbsUpTextView;
    private TextView mThumbsDownTextView;
    private Button mNextButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Setting up variables
        mDefinitions = new ArrayList<>();
        getDefinition = new GetDefinitionAsyncTask(getApplicationContext());

        // Defining view variables
        mSearchEditText = (EditText) findViewById(R.id.search_edit_text);
        mSearchButton = (Button) findViewById(R.id.search_button);
        mCardView = (CardView) findViewById(R.id.card_view);
        mSearchTermTextView = (TextView) findViewById(R.id.search_text_view);
        mDefinitionTextView = (TextView) findViewById(R.id.definition_text);
        mThumbsUpTextView = (TextView) findViewById(R.id.thumbs_up);
        mThumbsDownTextView = (TextView) findViewById(R.id.thumbs_down);
        mNextButton = (Button) findViewById(R.id.btn_next);

        // Setting up views
        mSearchEditText.setImeActionLabel("Search", KeyEvent.KEYCODE_ENTER);

        // Listeners
        mSearchButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                getDefinition.execute(mSearchEditText.getText().toString());
            }
        });

        mSearchEditText.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mSearchEditText.setText("");
            }
        });

        mSearchEditText.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (keyCode == KeyEvent.KEYCODE_ENTER) {
                    getDefinition.execute(mSearchEditText.getText().toString());
                }
                return false;
            }
        });
    }

    private void updateCardView(Definition definition) {
        mSearchTermTextView.setText(definition.getSearchTerm());
        mDefinitionTextView.setText(definition.getDefinition());
        mThumbsUpTextView.setText(definition.getThumbsUp());
        mThumbsDownTextView.setText(definition.getThumbsDown());
    }
}
