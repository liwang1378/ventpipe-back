drop table if exists building;
create table building
(
   uuid                 int(11) not null auto_increment comment '主键',
   code                 int(11) default NULL comment 'houseroom, basesystem,aircontainer表中的主键值',
   name                 varchar(20) default NULL comment '名称',
   type                 varchar(20) default NULL comment '类型（root: 顶级  house: 楼栋  wind1  新风   wind2 排风  room  房间
             cup 设备)',
   parentuuid           int(11) default NULL comment '父键',
   isfile               int(11) default NULL comment '是否父节点',
   customerid           int(11) comment '所属用户ID',
   orderseq             varchar(50) comment '排序字段',
   primary key (uuid)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

drop table if exists houseroom;
create table houseroom
(
   houseroomid          int(11) not null auto_increment,
   hsname               varchar(100) comment '楼栋名称、房间名称',
   type                 int comment '1. 楼栋     2 房间',
   address              varchar(100),
   parentid             int(11),
   customerid           int(11),
   primary key (houseroomid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

drop table if exists basesystem;
create table basesystem
(
   basesystemid         int(11) not null auto_increment,
   basename             varchar(100) comment '系统名称',
   remark               varchar(100) comment '备注说明',
   type                 int comment '类型(1. 新风系统  2  排风系统)',
   customerid           int(11),
   primary key (basesystemid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

drop table if exists aircontainer;
create table aircontainer
(
   aircontaierid        int(11) not null auto_increment comment '主键',
   customerid           int(11) comment '所属客户ID',
   type                 int comment '机柜类型(0.通风柜风速控制器   1.房间压差控制器   2.管道静压控制器)',
   address              varchar(20) comment '机柜地址(编号)',
   containername        varchar(100) default NULL comment '机柜名称',
   status               int default NULL comment '机柜状态(0 设备正常  1 设备故障 2 离线状态)',
   power                int comment '开机状态(0 关机   1 开机)--(如是管道静压则代表通道1)',
   power2               int comment '开机状态(0 关机   1 开机) --通道2',
   versioninfo          varchar(50) comment '协议版本',
   range_wind           int comment '传感器量程-风速',
   range_postion        int comment '传感器量程-移-位',
   range_red            int comment '传感 器量程-红外',
   range_temp           int comment '传感 器量程-温度',
   range_wet            int comment '传感 器量程-湿度',
   range_press          int comment '传感 器量程-压差',
   range_pind           int comment '传感器量程-管道1静压',
   range_pind2          int comment '传感器量程-管道2静压',
   control_wind_mode    int comment '通风柜风速控制-控制模式(0 正常模式   1 节能模式)',
   control_wind_normal  varchar(20) comment '通风柜风速控制-常规风速',
   control_wind_less    varchar(20) comment '通风柜风速控制-节能风速',
   control_press_mode   int comment '房间压差控制-方向(0：正压差   1 负 差)',
   control_press_sets   int comment '房间压差控制-预设值设定数量',
   control_press_setsvalueno int comment '房间压差控制-预设值选定值编号',
   control_press_setsvalue varchar(20) comment '房间压差控制-预设值选定值',
   control_press_value  varchar(20) comment '房间压差控制-预设值(| 分隔多个值)',
   control_pind_sets    int comment '管道静压控制-预设值设定数量',
   control_pind_setsvalue1no int comment '管道静压控制-预设值选定值编号-通道1',
   control_pind_setsvalue2no int comment '管道静压控制-预设值选定值编号-通道2',
   control_pind_setsvalue1 varchar(20) comment '管道静压控制-预设值选定值-通道1',
   control_pind_setsvalue2 varchar(20) comment '管道静压控制-预设值选定值-通道2',
   control_pind_value1  varchar(50) comment '管道静压控制-预设值-通道1(| 分隔多个值)',
   control_pind_value2  varchar(50) comment '管道静压控制预设值-通道2(| 分隔多个值)',
   online_wind_value    varchar(20) comment '通风柜在线状态-当前风速值',
   online_wind_door     varchar(20) comment '通风柜在线状态-当前门高值',
   online_wind_feel     int comment '通风柜在线状态-人体感应状态',
   online_press_door    int comment '房间压差在线状态-门开状态(0 门关闭  1表示门打开)',
   online_press_value   varchar(20) comment '房间压差在线状态-当前压差',
   online_press_temp    varchar(20) comment '房间压差在线状态-当前温度',
   online_press_wet     varchar(20) comment '房间压差在线状态-当前湿度',
   online_pind_value1   varchar(20) comment '管道静压在线状态-当前管道静压值(管道1)',
   online_pind_value2   varchar(20) comment '管道静压在线状态-当前管道静压值(管道2)',
   alert_switch         varchar(3) comment '告警开关
            对于通风柜控制器来说，格式如下
            Bit0：总开关
            Bit1：风速告警开关
            Bit2：门高告警开关
            对于房间压差控制器来说，格式如下
            Bit0：总开关
            Bit1：压差告警开关
            Bit2：门开告警开关
            对于管道静压控制器来说，格式如下
            Bit0：总开关
            Bit1：压力告警开',
   alert_para           varchar(20) comment '告警参数(参数间以 ｜ 分隔 )
            通风柜控制器告警参数
            [0:1] 风速低 告警阀值   保留2位小数点，传输时*100
            [2:3] 风速高 告警阀值   保留2位小数点，传输时*100
            [4:5] 门低 告警阀值   保留2位小数点，传输时*100
            [6:7] 门高 告警阀值   保留2位小数点，传输时*100
            房间压差控制器告警参数
            [0:1] 压力过低 告警阀值  保留2位小数点，传输时*100
            [2:3] 压力过高 告警阀值  保留2位小数点，传输时*100
            管道静压控制器告警参数
            [0:1] 通道1压力过低 告警阀值
            [2:3] 通道1压力过高 告警阀值
            [4:5] 通道2压力过低 告警阀值
            [6:7] 通道2压力过高 告警阀值',
   urgent_status        int comment '当前紧急排风状态(0表示关机 1表示开机)-若是管道静压则代表通道1',
   urgent_status2       char(10) comment '当前紧急排风状态(0表示关机 1表示开机)--通道2',
   relaystatus          varchar(20) comment '继电器状态(多个继电器状态排列 10',
   chooserelay          varchar(20) comment '选择继电器',
   ip_mode              int comment 'ip地址模式(0 DHCP  1 STATIC）',
   ipaddress            varchar(20) comment 'ip地址',
   ipmask               varchar(20) comment 'ip掩码',
   ipgate               varchar(20) comment 'ip网关',
   serverip             varchar(20) comment '服务器IP',
   serverport           varchar(20) comment '服务器端口',
   mac                  varchar(20) comment 'mac地址',
   keepalive            int comment '心跳间隔时间',
   menu_switch          int comment '菜单开关(0 关  1 开)',
   menu_pass            varchar(20) comment '菜单密码',
   event_rpt_intev      int comment '事件上报时间间隔',
   calader              varchar(20) comment '日历时间',
   pid1_p               varchar(20) comment 'PID1_P',
   pid1_i               varchar(20) comment 'PID1_I',
   pid1_d               varchar(20) comment 'PID1_D',
   pid1_period          int comment 'PID1-时间间隔',
   pid2_period          int comment 'PID2-时间间隔',
   pid2_p               varchar(20) comment 'PID2_P',
   pid2_i               varchar(20) comment 'PID2_I',
   pid2_d               varchar(20) comment 'PID2_D',
   primary key (aircontaierid)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

drop table if exists customer;
create table customer
(
   customerid           int(11) not null auto_increment,
   custname             varchar(100) comment '客户名称',
   telephone            varchar(20) comment '联系方式',
   period               varchar(20) comment '使用期限',
   activeflag           int comment '激活标志
             1. 激活状态
             2  非激活状态 ',
   primary key (customerid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

drop table if exists user;
create table user
(
   userid               int(11) not null auto_increment,
   loginname            varchar(50) comment '登录账户',
   password             varchar(50) comment '登产密码',
   username             varchar(50) comment '用户姓名',
   usertype             int comment '1：平台管理用户     2.：商业管理用户   3 ：商业其他用户',
   customerid           int(11) comment '客户ID',
   roleid               int(11) comment '角色ID',
   primary key (userid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

drop table if exists rolepermission;
create table rolepermission
(
   rolepermissionid     int(11) not null auto_increment,
   roleid               int(11),
   uuid                 int(11),
   customerid           int(11),
   primary key (rolepermissionid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

drop table if exists role;
create table role
(
   roleid               int(11) not null auto_increment,
   rolename             varchar(50) comment '角色名称',
   rolecode             char(10) comment '角色代码:  max',
   customerid           int(11) comment '所属客户ID',
   primary key (roleid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

drop table if exists command;
create table command
(
   cmdid                int(11) not null auto_increment comment '主键',
   customerid           int(11) comment '所属客户ID',
   cmd_datetime         varchar(50) comment '发布命令的日期时间',
   cmd_cat              int comment '命令大类',
   cmd_subcat           int comment '命令小类',
   cmd_state            int comment '命令状态(0 已处理   1 未处理)',
   type                 int comment '机柜类型(0.通风柜风速控制器   1.房间压差控制器   2.管道静压控制器)',
   address              varchar(20) comment '机柜地址(编号)',
   containername        varchar(100) default NULL comment '机柜名称',
   status               int default NULL comment '机柜状态(0 设备正常  1 设备故障)',
   power                int comment '开机状态(0 关机   1 开机)',
   power2               int,
   versioninfo          varchar(50) comment '协议版本',
   range_wind           int comment '传感器量程-风速',
   range_postion        int comment '传感器量程-移-位',
   range_red            int comment '传感 器量程-红外',
   range_temp           int comment '传感 器量程-温度',
   range_wet            int comment '传感 器量程-湿度',
   range_press          int comment '传感 器量程-压差',
   range_pind           int comment '传感器量程-管道1静压',
   range_pind2          char(10) comment '传感器量程-管道2静压',
   control_wind_mode    int comment '通风柜风速控制-控制模式(0 正常模式   1 节能模式)',
   control_wind_normal  varchar(20) comment '通风柜风速控制-常规风速',
   control_wind_less    varchar(20) comment '通风柜风速控制-节能风速',
   control_press_mode   int comment '房间压差控制-方向(0：正压差   1 负 差)',
   control_press_sets   int comment '房间压差控制-预设值设定数量',
   control_press_setsvalueno int comment '房间压差控制-预设值选定值编号',
   control_press_setsvalue varchar(20) comment '房间压差控制-预设值选定值',
   control_press_value  varchar(20) comment '房间压差控制-预设值(| 分隔多个值)',
   control_pind_sets    int comment '管道静压控制-预设值设定数量',
   control_pind_setsvalue1no int comment '管道静压控制-预设值选定值编号-通道1',
   control_pind_setsvalue2no int comment '管道静压控制-预设值选定值编号-通道2',
   control_pind_setsvalue1 varchar(20) comment '管道静压控制-预设值选定值-通道1',
   control_pind_setsvalue2 varchar(20) comment '管道静压控制-预设值选定值-通道2',
   control_pind1_value  varchar(20) comment '管道静压控制-预设值-通道1(| 分隔多个值)',
   control_pind2_value  varchar(20) comment '管道静压控制预设值-通道2(| 分隔多个值)',
   online_wind_value    varchar(20) comment '通风柜在线状态-当前风速值',
   online_wind_door     varchar(20) comment '通风柜在线状态-当前门高值',
   online_wind_feel     int comment '通风柜在线状态-人体感应状态',
   online_press_door    int comment '房间压差在线状态-门开状态(0 门关闭  1表示门打开)',
   online_press_value   varchar(20) comment '房间压差在线状态-当前压差',
   online_press_temp    varchar(20) comment '房间压差在线状态-当前温度',
   online_press_wet     varchar(20) comment '房间压差在线状态-当前湿度',
   online_pind_value1   varchar(20) comment '管道静压在线状态-当前管道静压值(管道1)',
   online_pind_value2   varchar(20) comment '管道静压在线状态-当前管道静压值(管道2)',
   alert_switch         varchar(3) comment '告警开关
            对于通风柜控制器来说，格式如下
            Bit0：总开关
            Bit1：风速告警开关
            Bit2：门高告警开关
            对于房间压差控制器来说，格式如下
            Bit0：总开关
            Bit1：压差告警开关
            Bit2：门开告警开关
            对于管道静压控制器来说，格式如下
            Bit0：总开关
            Bit1：压力告警开',
   alert_para           varchar(20) comment '告警参数
            通风柜控制器告警参数
            [0:1] 风速低 告警阀值   保留2位小数点，传输时*100
            [2:3] 风速高 告警阀值   保留2位小数点，传输时*100
            [4:5] 门低 告警阀值   保留2位小数点，传输时*100
            [6:7] 门高 告警阀值   保留2位小数点，传输时*100
            房间压差控制器告警参数
            [0:1] 压力过低 告警阀值  保留2位小数点，传输时*100
            [2:3] 压力过高 告警阀值  保留2位小数点，传输时*100
            管道静压控制器告警参数
            [0:1] 通道1压力过低 告警阀值
            [2:3] 通道1压力过高 告警阀值
            [4:5] 通道2压力过低 告警阀值
            [6:7] 通道2压力过高 告警阀值',
   urgent_status        int comment '当前紧急排风状态(0表示关机 1表示开机)',
   urgent_status2       int,
   relaystatus          varchar(20) comment '继电器状态',
   chooserelay          varchar(20) comment '选择继电器',
   ip_mode              int comment 'ip地址模式(0 DHCP  1 STATIC）',
   ipaddress            varchar(20) comment 'ip地址',
   ipmask               varchar(20) comment 'ip掩码',
   ipgate               varchar(20) comment 'ip网关',
   serverip             varchar(20) comment '服务器IP',
   serverport           varchar(20) comment '服务器端口',
   mac                  varchar(20) comment 'mac地址',
   keepalive            int comment '心跳间隔时间',
   menu_switch          int comment '菜单开关(0 关  1 开)',
   menu_pass            varchar(20) comment '菜单密码',
   event_rpt_intev      int comment '事件上报时间间隔',
   calader              varchar(20) comment '日历时间',
   pid1_p               varchar(20) comment 'PID1_P',
   pid1_i               varchar(20) comment 'PID1_I',
   pid1_d               varchar(20) comment 'PID1_D',
   pid1_period          int comment 'PID1-时间间隔',
   pid2_period          int comment 'PID2-时间间隔',
   pid2_i               varchar(20) comment 'PID2_I',
   pid2_d               varchar(20) comment 'PID2_D',
   responsecode         varchar(20) comment '命令响应代码',
   pid2_p               varchar(20) comment 'PID2_P',
   primary key (cmdid)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

drop table if exists aircontainer_history;
create table aircontainer_history
(
   historyid            int(11) not null auto_increment comment '主键',
   aircontaierid        int(11) not null comment '主键',
   customerid           int(11) comment '所属客户ID',
   type                 int comment '机柜类型(0.通风柜风速控制器   1.房间压差控制器   2.管道静压控制器)',
   address              varchar(20) comment '机柜地址(编号)',
   containername        varchar(100) default NULL comment '机柜名称',
   status               int default NULL comment '机柜状态(0 设备正常  1 设备故障)',
   power                int comment '开机状态(0 关机   1 开机)',
   power2               int,
   versioninfo          varchar(50) comment '协议版本',
   range_wind           int comment '传感器量程-风速',
   range_postion        int comment '传感器量程-移-位',
   range_red            int comment '传感 器量程-红外',
   range_temp           int comment '传感 器量程-温度',
   range_wet            int comment '传感 器量程-湿度',
   range_press          int comment '传感 器量程-压差',
   range_pind           int comment '传感器量程-管道1静压',
   range_pind2          int comment '传感器量程-管道2静压',
   control_wind_mode    int comment '通风柜风速控制-控制模式(0 正常模式   1 节能模式)',
   control_wind_normal  varchar(20) comment '通风柜风速控制-常规风速',
   control_wind_less    varchar(20) comment '通风柜风速控制-节能风速',
   control_press_mode   int comment '房间压差控制-方向(0：正压差   1 负 差)',
   control_press_sets   int comment '房间压差控制-预设值设定数量',
   control_press_setsvalueno int comment '房间压差控制-预设值选定值编号',
   control_press_setsvalue varchar(20) comment '房间压差控制-预设值选定值',
   control_press_value  varchar(20) comment '房间压差控制-预设值(| 分隔多个值)',
   control_pind_sets    int comment '管道静压控制-预设值设定数量',
   control_pind_setsvalue1no int comment '管道静压控制-预设值选定值编号-通道1',
   control_pind_setsvalue2no int comment '管道静压控制-预设值选定值编号-通道2',
   control_pind_setsvalue1 varchar(20) comment '管道静压控制-预设值选定值-通道1',
   control_pind_setsvalue2 varchar(20) comment '管道静压控制-预设值选定值-通道2',
   control_pind_value1  varchar(20) comment '管道静压控制-预设值-通道1(| 分隔多个值)',
   control_pind_value2  varchar(20) comment '管道静压控制预设值-通道2(| 分隔多个值)',
   online_wind_value    varchar(20) comment '通风柜在线状态-当前风速值',
   online_wind_door     varchar(20) comment '通风柜在线状态-当前门高值',
   online_wind_feel     int comment '通风柜在线状态-人体感应状态',
   online_press_door    int comment '房间压差在线状态-门开状态(0 门关闭  1表示门打开)',
   online_press_value   varchar(20) comment '房间压差在线状态-当前压差',
   online_press_temp    varchar(20) comment '房间压差在线状态-当前温度',
   online_press_wet     varchar(20) comment '房间压差在线状态-当前湿度',
   online_pind_value1   varchar(20) comment '管道静压在线状态-当前管道静压值(管道1)',
   online_pind_value2   varchar(20) comment '管道静压在线状态-当前管道静压值(管道2)',
   alert_switch         varchar(3) comment '告警开关
            对于通风柜控制器来说，格式如下
            Bit0：总开关
            Bit1：风速告警开关
            Bit2：门高告警开关
            对于房间压差控制器来说，格式如下
            Bit0：总开关
            Bit1：压差告警开关
            Bit2：门开告警开关
            对于管道静压控制器来说，格式如下
            Bit0：总开关
            Bit1：压力告警开',
   alert_para           varchar(20) comment '告警参数
            通风柜控制器告警参数
            [0:1] 风速低 告警阀值   保留2位小数点，传输时*100
            [2:3] 风速高 告警阀值   保留2位小数点，传输时*100
            [4:5] 门低 告警阀值   保留2位小数点，传输时*100
            [6:7] 门高 告警阀值   保留2位小数点，传输时*100
            房间压差控制器告警参数
            [0:1] 压力过低 告警阀值  保留2位小数点，传输时*100
            [2:3] 压力过高 告警阀值  保留2位小数点，传输时*100
            管道静压控制器告警参数
            [0:1] 通道1压力过低 告警阀值
            [2:3] 通道1压力过高 告警阀值
            [4:5] 通道2压力过低 告警阀值
            [6:7] 通道2压力过高 告警阀值',
   urgent_status        int comment '当前紧急排风状态(0表示关机 1表示开机)',
   urgent_status2       int,
   relaystatus          varchar(20) comment '继电器状态',
   chooserelay          varchar(20) comment '选择继电器',
   ip_mode              int comment 'ip地址模式(0 DHCP  1 STATIC）',
   ipaddress            varchar(20) comment 'ip地址',
   ipmask               varchar(20) comment 'ip掩码',
   ipgate               varchar(20) comment 'ip网关',
   serverip             varchar(20) comment '服务器IP',
   serverport           varchar(20) comment '服务器端口',
   mac                  varchar(20) comment 'mac地址',
   keepalive            int comment '心跳间隔时间',
   menu_switch          int comment '菜单开关(0 关  1 开)',
   menu_pass            varchar(20) comment '菜单密码',
   event_rpt_intev      int comment '事件上报时间间隔',
   calader              varchar(20) comment '日历时间',
   pid1_p               varchar(20) comment 'PID1_P',
   pid1_i               varchar(20) comment 'PID1_I',
   pid1_d               varchar(20) comment 'PID1_D',
   pid1_period          int comment 'PID1-时间间隔',
   pid2_period          int comment 'PID2-时间间隔',
   pid2_p               varchar(20) comment 'PID2_P',
   pid2_i               varchar(20) comment 'PID2_I',
   pid2_d               varchar(20) comment 'PID2_D',
   primary key (historyid)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;




