package com.demo.command;

import java.util.HashMap;
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
import com.demo.util.MapUtil;

@Controller
@RequestMapping("/command")
public class BaseCommand {
	@Autowired
	private BaseService baseService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private TableService tableService;
	@Autowired
	private MessageService messageService;
	
	@RequestMapping("/test")
	public String  testAction(HttpServletRequest request) throws Exception{
		System.out.println("===================command==testAction");
		return null;
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
		}else if("queryMenConf".equals(action)){
			//动态菜单
			System.out.println(" queryMenConf ");
			result = (HashMap) baseService.queryMenConf(parameter);
		}else if("getSession".equals(action)){
			//获取session里面的user对象
			System.out.println(" getSession ");
			HttpSession session = request.getSession();
	    	User user =(User) session.getAttribute("ACCOUNT");
	    	result.put("data", user);
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
		}else if("addType".equals(action)){
			//菜单类型添加
			System.out.println(" addType ");
			result = (HashMap) menuService.addType(parameter);
		}else if("deleteType".equals(action)){
			//菜单类型删除
			System.out.println(" deleteType ");
			result = (HashMap) menuService.deleteType(parameter);
		}else if("updateType".equals(action)){
			//菜单类型修改
			System.out.println(" updateType ");
			result = (HashMap) menuService.updateType(parameter);
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
		}else if("deleteTable".equals(action)){
			//座位删除
			System.out.println(" deleteTable ");
			result = (HashMap) tableService.deleteTable(parameter);
		}else if("queryBankTable".equals(action)){
			//可用座位查询 参数TIMESTR TYPE
			System.out.println(" queryBankTable ");
			result = (HashMap) tableService.queryBankTable(parameter);
		}else if("queryBankTableNow".equals(action)){
			//可用座位查询
			System.out.println(" queryBankTable ");
			result = (HashMap) tableService.queryBankTableNow(parameter);
		}else if("test".equals(action)){
			//messageService.insert(parameter);
			//result.put("data", messageService.query(parameter));
			parameter.put("ID", "1");
			parameter.put("IS_DELETE", "0");
			messageService.update(parameter);
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
		}else if("queryHistoryOrder".equals(action)){
			//历史订单查询
			System.out.println(" queryHistoryOrder ");
			result = (HashMap) orderService.queryHistoryOrder(parameter);
		}else if("queryDetail".equals(action)){
			//订单详情
			System.out.println(" queryDetail ");
			result = (HashMap) orderService.queryDetail(parameter);
		}else if("queryOrderCount".equals(action)){
			// 统计当年所有月份订单数目
			System.out.println(" queryOrderCount ");
			result = (HashMap) orderService.queryOrderCount(parameter);
		}else if("queryTotalPrice".equals(action)){
			//统计近5年销售情况
			System.out.println(" queryTotalPrice ");
			result = (HashMap) orderService.queryTotalPrice(parameter);
		}else if("queryTypePercent".equals(action)){
			//统计当月各类菜式销量占比
			System.out.println(" queryTypePercent ");
			result = (HashMap) orderService.queryTypePercent(parameter);
		}else{
			result.put("result", "error");
			result.put("msg", "无效参数");
		}
		return result;
	}
	
}
