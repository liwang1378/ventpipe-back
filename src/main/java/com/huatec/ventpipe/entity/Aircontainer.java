package com.huatec.ventpipe.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;
import lombok.NoArgsConstructor;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

@NoArgsConstructor
@Data
@DynamicInsert
@DynamicUpdate
@Entity
@Table(name="aircontainer")
public class Aircontainer {
	
	private Integer uuid; //对应building 的主键  (用于查询数据)
	private Integer parentuuid; //对应building表的父节点
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer aircontaierid; // not null 主键
	private Integer customerid;
	private Integer type; // 机柜类型(0.通风柜风速控制器 1.房间压差控制器 2.管道静压控制器)
	private String containername; // default NULL 机柜名称
	private Integer status; // default NULL 机柜状态(0 设备正常 1 设备故障)
	private Integer power; // 开机状态(0 关机 1 开机)
	private Integer power2; // 开机状态(0 关机 1 开机) 管道2
	private String versioninfo; // 协议版本
	private String address; // 地址
	private Integer range_wind; // 风速传感器量程
	private Integer range_postion; // 移位传感器量程
	private Integer range_red; // 红外传感 器量程
	private Integer range_temp; // 温度传感 器量程
	private Integer range_wet; // 湿度传感 器量程
	private Integer range_press; // 压差传感 器量程
	private Integer range_pind; // 管道静压传感器量程
	private Integer range_pind2; // 管道静压传感器量程
	private Integer control_wind_mode; // 通风柜风速控制-控制模式(0 正常模式 1 节能模式)
	private String control_wind_normal; // 通风柜风速控制-常规风速
	private String control_wind_less; // 通风柜风速控制-节能风速

	private Integer control_press_mode; // 房间压差方向(0：正压差 1 负 差)
	private Integer control_press_sets; // 房间压差值设定数量
	private Integer control_press_setsvalueno; // 房间压差选定值
	private String control_press_setsvalue; // 房间压差选定值
	private String control_press_value; // 房间压差值设定值（多个， 以 | 分隔)

	private Integer control_pind_sets; // 管道静压值设定数量
	private Integer control_pind_setsvalue1no; // 管道静压选定值编号 -通道1
	private Integer control_pind_setsvalue2no; // 管道静压选定值编号 -通道2
	private String control_pind_setsvalue1; // 管道静压选定值 -通道1
	private String control_pind_setsvalue2; // 管道静压选定值 -通道2
	private String control_pind_value1; // 管道静值设定值-通道1
	private String control_pind_value2; // 管道静值设定值-通道2

	private Integer pid1_period; // PID1-时间间隔
	private String pid1_p; // PID1_P
	private String pid1_i; // PID1_I
	private String pid1_d; // PID1_D
	private Integer pid2_period; // PID2-时间间隔
	private String pid2_p; // PID2_P
	private String pid2_i; // PID2_I
	private String pid2_d; // PID2_D
	private Integer ip_mode; // ip地址模式(0 DHCP 1 STATIC）
	private String mac; // mac地址
	private String ipaddress; // ip地址
	private String ipmask; // ip掩码
	private String ipgate; // ip网关
	private String serverip; // 服务器IP
	private String serverport; // 服务器端口
	private Integer keepalive; // 心跳间隔时间
	private String alert_switch; //告警开关
	private String alert_para; // 告警参数
	private String calader; // 日历时间
	private Integer menu_switch; // 菜单开关(0 关 1 开)
	private String menu_pass; // 菜单密码
	private Integer event_rpt_intev; // 事件上报时间间隔
	private Integer online_status; // 控制器运行状态(0 正常 )
	private String online_wind_value; // 当前风速值
	private String online_wind_door; // 当前门高值
	private Integer online_wind_feel; // 人体感应状态
	private Integer online_press_door; // 门开状态(0 门关闭 1表示门打开)
	private String online_press_value; // 当前压差
	private String online_press_temp; // 当前温度
	private String online_press_wet; // 当前湿度
	private String online_pind_value1; // 当前管道静压值(管道1）
	private String online_pind_value2; // 当前管道静压值(管道2）
	private Integer urgent_status; // 当前紧急排风状态(0表示关机 1表示开机)
	private Integer urgent_status2; // 当前紧急排风状态(0表示关机 1表示开机) 管道2
	private String relaystatus; // 继电器状态

}
