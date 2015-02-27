package in.co.sunrays.ocha.model;

import in.co.sunrays.ocha.bean.DropdownListBean;

import java.io.Serializable;
import java.sql.Timestamp;

public abstract class BaseModel implements Serializable, DropdownListBean,
		Comparable<BaseModel> {

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
		return getValue().compareTo(next.getValue());
	}
}
