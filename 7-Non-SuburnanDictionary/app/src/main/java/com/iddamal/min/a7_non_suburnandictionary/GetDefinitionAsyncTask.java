package com.iddamal.min.a7_non_suburnandictionary;

import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

public class GetDefinitionAsyncTask extends AsyncTask<String, Void, Void> {

    // Variables
    private Context mContext;

    // Constants
    private static final String TAG_PERMALINK = "permalink";
    private static final String TAG_DEFINITION = "definition";
    private static final String TAG_THUMBS_UP = "thumbs_up";
    private static final String TAG_THUMBS_DOWN = "thumbs_down";

    public GetDefinitionAsyncTask(Context context) {
        mContext = context;
    }

    @Override
    protected Void doInBackground(String... params) {
        String searchTerm = params[0];

        searchTerm = searchTerm.trim();
        Log.d("Search term: ", searchTerm);

        RequestQueue requestQueue = Volley.newRequestQueue(mContext);
        String url = "http://api.urbandictionary.com/v0/define?term=" + searchTerm;

        StringRequest stringRequest = new StringRequest(Request.Method.GET, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try {
                    Log.d("JSON Response: ", response);

                    JSONObject jsonObject = new JSONObject(response);

                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.e("JSON Error: ", error.toString());
            }
        });

        requestQueue.add(stringRequest);

        return null;
    }
}
