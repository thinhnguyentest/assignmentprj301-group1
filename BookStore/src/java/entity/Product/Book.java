package entity.Product;

import dao.BookDAO;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Book implements Serializable{

    private int id;
    private String title, genre, description;
    private int quantity;
    private float price;
    private Author author;
    private Publisher publisher;
    private String image;

    public Book() {
    }

    public Book(int id) {
        this.id = id;
    }

    public Book(int id, String title, String genre, String description, int quantity, float price, int AuthorId, int PublisherId) {
        this.id = id;
        this.title = title;
        this.genre = genre;
        this.description = description;
        this.quantity = quantity;
        this.price = price;
        this.author = BookDAO.getAuthor(AuthorId);
        this.publisher = BookDAO.getPublisher(PublisherId);
        this.image = BookDAO.getImages(id);
    }

    public Book(int id, String title, String genre, String description, int quantity, float price, Author author, Publisher publisher, String image) {
        this.id = id;
        this.title = title;
        this.genre = genre;
        this.description = description;
        this.quantity = quantity;
        this.price = price;
        this.author = author;
        this.publisher = publisher;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    public Publisher getPublisher() {
        return publisher;
    }

    public void setPublisher(Publisher publisher) {
        this.publisher = publisher;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "id=" + id + ", title=" + title + ", genre=" + genre + ", description=" + description + ", quantity=" + quantity + ", price=" + price + author + publisher + ", images=" + image + '}';
    }
    
    public boolean addBook() {
        return BookDAO.addBook(this) && BookDAO.addImage(this.getImage());
    }

    public boolean update() {
        return BookDAO.updateBook(this) && BookDAO.updateImage(this);
    }
    
    public boolean delete() {
        return BookDAO.deleteBook(this);
    }
}
