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
@TableName("p_role_resource")
public class PRoleResource extends BaseEntity {

    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableField(value="resource_id")
	private String resourceId;
	/**
	 * 
	 */
	@TableField(value="role_id")
	private String roleId;


	public String getResourceId() {
		return resourceId;
	}

	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

}
