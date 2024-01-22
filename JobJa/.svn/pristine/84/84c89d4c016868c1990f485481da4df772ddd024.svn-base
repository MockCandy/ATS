package jobja.util.api.poi;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import org.jxls.common.Context;
import org.jxls.util.JxlsHelper;

public class JXLSTest {
	
	public static void main(String[] args) throws IOException {

	    List<Employee> employees = new ArrayList<>();
	    
	    for(int i = 0; i < 10; i++) {
	    	Employee employee = new Employee();
	    	employee.setEmpNo("E20231211"+i);
	    	employee.setName("손사원" + (i+1));
	    	employee.setDept("새발");;
	    	
	    	employees.add(employee);
	    }
	    
	    try(InputStream is = JXLSTest.class.getResourceAsStream("template.xlsx")) {
	        try (OutputStream os = new FileOutputStream("d:/temp/object_collection_output.xlsx")) {
	            Context context = new Context();
	            context.putVar("employees", employees);
	            JxlsHelper.getInstance().processTemplate(is, os, context);
	        }
	    }

	}
}
