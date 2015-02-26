package in.co.sunrays.ocha.test;

import in.co.sunrays.ocha.exception.ApplicationException;
import in.co.sunrays.ocha.exception.DuplicateRecordException;
import in.co.sunrays.ocha.model.AttendenceModel;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class AttendenceModelTest {

	public static AttendenceModel model = new AttendenceModel();

	/**
	 * Main method to call test methods.
	 * 
	 * @param args
	 * @throws DuplicateRecordException
	 */
	public static void main(String[] args) throws DuplicateRecordException {
		// testAdd();
		//testDelete();
		//testUpdate();
		//testFindByPK();
		//testSearch();
		testList();

	}
	public static void testList() {

		try {
			List list = new ArrayList();
			list = model.list(1, 10);
			if (list.size() < 0) {
				System.out.println("Test list fail");
			}
			Iterator it = list.iterator();
			while (it.hasNext()) {
				model = (AttendenceModel) it.next();
				System.out.println(model.getId());
				System.out.println(model.getStudentName());

			}

		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}
}
