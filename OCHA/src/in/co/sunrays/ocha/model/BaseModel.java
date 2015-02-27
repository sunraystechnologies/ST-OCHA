package in.co.sunrays.ocha.model;

import in.co.sunrays.ocha.bean.DropdownListBean;
import in.co.sunrays.ocha.exception.DatabaseException;
import in.co.sunrays.util.JDBCDataSource;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import org.apache.log4j.Logger;

public abstract class BaseModel implements Serializable, DropdownListBean,
		Comparable<BaseModel> {

	private static Logger log = Logger.getLogger(BaseModel.class);

	/**
	 * Non Business primary key
	 */
	protected long id;

	protected String createdBy;
	protected String modifiedBy;

	/**
	 * Contains Created Timestamp of database record
	 */
	protected Timestamp createdDatetime;

	/**
	 * Contains Modified Timestamp of database record
	 */
	protected Timestamp modifiedDatetime;

	/**
	 * accessor
	 */
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Timestamp getCreatedDatetime() {
		return createdDatetime;
	}

	public void setCreatedDatetime(Timestamp createdDatetime) {
		this.createdDatetime = createdDatetime;
	}

	public Timestamp getModifiedDatetime() {
		return modifiedDatetime;
	}

	public void setModifiedDatetime(Timestamp modifiedDatetime) {
		this.modifiedDatetime = modifiedDatetime;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	/**
	 * If ids are equal then objects are equal.
	 */
	public int compareTo(BaseModel next) {
		return (int) (id - next.getId());
	}

	/**
	 * Find next PK of comment
	 * 
	 * @throws DatabaseException
	 */

	public long nextPK() throws DatabaseException {
		log.debug("Model nextPK Started");
		Connection conn = null;
		long pk = 0;
		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn
					.prepareStatement("SELECT MAX(ID) FROM " + getTableName());
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

	public abstract String getTableName();

}
