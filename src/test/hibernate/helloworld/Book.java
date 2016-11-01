package hibernate.helloworld;



public class Book {

	private Integer bookno;
	private String name;
	private Float price;

	public Book() {
		super();
	}

	public Book(String name, Float price) {
		super();
		this.name = name;
		this.price = price;
	}

	public Integer getBookno() {
		return bookno;
	}

	public void setBookno(Integer bookno) {
		this.bookno = bookno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Float getPrice() {
		return price;
	}
	
	public void setPrice(Float price) {
		this.price = price;
	}



	@Override
	public String toString() {
		return "Book [bookno=" + bookno + ", name=" + name + ", price=" + price
				+ "]";
	}

}
