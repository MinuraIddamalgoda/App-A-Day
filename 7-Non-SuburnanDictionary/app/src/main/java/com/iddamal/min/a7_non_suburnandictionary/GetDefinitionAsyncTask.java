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

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class GetDefinitionAsyncTask extends AsyncTask<String, Void, Definition> {

    // Variables
    private Context mContext;

    // Constants
    private static final String TAG_LIST = "list";
    private static final String TAG_PERMALINK = "permalink";
    private static final String TAG_DEFINITION = "definition";
    private static final String TAG_THUMBS_UP = "thumbs_up";
    private static final String TAG_THUMBS_DOWN = "thumbs_down";

    public GetDefinitionAsyncTask(Context context) {
        mContext = context;
    }

    @Override
    protected Definition doInBackground(String... params) {
        String searchTerm = params[0];
        searchTerm = searchTerm.trim();

        Log.d("Search term: ", searchTerm);

        RequestQueue requestQueue = Volley.newRequestQueue(mContext);
        String url = "http://api.urbandictionary.com/v0/define?term=" + searchTerm;

        StringRequest stringRequest = new StringRequest(Request.Method.GET, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try {

                    MainActivity.mDefinitions.clear();

                    JSONObject jsonObject = new JSONObject(response);
                    JSONArray jsonArray = jsonObject.getJSONArray(TAG_LIST);

                    Log.d("JSON Object Response: ", jsonArray.toString());

                    for (int i = 0; i < jsonArray.length(); i++) {
                        JSONObject jsonChildObject = jsonArray.getJSONObject(i);

                        Log.d("JSON Child Obj: ", jsonChildObject.toString());

                        String searchTerm = String.valueOf(MainActivity.searchTerm);
                        String definition = jsonChildObject.getString(TAG_DEFINITION);
                        int thumbsUp = jsonChildObject.getInt(TAG_THUMBS_UP);
                        int thumbsDown = jsonChildObject.getInt(TAG_THUMBS_DOWN);
                        String link = jsonChildObject.getString(TAG_PERMALINK);

                        Definition tempDefinitionObject = new Definition(
                                searchTerm,
                                definition,
                                thumbsUp,
                                thumbsDown,
                                link);

                        MainActivity.mDefinitions.add(tempDefinitionObject);
                    }

                    MainActivity.updateCardView(MainActivity.mDefinitions.get(0));
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

    @Override
    protected void onPostExecute(Definition definition) {
        super.onPostExecute(definition);

    }
}
