package com.iddamal.min.contacts;

import android.graphics.Bitmap;

public class Contact {
    // Instance vars
    private String name;
    private String number;
    private Bitmap image;

    // Getters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNumber() {
        return number;
    }

    // Setters
    public void setNumber(String number) {
        this.number = number;
    }

    public Bitmap getImage() {
        return image;
    }

    public void setImage(Bitmap image) {
        this.image = image;
    }

    // Constructor
    public Contact(String name, String number, Bitmap image) {
        this.name = name;
        this.number = number;
        this.image = image;
    }
}
