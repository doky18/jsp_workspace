package emp.domain;

import lombok.Data;

@Data
public class Emp {
	private int empno;
	private String ename;
	private String job;
	private int mrg;
	private String hiredate;
	private int sal;
	private int comm;
	private Dept dept;
}
