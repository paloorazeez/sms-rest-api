package nbs.apps.com.rest.model;

import java.io.Serializable;

public class Image implements Serializable {

    private String data;

    private String name;

    public Image(String name, String data) {
        this.data = data;
        this.name = name;
    }

    public Image() {
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Image{" +
                "data='" + data + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
