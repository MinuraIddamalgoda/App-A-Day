package com.iddamal.min.contacts;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import java.util.ArrayList;
import java.util.List;

public class ContactList {

    private static ContactList sContactList;
    private List<Contact> mContacts;

    private ContactList(Context context) {
        mContacts = new ArrayList<>();
        // Creating some fake contacts;
        // First contact
        Bitmap bitmap = BitmapFactory.decodeResource(context.getResources(), R.drawable.businessman);
        Contact contact = new Contact("Adam Apple", "0433 444 555", bitmap);
        mContacts.add(contact);

        // Second contact
        bitmap = BitmapFactory.decodeResource(context.getResources(), R.drawable.businesswoman);
        contact = new Contact("Betty Banana", "0434 666 777", bitmap);
        mContacts.add(contact);

        // Third contact
        bitmap = BitmapFactory.decodeResource(context.getResources(), R.drawable.chef);
        contact = new Contact("Charlie Carrot", "0421 566 899", bitmap);
        mContacts.add(contact);

        // Fourth contact
        bitmap = BitmapFactory.decodeResource(context.getResources(), R.drawable.doctor);
        contact = new Contact("David Date", "0434 000 990", bitmap);
        mContacts.add(contact);

        // Fifth contact
        bitmap = BitmapFactory.decodeResource(context.getResources(), R.drawable.ice_cream_lady);
        contact = new Contact("Ebony Eggfruit", "0434 321 123", bitmap);
        mContacts.add(contact);

        // Sixth contact
        bitmap = BitmapFactory.decodeResource(context.getResources(), R.drawable.mirror_guy);
        contact = new Contact("Fred Fig", "0434 098 234", bitmap);
        mContacts.add(contact);

    }

    public static ContactList get(Context context) {
        if (sContactList == null) {
            sContactList = new ContactList(context);
        }
        return sContactList;
    }

    // Returns all contacts as List object
    public List<Contact> getAllContacts() {
        return mContacts;
    }
}
