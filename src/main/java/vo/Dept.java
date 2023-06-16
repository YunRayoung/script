package vo;

public class Dept {

	private int id;
	private String name;
	private Emp manager;
	private Location location;
	
	public Dept() {}

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

	public Emp getManager() {
		return manager;
	}

	public void setManager(Emp manager) {
		this.manager = manager;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	
}
