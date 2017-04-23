package com.demo.util;

import cn.jpush.api.JPushClient;
import cn.jpush.api.common.resp.APIConnectionException;
import cn.jpush.api.common.resp.APIRequestException;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.Message;
import cn.jpush.api.push.model.Options;
import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.audience.AudienceTarget;
import cn.jpush.api.push.model.notification.Notification;

public class JPushService {
	
	public static String sendToOne(String name,String title){
		String masterSecret="cce4da2edfdc8bc425587ad3";
		String appKey="65236013b57925a496fd26c8";
		JPushClient jpushClient = new JPushClient(masterSecret, appKey, 3);
        PushPayload payload = PushPayload.newBuilder()
        .setPlatform(Platform.all())
        .setAudience(Audience.alias(name))
     //   .setNotification(Notification.alert("你好，有新的订单，请查看"))
        .setNotification(Notification.alert(title))
        .setMessage(Message.content("service"))
//        .setMessage(Message.content("cook"))
        .setOptions(Options.newBuilder()
        		.setApnsProduction(true)
                 .build())
        .build();

        try {
            PushResult result = jpushClient.sendPush(payload);
            System.out.println("推送结果："+result);

        } catch (APIConnectionException e) {

        } catch (APIRequestException e) {
        }

		return null;
	}
	
	public static void main(String[] args) {
		JPushService jp = new JPushService();
		jp.sendToOne(null,null);
	}

}
