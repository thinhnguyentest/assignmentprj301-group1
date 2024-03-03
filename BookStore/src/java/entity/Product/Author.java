/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity.Product;

import dao.BookDAO;
import java.io.Serializable;
import java.sql.Date;



public class Author implements Serializable{
    private int id;
    private String name;
    private Date birthday;
    private String bio;
    
    public Author() {
    }

    public Author(int id) {
        this.id = id;
    }

    public Author(String name, Date birthday, String bio) {
        this.name = name;
        this.birthday = birthday;
        this.bio = bio;
    }

    public Author(int id, String name, Date birthday, String bio) {
        this.id = id;
        this.name = name;
        this.birthday = birthday;
        this.bio = bio;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    @Override
    public String toString() {
        return "Author{" + "id=" + id + ", name=" + name + ", birthday=" + birthday + ", bio=" + bio + '}';
    }
    
    public boolean addAuthor() {
        return BookDAO.addAuthor(this);
    }
    
    public boolean update() {
        return BookDAO.updateAuthor(this);
    }
    
    public boolean delete() {
        return BookDAO.deleteAuthor(this);
    }
}
