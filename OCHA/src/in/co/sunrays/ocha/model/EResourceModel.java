package in.co.sunrays.ocha.model;

import in.co.sunrays.ocha.exception.ApplicationException;
import in.co.sunrays.util.JDBCDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;

public class EResourceModel extends BaseModel {

	private static Logger log = Logger.getLogger(EResourceModel.class);

	private String name = null;
	private String detail = null;
	private String tablesContains = null;
	private Timestamp createdOn = null;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getTablesContains() {
		return tablesContains;
	}

	public void setTablesContains(String tablesContains) {
		this.tablesContains = tablesContains;
	}

	public Timestamp getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}

	public long add() throws ApplicationException {

		log.debug("Model add Started");

		Connection conn = null;
		long pk = 0;

		try {
			conn = JDBCDataSource.getConnection();
			pk = nextPK();
			// Get auto-generated next primary key
			conn.setAutoCommit(false); // Begin transaction

			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO "
					+ getTableName() + " VALUES(?,?,?,?,?)");
			pstmt.setLong(1, pk);
			pstmt.setString(2, tablesContains);
			pstmt.setString(3, name);
			pstmt.setString(4, detail);
			java.util.Date date = new Date();
			pstmt.setTimestamp(5, new java.sql.Timestamp(date.getTime()));
			pstmt.executeUpdate();
			conn.commit(); // End transaction
			pstmt.close();

		} catch (Exception e) {
			log.error("Database Exception..", e);
			try {
				conn.rollback();
			} catch (Exception ex) {
				ex.printStackTrace();
				throw new ApplicationException(
						"Exception : add rollback exception " + ex.getMessage());
			}
			throw new ApplicationException(
					"Exception : Exception in add College");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model add End");
		return pk;
	}

	public void delete() throws ApplicationException {
		log.debug("Model delete Started");
		Connection conn = null;
		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false); // Begin transaction
			PreparedStatement pstmt = conn.prepareStatement("DELETE FROM "
					+ getTableName() + " WHERE ID=?");
			pstmt.setLong(1, id);
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
					"Exception : Exception in delete comment");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model delete Started");
	}

	public EResourceModel findByPK(long pk) throws ApplicationException {
		log.debug("Model findByPK Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM " + getTableName()
				+ " WHERE ID=?");
		EResourceModel model = null;
		Connection conn = null;
		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setLong(1, pk);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				model = new EResourceModel();
				model.setId(rs.getLong(1));
				model.setTablesContains(rs.getString(2));
				model.setName(rs.getString(3));
				model.setDetail(rs.getString(4));
				model.setCreatedOn(rs.getTimestamp(5));

			}
			rs.close();
		} catch (Exception e) {
			log.error("Database Exception..", e);
			throw new ApplicationException(
					"Exception : Exception in getting EResource by PK");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model findByName End");
		return model;
	}

	public void update() throws ApplicationException {
		log.debug("Model update Started");
		Connection conn = null;

		try {

			conn = JDBCDataSource.getConnection();

			conn.setAutoCommit(false); // Begin transaction
			PreparedStatement pstmt = conn.prepareStatement("UPDATE "
					+ getTableName()
					+ " SET TABLE_CONTAINS=?,NAME=?,DETAIL=? WHERE ID=?");
			pstmt.setString(1, tablesContains);
			pstmt.setString(2, name);
			pstmt.setString(3, detail);
			pstmt.setLong(4, id);
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
			throw new ApplicationException("Exception in updating Comment ");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model update End");
	}

	public List search(EResourceModel model, int pageNo, int pageSize)
			throws ApplicationException {
		log.debug("Model search Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM " + getTableName()
				+ " WHERE 1=1");

		if (model != null) {
			if (id > 0) {
				sql.append(" AND id = " + id);
			}
			if (tablesContains != null && tablesContains.length() > 0) {
				sql.append(" AND TABLE_CONTAINS like '" + tablesContains + "%'");
			}
			if (name != null && name.length() > 0) {
				sql.append(" AND NAME like '" + name + "%'");
			}
			if (detail != null && detail.length() > 0) {
				sql.append(" AND DETAIL like '" + detail + "%'");
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
				model = new EResourceModel();
				model.setId(rs.getLong(1));
				model.setTablesContains(rs.getString(2));
				model.setName(rs.getString(3));
				model.setDetail(rs.getString(4));
				model.setCreatedOn(rs.getTimestamp(5));
				list.add(model);
			}
			rs.close();
		} catch (Exception e) {
			log.error("Database Exception..", e);
			throw new ApplicationException(
					"Exception : Exception in search Comment");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		log.debug("Model search End");
		return list;
	}

	public List search(EResourceModel model) throws ApplicationException {
		return search(model, 0, 0);
	}

	@Override
	public String getKey() {
		return id + "";
	}

	@Override
	public String getValue() {
		return name;
	}

	@Override
	public String getTableName() {
		return "ST_EResource";
	}

}
