package com.jetbrains.myapp;


public class Item {

    private String itemName;
    private int itemID;

    public Item(String name) {

        setItemName(name);
    }

    public void setItemName(String name){

        this.itemName = name;
    }

    public String getItemName(){

        return itemName;
    }
    public void setItemID(int id){

        this.itemID = id;
    }

    public int getItemID(){

        return itemID;
    }

}
