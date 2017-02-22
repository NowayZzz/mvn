package com.noway.rms.entity;

import java.util.List;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.noway.rms.entity.base.BaseEntity;
/**
 *
 * @author Noway
 * 创建时间 2017-01-10
 */
@TableName("p_resource")
public class PResource extends BaseEntity {

    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableField(value="parent_id")
	private String parentId;
	/**
	 * 
	 */
	private String name;
	/**
	 * 
	 */
	private String component;
	/**
	 * 
	 */
	private String icon;
	/**
	 * 
	 */
	private String url;
	/**
	 * 
	 */
	private String urls;
	/**
	 * 
	 */
	@TableField(value="from_class")
	private String fromClass;
	/**
	 * 
	 */
	@TableField(value="resource_type")
	private String resourceType;
	/**
	 * 
	 */
	private Boolean leaf;
	/**
	 * 
	 */
	private Integer sort;
	/**
	 * 
	 */
	private String state;
	/**
	 * 
	 */
	private String beiz;

	@TableField(exist=false)
	private List<PResource> children;
	
	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getComponent() {
		return component;
	}

	public void setComponent(String component) {
		this.component = component;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUrls() {
		return urls;
	}

	public void setUrls(String urls) {
		this.urls = urls;
	}

	public String getFromClass() {
		return fromClass;
	}

	public void setFromClass(String fromClass) {
		this.fromClass = fromClass;
	}

	public String getResourceType() {
		return resourceType;
	}

	public void setResourceType(String resourceType) {
		this.resourceType = resourceType;
	}

	public Boolean isLeaf() {
		return leaf;
	}

	public void setLeaf(Boolean leaf) {
		this.leaf = leaf;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getBeiz() {
		return beiz;
	}

	public void setBeiz(String beiz) {
		this.beiz = beiz;
	}

	public List<PResource> getChildren() {
		return children;
	}

	public void setChildren(List<PResource> children) {
		this.children = children;
	}

}
