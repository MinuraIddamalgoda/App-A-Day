package com.iddamal.min.a7_non_suburnandictionary;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.CardView;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    // Variables -- model
    public static List<Definition> mDefinitions;

    // Variables -- controller
    public static int currentIndex = 0;
    public static String searchTerm;

    // Variables -- view
    private EditText mSearchEditText;
    private Button mSearchButton;
    private CardView mCardView;
    private static TextView mSearchTermTextView;
    private static TextView mDefinitionTextView;
    private static TextView mThumbsUpTextView;
    private static TextView mThumbsDownTextView;
    private Button mNextButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Setting up variables
        mDefinitions = new ArrayList<>();

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
                searchTerm = mSearchEditText.getText().toString();
                new GetDefinitionAsyncTask(getApplicationContext()).execute(searchTerm);
            }
        });

        mSearchEditText.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mSearchEditText.setText("");
            }
        });

        mNextButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    currentIndex++;
                    updateCardView(mDefinitions.get(currentIndex));

                } catch (IndexOutOfBoundsException e) {
                    e.printStackTrace();

                    Toast.makeText(getApplicationContext(),
                            "That's all, folks!", Toast.LENGTH_SHORT).show();
                }
            }
        });
    }

    public static void updateCardView(Definition definition) {
        mSearchTermTextView.setText(definition.getSearchTerm());
        mDefinitionTextView.setText(definition.getDefinition());
        mThumbsUpTextView.setText(String.valueOf(definition.getThumbsUp()));
        mThumbsDownTextView.setText(String.valueOf(definition.getThumbsDown()));
    }

    private void generateTestData() {
        Definition definition;

        definition = new Definition("test search1", "test def 1", 1, 1, "google.com");
        mDefinitions.add(definition);

        definition = new Definition("test search1", "test def 2", 2, 2, "facebook.com");
        mDefinitions.add(definition);

        definition = new Definition("test search1", "test def 3", 3, 3, "twitter.com");
        mDefinitions.add(definition);
    }
}
