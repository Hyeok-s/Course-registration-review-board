package course;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
public class CourseDAO {
	private Connection conn; 
	private ResultSet rs;
	public CourseDAO() {
		try { 
			String dbURL =  "jdbc:mysql://localhost:3306/COURSE?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "1234567890";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; 
	}
		public int getNext() { 
			String SQL = "SELECT courseID FROM COURSE ORDER BY courseID DESC";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return rs.getInt(1) + 1;
				}
				return 1;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; 
		}

		public int write(String courseTitle, String userID, String courseContent) { 
			String SQL = "INSERT INTO COURSE VALUES(?, ?, ?, ?, ?, ?)";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext());
				pstmt.setString(2, courseTitle);
				pstmt.setString(3, userID);
				pstmt.setString(4, getDate());
				pstmt.setString(5, courseContent);
				pstmt.setInt(6,1);
				return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; 
	}

		public ArrayList<Course> getList(int pageNumber) {
			String SQL = "SELECT * FROM COURSE WHERE courseID < ? AND courseAvailable = 1 ORDER BY courseID DESC LIMIT 10";
			ArrayList<Course> list = new ArrayList<Course>();
			try { 
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext() - (pageNumber-1)*10);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Course course = new Course();
					course.setCourseID(rs.getInt(1));
					course.setCourseTitle(rs.getString(2));
					course.setUserID(rs.getString(3));
					course.setCourseDate(rs.getString(4));
					course.setCourseContent(rs.getString(5));
					course.setCourseAvailable(rs.getInt(6));
					list.add(course);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		public boolean nextPage(int pageNumber) {
			String SQL ="SELECT * FROM COURSE WHERE courseID < ? AND courseAvailable = 1 ORDER BY courseID DESC LIMIT 10";
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					return true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} 
			return false; 		
		}

		public Course getCourse(int courseID){
		String SQL ="SELECT * FROM COURSE WHERE courseID = ?";
		try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1, courseID);
		rs = pstmt.executeQuery();
		if (rs.next()) {
		Course course = new Course();
		course.setCourseID(rs.getInt(1));
		course.setCourseTitle(rs.getString(2));
		course.setUserID(rs.getString(3));
		course.setCourseDate(rs.getString(4));
		course.setCourseContent(rs.getString(5));
		course.setCourseAvailable(rs.getInt(6));
		return course;

		}
		} catch (Exception e) {
		e.printStackTrace();
		}
		return null;
		}
		public int update(int courseID, String courseTitle, String courseContent) {
		String SQL = "UPDATE COURSE SET courseTitle = ?, courseContent = ? WHERE courseID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, courseTitle);
			pstmt.setString(2, courseContent);
			pstmt.setInt(3, courseID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
		}

		public int delete(int courseID) {
			String SQL = "UPDATE COURSE SET courseAvailable = 0 WHERE courseID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, courseID);
				return pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}
			return -1;
		}		
}
