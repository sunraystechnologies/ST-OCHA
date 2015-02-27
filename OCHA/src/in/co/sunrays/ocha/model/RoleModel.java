package in.co.sunrays.ocha.model;

import in.co.sunrays.ocha.exception.ApplicationException;
import in.co.sunrays.ocha.exception.DatabaseException;
import in.co.sunrays.ocha.exception.DuplicateRecordException;
import in.co.sunrays.util.JDBCDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

/**
 * JDBC Implementation of Role Model
 * 
 * @author SUNRAYS Technologies
 * @version 1.0
 * @Copyright (c) SUNRAYS Technologies
 */
public class RoleModel extends BaseModel {

	private static Logger log = Logger.getLogger(RoleModel.class);

	/**
	 * Predefined Role constants
	 */
	public static final int ADMIN = 1;
	public static final int STUDENT = 2;
	public static final int STAFF = 3;
	public static final int KIOSK = 4;

	/**
	 * Role Name
	 */

	private String name;

	/**
	 * Role Description
	 */
	private String description;

	/**
	 * accessor
	 */

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getKey() {
		return id + "";
	}

	public String getValue() {
		return name;
	}

	/**
	 * Find next PK of Role
	 * 
	 * @throws DatabaseException
	 */
	public Integer nextPK() throws DatabaseException {
		log.debug("Model nextPK Started");
		Connection conn = null;
		int pk = 0;
		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn
					.prepareStatement("SELECT MAX(ID) FROM ST_ROLE");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				pk = rs.getInt(1);
			}
			rs.close();

		} catch (Exception e) {
			log.error("Database Exception..", e);
			throw new DatabaseException("Exception : Exception in getting PK");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model nextPK End");
		return pk + 1;
	}

	/**
	 * Add a Role
	 * 
	 * @param model
	 * @throws DatabaseException
	 * 
	 */
	public long add(RoleModel model) throws ApplicationException,
			DuplicateRecordException {
		log.debug("Model add Started");
		Connection conn = null;
		int pk = 0;

		RoleModel duplicataRole = findByName(model.getName());
		// Check if create Role already exist
		if (duplicataRole != null) {
			throw new DuplicateRecordException("Role already exists");
		}

		try {
			conn = JDBCDataSource.getConnection();
			pk = nextPK();
			// Get auto-generated next primary key
			System.out.println(pk + " in ModelJDBC");
			conn.setAutoCommit(false); // Begin transaction
			PreparedStatement pstmt = conn
					.prepareStatement("INSERT INTO ST_ROLE VALUES(?,?,?,?,?,?,?)");
			pstmt.setInt(1, pk);
			pstmt.setString(2, model.getName());
			pstmt.setString(3, model.getDescription());
			pstmt.setString(4, model.getCreatedBy());
			pstmt.setString(5, model.getModifiedBy());
			pstmt.setTimestamp(6, model.getCreatedDatetime());
			pstmt.setTimestamp(7, model.getModifiedDatetime());
			pstmt.executeUpdate();
			conn.commit(); // End transaction
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			log.error("Database Exception..", e);
			try {
				conn.rollback();
			} catch (Exception ex) {
				throw new ApplicationException(
						"Exception : add rollback exception " + ex.getMessage());
			}
			throw new ApplicationException("Exception : Exception in add Role");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model add End");
		return pk;
	}

	/**
	 * Delete a Role
	 * 
	 * @param model
	 * @throws DatabaseException
	 */
	public void delete(RoleModel model) throws ApplicationException {
		log.debug("Model delete Started");
		Connection conn = null;
		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false); // Begin transaction
			PreparedStatement pstmt = conn
					.prepareStatement("DELETE FROM ST_ROLE WHERE ID=?");
			pstmt.setLong(1, model.getId());
			pstmt.executeUpdate();
			conn.commit(); // End transaction
			pstmt.close();

		} catch (Exception e) {
			log.error("Database Exception..", e);
			try {
				conn.rollback();
			} catch (Exception ex) {
				throw new ApplicationException(
						"Exception : Delete rollback exception "
								+ ex.getMessage());
			}
			throw new ApplicationException(
					"Exception : Exception in delete Role");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model delete Started");
	}

	/**
	 * Find User by Role
	 * 
	 * @param name
	 *            : get parameter
	 * @return model
	 * @throws DatabaseException
	 */

	public RoleModel findByName(String name) throws ApplicationException {
		log.debug("Model findBy EmailId Started");
		StringBuffer sql = new StringBuffer(
				"SELECT * FROM ST_ROLE WHERE NAME=?");
		RoleModel model = null;
		Connection conn = null;
		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, name);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				model = new RoleModel();
				model.setId(rs.getLong(1));
				model.setName(rs.getString(2));
				model.setDescription(rs.getString(3));
				model.setCreatedBy(rs.getString(4));
				model.setModifiedBy(rs.getString(5));
				model.setCreatedDatetime(rs.getTimestamp(6));
				model.setModifiedDatetime(rs.getTimestamp(7));

			}
			rs.close();
		} catch (Exception e) {
			log.error("Database Exception..", e);
			throw new ApplicationException(
					"Exception : Exception in getting User by emailId");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model findBy EmailId End");
		return model;
	}

	/**
	 * Find Role by PK
	 * 
	 * @param pk
	 *            : get parameter
	 * @return model
	 * @throws DatabaseException
	 */

	public RoleModel findByPK(long pk) throws ApplicationException {
		log.debug("Model findByPK Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM ST_ROLE WHERE ID=?");
		RoleModel model = null;
		Connection conn = null;
		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setLong(1, pk);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				model = new RoleModel();
				model.setId(rs.getLong(1));
				model.setName(rs.getString(2));
				model.setDescription(rs.getString(3));
				model.setCreatedBy(rs.getString(4));
				model.setModifiedBy(rs.getString(5));
				model.setCreatedDatetime(rs.getTimestamp(6));
				model.setModifiedDatetime(rs.getTimestamp(7));
			}
			rs.close();
		} catch (Exception e) {
			log.error("Database Exception..", e);
			throw new ApplicationException(
					"Exception : Exception in getting User by pk");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model findByPK End");
		return model;
	}

	/**
	 * Update a Role
	 * 
	 * @param model
	 * @throws DatabaseException
	 */

	public void update(RoleModel model) throws ApplicationException,
			DuplicateRecordException {
		log.debug("Model update Started");
		Connection conn = null;

		RoleModel duplicataRole = findByName(model.getName());
		// Check if updated Role already exist
		if (duplicataRole != null && duplicataRole.getId() != model.getId()) {
			throw new DuplicateRecordException("Role already exists");
		}
		try {
			conn = JDBCDataSource.getConnection();

			conn.setAutoCommit(false); // Begin transaction
			PreparedStatement pstmt = conn
					.prepareStatement("UPDATE ST_ROLE SET NAME=?,DESCRIPTION=?,CREATED_BY=?,MODIFIED_BY=?,CREATED_DATETIME=?,MODIFIED_DATETIME=? WHERE ID=?");
			pstmt.setString(1, model.getName());
			pstmt.setString(2, model.getDescription());
			pstmt.setString(3, model.getCreatedBy());
			pstmt.setString(4, model.getModifiedBy());
			pstmt.setTimestamp(5, model.getCreatedDatetime());
			pstmt.setTimestamp(6, model.getModifiedDatetime());
			pstmt.setLong(7, model.getId());
			pstmt.executeUpdate();
			conn.commit(); // End transaction
			pstmt.close();
		} catch (Exception e) {
			log.error("Database Exception..", e);
			try {
				conn.rollback();
			} catch (Exception ex) {
				throw new ApplicationException(
						"Exception : Delete rollback exception "
								+ ex.getMessage());
			}
			throw new ApplicationException("Exception in updating Role ");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model update End");
	}

	/**
	 * Search Role
	 * 
	 * @param model
	 *            : Search Parameters
	 * @throws DatabaseException
	 */

	public List search(RoleModel model) throws ApplicationException {
		return search(model, 0, 0);
	}

	/**
	 * Search Role with pagination
	 * 
	 * @return list : List of Roles
	 * @param model
	 *            : Search Parameters
	 * @param pageNo
	 *            : Current Page No.
	 * @param pageSize
	 *            : Size of Page
	 * 
	 * @throws DatabaseException
	 */

	public List search(RoleModel model, int pageNo, int pageSize)
			throws ApplicationException {
		log.debug("Model search Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM ST_ROLE WHERE 1=1");

		if (model != null) {
			if (model.getId() > 0) {
				sql.append(" AND id = " + model.getId());
			}
			if (model.getName() != null && model.getName().length() > 0) {
				sql.append(" AND NAME like '" + model.getName() + "%'");
			}
			if (model.getDescription() != null
					&& model.getDescription().length() > 0) {
				sql.append(" AND DESCRIPTION like '" + model.getDescription()
						+ "%'");
			}

		}

		// if page size is greater than zero then apply pagination
		if (pageSize > 0) {
			// Calculate start record index
			pageNo = (pageNo - 1) * pageSize;

			sql.append(" Limit " + pageNo + ", " + pageSize);
			// sql.append(" limit " + pageNo + "," + pageSize);
		}

		ArrayList list = new ArrayList();
		Connection conn = null;
		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				model = new RoleModel();
				model.setId(rs.getLong(1));
				model.setName(rs.getString(2));
				model.setDescription(rs.getString(3));
				model.setCreatedBy(rs.getString(4));
				model.setModifiedBy(rs.getString(5));
				model.setCreatedDatetime(rs.getTimestamp(6));
				model.setModifiedDatetime(rs.getTimestamp(7));
				list.add(model);
			}
			rs.close();
		} catch (Exception e) {
			log.error("Database Exception..", e);
			throw new ApplicationException(
					"Exception : Exception in search Role");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		log.debug("Model search End");
		return list;
	}

	/**
	 * Get List of Role
	 * 
	 * @return list : List of Role
	 * @throws DatabaseException
	 */

	public List list() throws ApplicationException {
		return list(0, 0);
	}

	/**
	 * Get List of Role with pagination
	 * 
	 * @return list : List of Role
	 * @param pageNo
	 *            : Current Page No.
	 * @param pageSize
	 *            : Size of Page
	 * @throws DatabaseException
	 */

	public List list(int pageNo, int pageSize) throws ApplicationException {
		log.debug("Model list Started");
		ArrayList list = new ArrayList();
		StringBuffer sql = new StringBuffer("select * from ST_ROLE");
		// if page size is greater than zero then apply pagination
		if (pageSize > 0) {
			// Calculate start record index
			pageNo = (pageNo - 1) * pageSize;
			sql.append(" limit " + pageNo + "," + pageSize);
		}

		Connection conn = null;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				RoleModel model = new RoleModel();
				model.setId(rs.getLong(1));
				model.setName(rs.getString(2));
				model.setDescription(rs.getString(3));
				model.setCreatedBy(rs.getString(4));
				model.setModifiedBy(rs.getString(5));
				model.setCreatedDatetime(rs.getTimestamp(6));
				model.setModifiedDatetime(rs.getTimestamp(7));
				list.add(model);
			}
			rs.close();
		} catch (Exception e) {
			log.error("Database Exception..", e);
			throw new ApplicationException(
					"Exception : Exception in getting list of Role");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		log.debug("Model list End");
		return list;

	}


}