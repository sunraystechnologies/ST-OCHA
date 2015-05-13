package in.co.sunrays.common.controller;

import in.co.sunrays.common.model.BaseModel;
import in.co.sunrays.common.model.UserModel;
import in.co.sunrays.ocha.controller.ORSView;
import in.co.sunrays.ocha.exception.ApplicationException;
import in.co.sunrays.ocha.exception.RecordNotFoundException;
import in.co.sunrays.util.DataUtility;
import in.co.sunrays.util.DataValidator;
import in.co.sunrays.util.PropertyReader;
import in.co.sunrays.util.ServletUtility;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

/**
 * Change Password functionality Controller. Performs operation for Change
 * Password
 * 
 * @author SUNRAYS Technologies
 * @version 1.0
 * @Copyright (c) SUNRAYS Technologies
 */

public class ChangePasswordCtl extends BaseCtl {

	public static final String OP_CHANGE_MY_PROFILE = "Change My Profile";

	/**
	 * Logger to log the messages.
	 */
	private static Logger log = Logger.getLogger(ChangePasswordCtl.class);

	/**
	 * Validates Input data
	 */
	@Override
	protected boolean validate(HttpServletRequest request) {

		log.debug("ChangePasswordCtl Method validate Started");

		boolean pass = true;

		String op = request.getParameter("operation");

		if (OP_CHANGE_MY_PROFILE.equalsIgnoreCase(op)) {

			return pass;
		}
		if (DataValidator.isNull(request.getParameter("oldPassword"))) {
			request.setAttribute("oldPassword",
					PropertyReader.getValue("error.require", "Old Password"));
			pass = false;
		}
		if (DataValidator.isNull(request.getParameter("newPassword"))) {
			request.setAttribute("newPassword",
					PropertyReader.getValue("error.require", "New Password"));
			pass = false;
		}
		if (DataValidator.isNull(request.getParameter("confirmPassword"))) {
			request.setAttribute("confirmPassword", PropertyReader.getValue(
					"error.require", "Confirm Password"));
			pass = false;
		}
		if (!request.getParameter("newPassword").equals(
				request.getParameter("confirmPassword"))
				&& !"".equals(request.getParameter("confirmPassword"))) {
			ServletUtility.setErrorMessage(
					"New and confirm passwords not matched", request);

			pass = false;
		}

		log.debug("ChangePasswordCtl Method validate Ended");

		return pass;
	}

	@Override
	protected BaseModel populateModel(HttpServletRequest request) {
		log.debug("ChangePasswordCtl Method populatebean Started");

		UserModel model = new UserModel();

		model.setPassword(DataUtility.getString(request
				.getParameter("oldPassword")));

		model.setConfirmPassword(DataUtility.getString(request
				.getParameter("confirmPassword")));

		populateModel(model, request);

		log.debug("ChangePasswordCtl Method populatebean Ended");

		return model;
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ServletUtility.forwardView(ORSView.CHANGE_PASSWORD_VIEW, request,
				response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(true);

		log.debug("ChangePasswordCtl Method doGet Started");

		String op = DataUtility.getString(request.getParameter("operation"));

		// get model
		UserModel model = (UserModel) populateModel(request);

		UserModel sessionModel = (UserModel) session.getAttribute("user");

		String newPassword = (String) request.getParameter("newPassword");

		long id = sessionModel.getId();

		if (OP_SAVE.equalsIgnoreCase(op)) {
			System.out.println("in save " + newPassword);
			try {
				boolean flag = sessionModel.changePassword(id,
						model.getPassword(), newPassword);
				if (flag == true) {
					model = model.findByLogin(sessionModel.getLogin());
					session.setAttribute("user", model);
					ServletUtility.setModel(model, request);
					ServletUtility.setSuccessMessage(
							"Password has been changed Successfully.", request);
				}
			} catch (ApplicationException e) {
				log.error(e);
				ServletUtility.handleException(e, request, response);
				return;

			} catch (RecordNotFoundException e) {
				ServletUtility.setErrorMessage("Old PassWord is Invalid",
						request);
			}

		} else if (OP_CHANGE_MY_PROFILE.equalsIgnoreCase(op)) {
			ServletUtility.redirect(ORSView.MY_PROFILE_CTL, request, response);
			return;
		}

		ServletUtility.forwardView(ORSView.CHANGE_PASSWORD_VIEW, request,
				response);

		log.debug("ChangePasswordCtl Method doGet Ended");
	}

	@Override
	protected String getView() {
		return ORSView.CHANGE_PASSWORD_VIEW;
	}

}
