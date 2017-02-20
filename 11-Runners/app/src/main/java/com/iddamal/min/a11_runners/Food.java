package com.iddamal.min.a11_runners;

import android.graphics.drawable.Drawable;

public class Food {
    private String mName;
    private float mPrice;
    private FoodType mType;
    private Drawable mImage;
    private int mStockRemaining;

    private enum FoodType {
        STEAK, CHICKEN;
    }

    public Food(String name, float price, FoodType type, Drawable image, int stockRemaining) {
        mName = name;
        mPrice = price;
        mType = type;
        mImage = image;
        mStockRemaining = stockRemaining;
    }
}
