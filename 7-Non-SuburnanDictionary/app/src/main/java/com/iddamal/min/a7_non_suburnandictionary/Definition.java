package com.iddamal.min.a7_non_suburnandictionary;

public class Definition {

    private String searchTerm;
    private String definition;
    private int thumbsUp;
    private int thumbsDown;
    private String link;

    // Getters
    public String getSearchTerm() {
        return searchTerm;
    }

    public String getDefinition() {
        return definition;
    }

    public int getThumbsUp() {
        return thumbsUp;
    }

    public int getThumbsDown() {
        return thumbsDown;
    }

    public String getLink() {
        return link;
    }


    // Setters
    public void setSearchTerm(String searchTerm) {
        this.searchTerm = searchTerm;
    }

    public void setDefinition(String definition) {
        this.definition = definition;
    }


    public void setThumbsUp(int thumbsUp) {
        this.thumbsUp = thumbsUp;
    }


    public void setThumbsDown(int thumbsDown) {
        this.thumbsDown = thumbsDown;
    }

    public void setLink(String link) {
        this.link = link;
    }

    // Constructor
    public Definition(String definition, int thumbsUp, int thumbsDown, String link) {
        this.definition = definition;
        this.thumbsUp = thumbsUp;
        this.thumbsDown = thumbsDown;
        this.link = link;
    }
}
