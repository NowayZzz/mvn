package com.noway.rms.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.noway.rms.entity.PResource;
import com.noway.rms.service.PResourceService;
import com.noway.rms.web.controller.base.BaseController;

/**
 *
 * @author Noway
 * 创建时间 2017-01-10
 */
@Controller
@RequestMapping("/rms/resource")
public class PResourceController extends BaseController {

	@Autowired
	private PResourceService pResourceService;
	
	/**
	 * 进入资源管理页面
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String resource() {
		return "rms/resource_index";
	}

	/**
	 * 查询资源列表
	 * @param model
	 * @param response
	 * @param resourcename
	 * @param dept
	 */
	@RequestMapping(value = "/list")
	@ResponseBody
	public String resourceList() {
		List<PResource> list = pResourceService.getPResourceListTree("0");
		return jsonResult(list);
	}

	/**
	 * 创建资源页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/toadd")
	public String addResourcePage() {
		return "rms/resource_add";
	}
	
	
	@RequestMapping(value = "/getAllResource")
	@ResponseBody
	public String getAllResource() {
		List<PResource> puList = pResourceService.getPResourceListTree("0");
		PResource pr = new PResource();
		pr.setId("0");
		pr.setName("根节点");
		puList.add(0, pr);
		return JSONObject.toJSON(puList).toString().replaceAll("name", "text");
	}

	
	
	/**
	 * 创建资源
	 * 
	 * @param model
	 * @param response
	 * @param role
	 */
	@RequestMapping(value = "/add")
	@ResponseBody
	public String createResource(HttpServletResponse response,PResource pResource) {
		Wrapper<PResource> prw = new EntityWrapper<PResource>();
		prw.where("name={0}", pResource.getName());
		PResource pu = pResourceService.selectOne(prw);
		if (null != pu ) {
			return jsonResult(false, "资源已存在");
		}
		
		pResource.setState("1");
		boolean bool = pResourceService.insert(pResource);
		if(bool){
			return jsonResult(true, "新增资源成功");
		}else{
			return jsonResult(true, "新增资源失败");
		}
	}
	
	/**
	 * 资源页面
	 * @param model
	 * @param response
	 * @param resourcename
	 */
	@RequestMapping(value = "/toedit")
	public String updateResourcePage(Model model, String id) {
		model.addAttribute("id", id);
		return "rms/resource_edit";
	}
	
	/**
	 *获取编辑页面的资源数据 
	*/
	@RequestMapping(value = "/preedit")
	@ResponseBody
	public String updateResourcePage(String id) {
		return jsonResult(pResourceService.selectById(id));
		
	}
	
	/**
	 * 更新资源
	 * @param pResource
	 */
	@RequestMapping(value = "/update")
	@ResponseBody
	public String updateResource(PResource pResource) {
		try {
			pResourceService.updateById(pResource);
			return jsonResult(true, "更新成功");
		} catch (Exception e) {
			e.printStackTrace();
			return jsonResult(false, "更新资源失败");
		}
	}
	
}
