package ma.zs.generator.project.bean;

import javax.persistence.ManyToOne;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

@Entity
public class Message {

     @Id
     @GeneratedValue(strategy = GenerationType.AUTO)
     private Long id;

     private Boolean vu ;
     @JsonFormat(pattern="yyyy-MM-dd")
     @Temporal(TemporalType.DATE)
     private Date date ;
     private String content;
     @ManyToOne
	private User sender ;
     @ManyToOne
	private User receiver ;

     public Message(){
       super();
     }

     public Long getId(){
          return this.id;
     }
     public void setId(Long id){
          this.id = id;
     }
     public Date getDate(){
          return this.date;
     }
     public void setDate(Date date){
          this.date = date;
     }
     
    public User getSender() {
		return sender;
	}

	public void setSender(User sender) {
		this.sender = sender;
	}

	public User getReceiver() {
		return receiver;
	}

	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}

	public Boolean getVu() {
		return vu;
	}

	public Boolean isVu(){
          return this.vu;
     }
       public void setVu(Boolean vu){
          this.vu = vu;
     }

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}



}

