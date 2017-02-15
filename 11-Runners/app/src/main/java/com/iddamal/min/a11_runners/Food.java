package com.iddamal.min.a11_runners;

import android.graphics.drawable.Drawable;

public class Food {

    private String mName;
    private Float mPrice;
    private int mStockRemaining;
    private FoodType mFoodType;
    private Drawable mImage;

    public Food(String name, Float price, int stockRemaining, FoodType foodType, Drawable image) {
        mName = name;
        mPrice = price;
        mStockRemaining = stockRemaining;
        mFoodType = foodType;
        mImage = image;
    }

    public enum FoodType {
        STEAK,
        CHICKEN
    }

}
