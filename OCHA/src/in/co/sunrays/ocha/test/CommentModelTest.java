package in.co.sunrays.ocha.test;

import in.co.sunrays.ocha.exception.ApplicationException;
import in.co.sunrays.ocha.exception.DuplicateRecordException;
import in.co.sunrays.ocha.model.CommentModel;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class CommentModelTest {

	public static CommentModel model = new CommentModel();

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

	public static void testAdd() throws DuplicateRecordException {

		try {
			// bean.setId(2L);
			model.setId(3l);
			model.setResourceId(2l);
			model.setText("Test");
			// model.setCreatedOn((new Timestamp(new Date().getTime())));

			long pk = model.add(model);
			System.out.println("Test add succ");
		} catch (ApplicationException e) {
			e.printStackTrace();
		}

	}

	public static void testDelete() {

		try {
			long pk = 1L;
			model.setId(pk);
			model.delete();
			System.out.println("Test Delete succ");

		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}

	public static void testUpdate() {

		try {
			model = model.findByPK(2L);
			model.setText("Demo");
			model.update();
			System.out.println("Test Update succ");

		} catch (ApplicationException e) {
			e.printStackTrace();
		}

	}

	public static void testFindByPK() {
		try {
			long pk = 3L;
			model = model.findByPK(pk);
			if (model == null) {
				System.out.println("Test Find By PK fail");
			}
			System.out.println(model.getId());
			System.out.println(model.getText());
			System.out.println(model.getResourceId());

		} catch (ApplicationException e) {
			e.printStackTrace();
		}

	}
	
	public static void testSearch() {
		try {
			List list = new ArrayList();
			model.setText("Demo");
			//bean.setAddress("borawan");
			list = model.search(model, 1, 10);
			if (list.size() < 0) {
				System.out.println("Test Search fail");
			}
			Iterator it = list.iterator();
			while (it.hasNext()) {
				model = (CommentModel) it.next();
				System.out.println(model.getId());
				System.out.println(model.getText());
				System.out.println(model.getResourceId());
				System.out.println(model.getCreatedOn());
			}
		} catch (ApplicationException e) {
			e.printStackTrace();
		}
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
				model = (CommentModel) it.next();
				System.out.println(model.getId());
				System.out.println(model.getText());
				System.out.println(model.getResourceId());
				System.out.println(model.getCreatedOn());
			}

		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}

}
