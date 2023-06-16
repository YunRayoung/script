package dao;

import java.util.List;

import util.DaoHelper;
import vo.Dept;
import vo.Emp;
import vo.Location;

public class HrDao {

	public List<Location> getLocations() {
		return DaoHelper.selectList("getLocations", rs -> {
			Location loc = new Location();
			loc.setId(rs.getInt("location_id"));
			loc.setCity(rs.getString("city"));
			return loc;
		});
	}
	
	public List<Dept> getAllDepts() {
		return DaoHelper.selectList("getAllDepts", rs -> {
			Dept dept = new Dept();
			dept.setId(rs.getInt("department_id"));
			dept.setName(rs.getString("department_name"));
			
			return dept;
		});
	}
	
	public List<Dept> getDeptsByLocId(int locId) {
		return DaoHelper.selectList("getDeptsByLocId", rs -> {
			Dept dept = new Dept();
			dept.setId(rs.getInt("department_id"));
			dept.setName(rs.getString("department_name"));
			
			return dept;
		}, locId);
	}
	
	public List<Emp> getAllEmps() {
		return DaoHelper.selectList("getAllEmps", rs -> {
			Emp emp = new Emp();
			emp.setId(rs.getInt("employee_id"));
			emp.setFirstName(rs.getString("first_name"));
			emp.setLastName(rs.getString("last_name"));
			emp.setEmail(rs.getString("email"));
			emp.setPhoneNumber(rs.getString("phone_number"));
			emp.setJobId(rs.getString("job_id"));
			emp.setSalary(rs.getDouble("salary"));
			
			return emp;
		});
	}

	public List<Emp> getEmpsByDeptId(int deptId) {
		return DaoHelper.selectList("getEmpsByDeptId", rs -> {
			Emp emp = new Emp();
			emp.setId(rs.getInt("employee_id"));
			emp.setFirstName(rs.getString("first_name"));
			emp.setLastName(rs.getString("last_name"));
			emp.setEmail(rs.getString("email"));
			emp.setPhoneNumber(rs.getString("phone_number"));
			emp.setJobId(rs.getString("job_id"));
			emp.setSalary(rs.getDouble("salary"));
			
			return emp;
		}, deptId);
	}
}
