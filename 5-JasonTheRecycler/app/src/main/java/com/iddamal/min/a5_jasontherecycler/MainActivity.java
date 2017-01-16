package com.iddamal.min.a5_jasontherecycler;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.VolleyLog;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    // Variables -- view
    private RecyclerView mRecyclerView;

    // Variables -- model
    List<User> mUserList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Initialising the ArrayList
        mUserList = new ArrayList<>();

        // Setting up RecyclerView
        mRecyclerView = (RecyclerView) findViewById(R.id.recycler_view);
        LinearLayoutManager layoutManager = new LinearLayoutManager(getApplicationContext());
        mRecyclerView.setLayoutManager(layoutManager);

        final RecyclerViewAdapter recyclerViewAdapter = new RecyclerViewAdapter(mUserList);
        mRecyclerView.setAdapter(recyclerViewAdapter);

        // Starting the networking portion of the app
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        String url = "https://jsonplaceholder.typicode.com/posts";

        // Using ArrayRequest as opposed to ObjectRequest due to structure of JSON string
        JsonArrayRequest jsonArrayRequest = new JsonArrayRequest(url, new Response.Listener<JSONArray>() {
            @Override
            public void onResponse(JSONArray response) {
                try {
                    if (response.length() > 0) {
                        for (int i = 0; i < response.length(); i++) {

                            // The following section cycles through the JSON response array
                            // and picks out individual elements as JSON Objects
                            JSONObject jsonObject = response.getJSONObject(i);
                            User user = new User();

                            if (!jsonObject.isNull("userId")) {
                                user.setUserName(jsonObject.getString("userId"));
                            } else {
                                throw new JSONException("userId");
                            }

                            if (!jsonObject.isNull("id")) {
                                user.setUserId(jsonObject.getString("id"));
                            }

                            if (!jsonObject.isNull("title")) {
                                user.setTitle(jsonObject.getString("title"));
                            }

                            if (!jsonObject.isNull("body")) {
                                user.setBody(jsonObject.getString("body"));
                            }
                            mUserList.add(i, user);
                        }
                        recyclerViewAdapter.notifyDataSetChanged();
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                try {
                    throw new VolleyError(error.toString());
                } catch (VolleyError volleyError) {
                    volleyError.printStackTrace();
                }
            }
        });

        requestQueue.add(jsonArrayRequest);
    }
}


