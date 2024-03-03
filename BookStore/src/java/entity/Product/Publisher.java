package entity.Product;

import dao.BookDAO;
import java.io.Serializable;
import java.sql.Date;

public class Publisher implements Serializable{
    private int PublisherId;
    private String PublisherName;
    private Date DateEstablished;

    public Publisher() {
    }

    public Publisher(int PublisherId) {
        this.PublisherId = PublisherId;
    }

    public Publisher(String PublisherName, Date DateEstablished) {
        this.PublisherName = PublisherName;
        this.DateEstablished = DateEstablished;
    }

    public Publisher(int PublisherId, String PublisherName, Date DateEstablished) {
        this.PublisherId = PublisherId;
        this.PublisherName = PublisherName;
        this.DateEstablished = DateEstablished;
    }

    public int getPublisherId() {
        return PublisherId;
    }

    public void setPublisherId(int PublisherId) {
        this.PublisherId = PublisherId;
    }
    
    public String getPublisherName() {
        return PublisherName;
    }

    public void setPublisherName(String PublisherName) {
        this.PublisherName = PublisherName;
    }

    public Date getDateEstablished() {
        return DateEstablished;
    }

    public void setDateEstablished(Date DateEstablished) {
        this.DateEstablished = DateEstablished;
    }

    @Override
    public String toString() {
        return "Publisher{" + "PublisherId=" + PublisherId + ", PublisherName=" + PublisherName + ", DateEstablished=" + DateEstablished + '}';
    }
    
    public boolean addPublisher(){
        return BookDAO.addPublisher(this);
    }
    
    public boolean update() {
        return BookDAO.updatePublisher(this);
    }
    
    public boolean delete() {
        return BookDAO.deletePublisher(this);
    }
}
