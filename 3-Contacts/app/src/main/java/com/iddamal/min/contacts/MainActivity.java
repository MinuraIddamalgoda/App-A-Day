package com.iddamal.min.contacts;

import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.view.LayoutInflater;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.List;

public class MainActivity extends AppCompatActivity {

    // Variables -- controller
    private ContactAdapter mContactAdapter;

    // Variables -- view
    private Toolbar toolbar;
    private FloatingActionButton fab;
    private RecyclerView mRecyclerView;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Defining views
        toolbar = (Toolbar) findViewById(R.id.toolbar);
        fab = (FloatingActionButton) findViewById(R.id.fab);
        mRecyclerView = (RecyclerView) findViewById(R.id.list_contacts_view);

        // Setting up UI
        setSupportActionBar(toolbar);
        mRecyclerView.setLayoutManager(new LinearLayoutManager(getApplicationContext()));
        updateUI();

        // Listeners
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });
    }

    private void updateUI() {
        ContactList contactList = ContactList.get(getApplicationContext());
        List<Contact> contacts = contactList.getAllContacts();

        mContactAdapter = new ContactAdapter(contacts);
        mRecyclerView.setAdapter(mContactAdapter);

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    // View Holder
    private class ContactHolder extends RecyclerView.ViewHolder {
        // Variables -- model
        private Contact mContact;

        // Variables -- view
        private TextView mNameTextView;
        private ImageView mContactPhoto;

        public ContactHolder(View itemView) {
            super(itemView);

            // Setup of views
            mNameTextView = (TextView) itemView.findViewById(R.id.nameTextView);
            mContactPhoto = (ImageView) itemView.findViewById(R.id.imageContactPhoto);
        }

        public void bindCrime(Contact contact) {
            mContact = contact;
            mNameTextView.setText(mContact.getName());
            mContactPhoto.setImageBitmap(mContact.getImage());
        }
    }

    // Adapter
    private class ContactAdapter extends RecyclerView.Adapter<ContactHolder> {

        private List<Contact> mContacts;

        public ContactAdapter(List<Contact> contacts) {
            this.mContacts = contacts;
        }

        @Override
        public ContactHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            LayoutInflater layoutInflater = LayoutInflater.from(getApplicationContext());
            View view = layoutInflater.inflate(R.layout.list_contact_view, parent, false);
            return new ContactHolder(view);
        }

        @Override
        public void onBindViewHolder(ContactHolder holder, int position) {
            Contact contact = mContacts.get(position);
            holder.bindCrime(contact);
        }

        @Override
        public int getItemCount() {
            return mContacts.size();
        }
    }

}
