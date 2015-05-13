package in.co.sunrays.ocha.controller;

import in.co.sunrays.common.controller.BaseCtl;
import in.co.sunrays.common.model.BaseModel;
import in.co.sunrays.ocha.exception.ApplicationException;
import in.co.sunrays.ocha.model.AppRole;
import in.co.sunrays.ocha.model.StudentModel;
import in.co.sunrays.ocha.model.TimeTableModel;
import in.co.sunrays.util.AccessUtility;
import in.co.sunrays.util.DataUtility;
import in.co.sunrays.util.DataValidator;
import in.co.sunrays.util.PropertyReader;
import in.co.sunrays.util.ServletUtility;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
public class TimeTableCtl extends BaseCtl {

	private static final long serialVersionUID = 1L;
	private static Logger log = Logger.getLogger(TimeTableCtl.class);

	@Override
	protected boolean validate(HttpServletRequest request) {
		log.debug("TimetableCtl Method validate Started");
		boolean pass = true;

		if (DataValidator.isNull(request.getParameter("date"))) {
			request.setAttribute("error.date",
					PropertyReader.getValue("error.require", "Date"));
			pass = false;
		}
		if (DataValidator.isNull(request.getParameter("faculty"))) {
			request.setAttribute("error.faculty",
					PropertyReader.getValue("error.require", "Faculty"));
			pass = false;
		}
		if (DataValidator.isNull(request.getParameter("semester"))) {
			request.setAttribute("error.semester",
					PropertyReader.getValue("error.require", "Semester"));
			pass = false;
		}
		if (DataValidator.isNull(request.getParameter("year"))) {
			request.setAttribute("error.year",
					PropertyReader.getValue("error.require", "Year"));
			pass = false;
		}
		if (DataValidator.isNull(request.getParameter("branch"))) {
			request.setAttribute("error.branch",
					PropertyReader.getValue("error.require", "Branch"));
			pass = false;
		}
		if (DataValidator.isNull(request.getParameter("subject"))) {
			request.setAttribute("error.subject",
					PropertyReader.getValue("error.require", "Subject"));
			pass = false;
		}
		if (DataValidator.isNull(request.getParameter("time"))) {
			request.setAttribute("error.fromTime",
					PropertyReader.getValue("error.require", "Time"));
			pass = false;
		}
		log.debug("TimetableCtl Method validate Ended");
		return pass;
	}

	@Override
	protected BaseModel populateModel(HttpServletRequest request) {
		log.debug("TimetableCtl Method populatebean Started");
		TimeTableModel model = new TimeTableModel();
		model.setId(DataUtility.getLong(request.getParameter("id")));
		model.setDate(DataUtility.getDate(request.getParameter("date")));
		model.setSemester(DataUtility.getInt(request.getParameter("semester")));
		model.setYear(DataUtility.getInt(request.getParameter("year")));
		model.setBranch(DataUtility.getString(request.getParameter("branch")));
		model.setSubject(DataUtility.getString(request.getParameter("subject")));
		model.setTime(DataUtility.getString(request.getParameter("time")));
		populateModel(model, request);
		
		log.debug("TimetableCtl Method populatebean End");
		return model;
	}
	/**
	 * Contains Display Logic
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Long id = DataUtility.getLong(request.getParameter("id"));

		TimeTableModel model = new TimeTableModel();

		if (id > 0) {
			try {
				model = model.findByPK(id);
				ServletUtility.setModel(model, request);
			} catch (ApplicationException e) {
				ServletUtility.handleException(e, request, response);
				return;
			}
		}
		ServletUtility.forwardView(ORSView.TIMETABLE_VIEW, request, response);
	}


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		log.debug("TimetableCtl Method doGet Started");

		String op = DataUtility.getString(request.getParameter("operation"));

		// get model
		TimeTableModel model = (TimeTableModel) populateModel(request);

		long id = model.getId();

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
				ServletUtility.redirect(ORSView.TIMETABLE_LIST_CTL, request,
						response);
				return;
			} catch (ApplicationException e) {
				log.error(e);
				ServletUtility.handleException(e, request, response);
				return;
			}
		} else {
			if (id > 0 || op != null) {
				TimeTableModel model1;
				try {
					model1 = model.findByPK(id);
					ServletUtility.setModel(model1, request);
				} catch (ApplicationException e) {

					ServletUtility.handleException(e, request, response);
					return;
				}
			}
		}
		ServletUtility.forwardView(ORSView.TIMETABLE_VIEW, request, response);
		log.debug("TimetableCtl Method doGet Ended");
	}
	
	
	@Override
	protected String getView() {
		return ORSView.TIMETABLE_VIEW;
	}
	@Override
	protected void setAccess(HttpServletRequest request) {
		super.setAccess(request);
		AccessUtility.setAddAccess(""+ AppRole.ADMIN,
				request);
		AccessUtility.setWriteAccess(""+ AppRole.ADMIN,
				request);
	}

}
