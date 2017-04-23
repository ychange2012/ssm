package com.demo.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.model.User;
import com.demo.service.BaseService;
import com.demo.service.MenuService;
import com.demo.service.MessageService;
import com.demo.service.OrderService;
import com.demo.service.TableService;
import com.demo.util.JPushService;
import com.demo.util.MapUtil;

@Controller
@RequestMapping("/api")
public class BaseApi {
	@Autowired
	private BaseService baseService;
	@Autowired
	private TableService tableService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private MessageService messageService;
	
	@RequestMapping(value="/loginCommand")  
	@ResponseBody
	public HashMap  loginAction(HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		HashMap parameter = MapUtil.requestToMap(request);
		HashMap result = new HashMap();
		String action = (String)parameter.get("ACTION");
		if("login".equals(action)){
			//登录
			System.out.println(" login ");
			result = (HashMap) baseService.login(parameter);
		}
		else
			result.put("result", "error");
		return result;
	}
	
	/**
	 * 用户模块
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/userAction")  
	@ResponseBody
	public Map userAction(HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		HashMap parameter = MapUtil.requestToMap(request);
		HashMap result = new HashMap();
		String action = (String)parameter.get("ACTION");
		if("register".equals(action)){
			//注册
			System.out.println(" register ");
			result = (HashMap) baseService.register(parameter);
		}else if("updatePassword".equals(action)){
			//修改 必要参数ID OLDPASSWORD NEWPASSWORD
			System.out.println(" updatePassword ");
			result = (HashMap) baseService.updatePassword(parameter);
		}else if("update".equals(action)){
			//修改个人信息 必要参数ID
			System.out.println(" update ");
			result = (HashMap) baseService.update(parameter);
		}else if("queryList".equals(action)){
			//人员列表
			System.out.println(" queryList ");
			result = (HashMap) baseService.queryList(parameter);
		}else{
			result.put("result", "error");
			result.put("msg", "无效参数");
		}
		return result;
	}
	
	/**
	 * 座位相关
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/tableAction")  
	@ResponseBody
	public Map tableAction(HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		HashMap parameter = MapUtil.requestToMap(request);
		HashMap result = new HashMap();
		String action = (String)parameter.get("ACTION");
		if("addTable".equals(action)){
			//座位添加
			System.out.println(" addTable ");
			result = (HashMap) tableService.addTable(parameter);
		}else if("updateTable".equals(action)){
			//座位修改
			System.out.println(" updateTable ");
			result = (HashMap) tableService.updateTable(parameter);
		}else if("queryTable".equals(action)){
			//座位查询
			System.out.println(" updateTable ");
			result = (HashMap) tableService.queryTable(parameter);
		}else if("queryBankTable".equals(action)){
			//可用座位查询 参数TIMESTR TYPE
			System.out.println(" queryBankTable ");
			result = (HashMap) tableService.queryBankTable(parameter);
		}else if("queryBankTableNow".equals(action)){
			//可用座位查询
			System.out.println(" queryBankTable ");
			result = (HashMap) tableService.queryBankTableNow(parameter);
		}else if("queryMessage".equals(action)){
			//未处理信息查询
			result.put("data", messageService.query(parameter));
		}else if("updateMessage".equals(action)){
			//未处理信息确认
			result=(HashMap) messageService.update(parameter);
		}else if("call".equals(action)){
			//呼叫服务员 TABLE_NAME TABLE_ID
			messageService.insert(parameter);
			Map tempParameter = new HashMap();
			tempParameter.put("FLAG", "2");
			Map temp = (HashMap) baseService.queryList(parameter);
			List<User> tempList = (List<User>) temp.get("data");
			for(int i =0;i<tempList.size();i++){
				JPushService.sendToOne(tempList.get(i).getAccount(), "桌子号："+parameter.get("TABLE_NAME")+"呼叫，请处理！");
			}
		}else{
			result.put("result", "error");
			result.put("msg", "无效参数");
		}
		return result;
	}
	
	/**
	 * 订单相关
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/orderAction")  
	@ResponseBody
	public Map orderAction(HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		HashMap parameter = MapUtil.requestToMap(request);
		HashMap result = new HashMap();
		String action = (String)parameter.get("ACTION");
		if("addOrder".equals(action)){
			//订单添加
			System.out.println(" addOrder ");
			orderService.addOrder(parameter);
			result.put("result", "ok");
			result.put("ref_id", parameter.get("id"));
		}else if("updateOrder".equals(action)){
			//订单修改
			System.out.println(" updateOrder ");
			result = (HashMap) orderService.updateOrder(parameter);
		}else if("addDetail".equals(action)){
			//订单详情添加
			System.out.println(" addDetail ");
			result = (HashMap) orderService.addOrderDetail(parameter);
			Map tempParameter = new HashMap();
			tempParameter.put("FLAG", "3");
			Map temp = (HashMap) baseService.queryList(parameter);
			List<User> tempList = (List<User>) temp.get("data");
			for(int i =0;i<tempList.size();i++){
				JPushService.sendToOne(tempList.get(i).getAccount(), "你好，有新的订单，请查看");
			}
		}else if("queryHistoryOrder".equals(action)){
			//历史订单查询
			System.out.println(" queryHistoryOrder ");
			result = (HashMap) orderService.queryHistoryOrder(parameter);
		}else if("queryDetail".equals(action)){
			//订单详情
			System.out.println(" queryDetail ");
			result = (HashMap) orderService.queryDetail(parameter);
		}else if("updateOrderDetail".equals(action)){
			//订单详情修改
			System.out.println(" updateOrderDetail ");
			result = (HashMap) orderService.updateOrderDetail(parameter);
		}else{
			result.put("result", "error");
			result.put("msg", "无效参数");
		}
		return result;
	}
	
	/**
	 * 菜单相关
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/menuAction")  
	@ResponseBody
	public Map menuAction(HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		HashMap parameter = MapUtil.requestToMap(request);
		HashMap result = new HashMap();
		String action = (String)parameter.get("ACTION");
		if("addMenu".equals(action)){
			//菜单添加
			System.out.println(" addMenu ");
			result = (HashMap) menuService.addMenu(parameter);
		}else if("updateMenu".equals(action)){
			//菜单修改
			System.out.println(" updateMenu ");
			result = (HashMap) menuService.updateMenu(parameter);
		}else if("queryMenu".equals(action)){
			//菜单查询
			System.out.println(" queryMenu ");
			result.put("data", menuService.queryMenu(parameter));
		}else if("queryList".equals(action)){
			//菜单列表
			System.out.println(" queryList ");
			result = (HashMap) menuService.queryList(parameter);
		}else if("queryTypeList".equals(action)){
			//菜单类型列表
			System.out.println(" queryTypeList ");
			result = (HashMap) menuService.queryType(parameter);
		}else{
			result.put("result", "error");
			result.put("msg", "无效参数");
		}
		return result;
	}
}
