package com.noway.rms.entity;

import com.noway.rms.entity.base.BaseEntity;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
/**
 *
 * @author Noway
 * 创建时间 2017-01-10
 */
@TableName("p_role")
public class PRole extends BaseEntity {

    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	private String name;
	/**
	 * 
	 */
	private String status;
	/**
	 * 
	 */
	private Integer sort;
	/**
	 * 
	 */
	private String beiz;


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getBeiz() {
		return beiz;
	}

	public void setBeiz(String beiz) {
		this.beiz = beiz;
	}

}
