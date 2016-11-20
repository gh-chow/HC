package com.lab.smart.core;

import java.util.HashMap;
import java.util.Map;

public class EventResult {

    public static final int CODE_SUCCESS = 200;
    public static final int CODE_FAILED = 500;
    private int code = CODE_SUCCESS;
    private String message = "";
    private Map<String, Object> attribute = new HashMap<String, Object>();

    public EventResult(int code) {
        this(code, null);
    }

    public EventResult() {
    }

    public EventResult(int code, String message) {
        setCode(code);
        setMessage(message);
    }

    public static final EventResult getEventResult() {
        return new EventResult();
    }
    public static final EventResult getEventResult(int code, String message) {
        return new EventResult(code, message);
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setAttribute(String key, Object value) {
        this.attribute.put(key, value);
    }

    public Object getAttribute(String key) {
        return this.getAttribute(key);
    }
}
