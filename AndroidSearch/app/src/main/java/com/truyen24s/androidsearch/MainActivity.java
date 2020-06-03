package com.truyen24s.androidsearch;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;

import com.google.gson.Gson;
import com.nifcloud.mbaas.core.FindCallback;
import com.nifcloud.mbaas.core.NCMB;
import com.nifcloud.mbaas.core.NCMBException;
import com.nifcloud.mbaas.core.NCMBObject;
import com.nifcloud.mbaas.core.NCMBQuery;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {
    NCMBQuery<NCMBObject> mQuery;
    List<String> mConditions;
    Gson gson;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        gson = new Gson();
        NCMB.initialize(getApplicationContext(), "b2ee91d471db6e2505ac46e19a4bb594128403067237bda7ce29e232aeb9e77f", "1005a095286c018632636d8db9e0092490a67c7b6a94a1ab868a9c082f30b567");

        // Initial for search data
        mQuery = new NCMBQuery<>("SearchClass");
        mConditions = new ArrayList<>();
        mConditions.add("name5");
        mConditions.add("name2");
        // Set click event
        findViewById(R.id.btn_in).setOnClickListener(this);
        findViewById(R.id.btn_in_array).setOnClickListener(this);
    }

    private void searchIN(List<String> conditions, NCMBQuery<NCMBObject> query) {
        query.whereContainedIn("name", conditions);
        query.findInBackground(new FindCallback<NCMBObject>() {
            @Override
            public void done(List<NCMBObject> list, NCMBException e) {
                if (e == null) {
                    Log.d("SearchData", gson.toJson(list));
                    handleData(list);
                } else {
                    Log.d("SearchData", e.getMessage());
                }
            }
        });
    }

    private void searchINARRAY(List<String> conditions, NCMBQuery<NCMBObject> query) {
        query.whereContainedInArray("name", conditions);
        query.findInBackground(new FindCallback<NCMBObject>() {
            @Override
            public void done(List<NCMBObject> list, NCMBException e) {
                if (e == null) {
                    Log.d("SearchData", gson.toJson(list));
                    handleData(list);
                } else {
                    Log.d("SearchData", e.getMessage());
                }
            }
        });
    }

    private void handleData(List<NCMBObject> list) {
        Log.d("SearchData", "|objectId|name|createDate|updateDate|");
        for (NCMBObject ncmbObject : list) {
            String output = "|";
            output += ncmbObject.getString("objectId") + "|";
            output += ncmbObject.getString("name") + "|";
            output += ncmbObject.getString("createDate") + "|";
            output += ncmbObject.getString("updateDate") + "|";
            Log.d("SearchData", output);
        }
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.btn_in:
                searchIN(mConditions, mQuery);
                break;
            case R.id.btn_in_array:
                searchINARRAY(mConditions, mQuery);
                break;
        }
    }
}
