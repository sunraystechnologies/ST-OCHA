package in.co.sunrays.ocha.controller;

import in.co.sunrays.ocha.exception.ApplicationException;
import in.co.sunrays.ocha.model.AttendenceModel;
import in.co.sunrays.ocha.model.BranchModel;
import in.co.sunrays.ocha.model.CommentModel;
import in.co.sunrays.ocha.model.EResourceModel;
import in.co.sunrays.ocha.model.StudentModel;
import in.co.sunrays.ocha.model.SubjectModel;
import in.co.sunrays.ocha.model.UserModel;
import in.co.sunrays.util.DataUtility;
import in.co.sunrays.util.DataValidator;
import in.co.sunrays.util.PropertyReader;
import in.co.sunrays.util.ServletUtility;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

/**
 * Contains navigation logic for Comment Views.
 * 
 * @version 1.0
 * @since 01 Feb 2015
 * @author SUNRAYS Developer
 * @Copyright (c) sunRays Technologies. All rights reserved.
 * @URL www.sunrays.co.in
 */

public class AttendenceCtl extends BaseCtl {
	/**
	 * Logger to log the messages.
	 */
	private static Logger log = Logger.getLogger(AttendenceCtl.class);

	/**
	 * Loads pre-loaded data like Dropdown List.
	 */
	@Override
	protected void preload(HttpServletRequest request) {
		UserModel usermodel = new UserModel();
		BranchModel branchModel=new BranchModel();
		SubjectModel subjectModel=new SubjectModel();
		try {
			List userList = usermodel.studentlist();
			request.setAttribute("userList", userList);
			
			List branchList = branchModel.search(null);
			request.setAttribute("branchList", branchList);
			
			List subjectList = subjectModel.search(null);
			request.setAttribute("subjectList", subjectList);
		} catch (ApplicationException e) {
			log.error(e);
		}

	}
	/**
	 * Validates Input data
	 */
	@Override
	protected boolean validate(HttpServletRequest request) {
		
		log.debug("AttendenceCtl Method validate Started");
		String Attendancedate = request.getParameter("Attendancedate");
		boolean pass = true;

<<<<<<< HEAD
		if (DataValidator.isNull(request.getParameter("subject"))) {
			request.setAttribute("subject",
					PropertyReader.getValue("error.require", "subject"));
=======
		if (DataValidator.isNull(request.getParameter("subjectId"))) {
			request.setAttribute("subjectId", PropertyReader.getValue("error.require", "subject"));
>>>>>>> a85860ba8a491504b47a8134c301a4aed4b3191a
			pass = false;
		}
		if (DataValidator.isNull(request.getParameter("attendance"))) {
			request.setAttribute("attendance",
					PropertyReader.getValue("error.require", "attendance"));
			pass = false;
		}
		if (DataValidator.isNull(request.getParameter("studentId"))) {
			request.setAttribute("studentId",
					PropertyReader.getValue("error.require", "Student Name"));
			pass = false;
		}
		if (DataValidator.isNull(request.getParameter("branchId"))) {
			request.setAttribute("branchId", PropertyReader.getValue("error.require", "Branch Name"));
			pass = false;
		}
		if (DataValidator.isNull(request.getParameter("totalAttendance"))) {
			request.setAttribute("totalAttendance", PropertyReader.getValue("error.require", "Total Attendance"));
			pass = false;
		}
		if (DataValidator.isNull(Attendancedate)) {
			request.setAttribute("Attendancedate",
					PropertyReader.getValue("error.require", "Date Of Attendance"));
			pass = false;
		} else if (!DataValidator.isDate(Attendancedate)) {
			request.setAttribute("Attendancedate",
					PropertyReader.getValue("error.date", "Date Of Attendance"));
			pass = false;
		}

		
		log.debug("AttendenceCtl Method validate Ended");

		return pass;
		
	}
<<<<<<< HEAD

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
=======
	
	

>>>>>>> a85860ba8a491504b47a8134c301a4aed4b3191a
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("inn post");
		System.out.println(request.getParameter("studentId"));
		HttpSession session = request.getSession(true);
		AttendenceModel model=new AttendenceModel();
		model.setId(DataUtility.getLong(request.getParameter("id")));
<<<<<<< HEAD
		model.setSubject(DataUtility.getString(request.getParameter("subject")));
		model.setStudentId(DataUtility.getLong(request
				.getParameter("studentId")));
		model.setAttendence(DataUtility.getInt(request
				.getParameter("attendance")));
=======
		model.setSubjectId(DataUtility.getLong(request.getParameter("subjectId")));
		model.setStudentId(DataUtility.getLong(request.getParameter("studentId")));
		model.setAttendence(DataUtility.getInt(request.getParameter("attendance")));
		model.setCreatedOn(DataUtility.getDate(request.getParameter("Attendancedate")));
		model.setBranchId(DataUtility.getLong(request.getParameter("branchId")));
		model.setTotalAttendence(DataUtility.getInt(request.getParameter("totalAttendance")));
>>>>>>> a85860ba8a491504b47a8134c301a4aed4b3191a
		long id = DataUtility.getLong(request.getParameter("id"));

		String op = DataUtility.getString(request.getParameter("operation"));
		if (OP_SAVE.equalsIgnoreCase(op)) {
			try {
				if (id > 0) {
					model.update();
				} else {
					long pk = model.add();
					model.setId(pk);
				}

				ServletUtility.setModel(model, request);
				ServletUtility.setSuccessMessage("Data is successfully saved",
						request);

			} catch (ApplicationException e) {
				log.error(e);
				ServletUtility.handleException(e, request, response);
				return;
			} 
		} else if (OP_DELETE.equalsIgnoreCase(op)) {

			try {
				model.delete();
				ServletUtility.redirect(ORSView.ATTENDENCE_LIST_CTL, request,
						response);
				return;

			} catch (ApplicationException e) {
				log.error(e);
				ServletUtility.handleException(e, request, response);
				return;
			}

		} else if (OP_CANCEL.equalsIgnoreCase(op)) {

			ServletUtility.redirect(ORSView.ATTENDENCE_LIST_CTL, request,
					response);
			return;

		} else { // View page

			if (id > 0 || op != null) {

				try {
					model = model.findByPK(id);
					ServletUtility.setModel(model, request);
				} catch (ApplicationException e) {
					log.error(e);
					ServletUtility.handleException(e, request, response);
					return;
				}
			}
		}

		ServletUtility.forward(ORSView.ATTENDENCE_VIEW, request, response);
	}
	/**
	 * Returns View page of Controller.
	 */
	@Override
	protected String getView() {
		// TODO Auto-generated method stub
		return ORSView.ATTENDENCE_VIEW;
	}
}
