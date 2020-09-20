/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.helper;

/**
 *
 * @author Bhatti
 */
public class Message {
    private  String content,type,cssclass;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCssclass() {
        return cssclass;
    }

    public void setCssclass(String cssclass) {
        this.cssclass = cssclass;
    }

    public Message() {
    }

    public Message(String content, String type, String cssclass) {
        this.content = content;
        this.type = type;
        this.cssclass = cssclass;
    }
    
}
