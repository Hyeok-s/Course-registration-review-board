package course;

public class Course {
	private int courseID;
	private String courseTitle;
	private String userID;
	private String courseDate;
	private String courseContent;
	private int courseAvailable;
	public int getCourseID() {
		return courseID;
	}
	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}
	public String getCourseTitle() {
		return courseTitle;
	}
	public void setCourseTitle(String courseTitle) {
		this.courseTitle = courseTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getCourseDate() {
		return courseDate;
	}
	public void setCourseDate(String courseDate) {
		this.courseDate = courseDate;
	}
	public String getCourseContent() {
		return courseContent;
	}
	public void setCourseContent(String courseContent) {
		this.courseContent = courseContent;
	}
	public int getCourseAvailable() {
		return courseAvailable;
	}
	public void setCourseAvailable(int courseAvailable) {
		this.courseAvailable = courseAvailable;
	}
	
}
