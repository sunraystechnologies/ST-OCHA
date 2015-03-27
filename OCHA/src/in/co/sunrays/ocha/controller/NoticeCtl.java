package in.co.sunrays.ocha.controller;

import in.co.sunrays.ocha.exception.ApplicationException;
import in.co.sunrays.ocha.model.NoticeModel;
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

public class NoticeCtl extends BaseCtl {

	private static final long serialVersionUID = 1L;

	/**
	 * Logger to log the messages.
	 */
	private static Logger log = Logger.getLogger(NoticeCtl.class);

	@Override
	protected boolean validate(HttpServletRequest request) {
		
		log.debug("NoticeCtl Method validate Started");

		boolean pass = true;

		if (DataValidator.isNull(request.getParameter("subject"))) {
			request.setAttribute("subject", PropertyReader.getValue("error.require", "subject"));
			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("detail"))) {
			request.setAttribute("detail", PropertyReader.getValue("error.require", "detail"));
			pass = false;
		}if (DataValidator.isNull(request.getParameter("expireDate"))) {
			request.setAttribute("expireDate",
					PropertyReader.getValue("error.require", "expireDate"));
			pass = false;
		}
		
		log.debug("NoticeCtl Method validate Ended");

		return pass;
		
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		NoticeModel model=new NoticeModel();
		model.setId(DataUtility.getLong(request.getParameter("id")));
		model.setSubject(DataUtility.getString(request.getParameter("subject")));
		model.setDetails(DataUtility.getString(request.getParameter("detail")));
		model.setExpireDate(DataUtility.getDate(request.getParameter("expireDate")));
		//long cdt = DataUtility.getLong(request.getParameter("createdDatetime"));
		model.setCreatedOn(DataUtility.getCurrentTimestamp());
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
				ServletUtility.redirect(ORSView.NOTICE_LIST_CTL, request,
						response);
				return;

			} catch (ApplicationException e) {
				log.error(e);
				ServletUtility.handleException(e, request, response);
				return;
			}

		} else if (OP_CANCEL.equalsIgnoreCase(op)) {

			ServletUtility
					.redirect(ORSView.NOTICE_LIST_CTL, request, response);
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

		
		
		ServletUtility.forward(ORSView.NOTICE_VIEW, request, response);
	}

	@Override
	protected String getView() {
		// TODO Auto-generated method stub
		System.out.println("vieeeeeew");
		return ORSView.NOTICE_VIEW;
	}

}
