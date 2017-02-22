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
@TableName("p_user_role")
public class PUserRole extends BaseEntity {

    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableField(value="user_id")
	private String userId;
	/**
	 * 
	 */
	@TableField(value="role_id")
	private String roleId;

	@TableField(exist=false)
	private String roleName;
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

}
