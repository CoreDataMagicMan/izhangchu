//
//  NetInterface.h
//  PocketKitchen
//
//  Created by qianfeng on 14-12-5.
//  Copyright (c) 2014年 千锋互联. All rights reserved.
//

#ifndef PocketKitchen_NetInterface_h
#define PocketKitchen_NetInterface_h


//新服务器
//#define kHost_And_Port @"http://112.124.32.151:8080"

//旧服务器
#define kHost_And_Port @"http://42.121.13.106:8080"



// 主界面菜单
#define kMain_Url kHost_And_Port@"/HandheldKitchen/api/more/tblcalendaralertinfo!getHomePage.do?phonetype=2&page=%d&pageRecord=10&user_id=%@&is_traditional=0"


// 主界面日期数据
/*
 year：年
 month：月
 day：日
 */
#define kMainDate_Url kHost_And_Port@"/HandheldKitchen/api/more/tblcalendaralertinfo!get.do?year=%@&month=%@&day=%@&page=1&pageRecord=1&is_traditional=0"




//菜品详情

//1.材料：
/*
 type: 材料1, 做法2, 相关常识4, 相宜相克3
 */
#define CAILIAO_URL kHost_And_Port@"/HandheldKitchen/api/vegetable/tblvegetable!getIntelligentChoice.do?vegetable_id=%@&type=%d&phonetype=0&is_traditional=0"




//收藏：
#define COOKBOOKPAGE_COLLECT_URL kHost_And_Port@"/HandheldKitchen/api/more/tblcollection!add.do?user_id=%@&vegetable_id=%@&is_traditional=0"


//评论：
#define COOKBOOKEVALUATE_CONTENT_URL kHost_And_Port@"/HandheldKitchen/api/vegetable/vegetableComment!getList.do?vegetableId=%@&page=%d"


//发表评论：
#define COOKBOOKEVALUATE_PUBLICCOMMENT_URL kHost_And_Port@"/HandheldKitchen/api/vegetable/vegetableComment!addVegeComment.do?vegetableId=%@&commentContent=%@&userId=%@"




//智能选菜：
/*
 material_id：食材id组成的字符串（多个id以逗号隔开 拼接的字符串）
 page：当前页
 pageRecord：每页数量
*/
#define SMART_SEARCH_URL kHost_And_Port@"/HandheldKitchen/api/vegetable/tblvegetable!getChooseFood.do?material_id=%@&page=%d&pageRecord=%d&phonetype=0&user_id=&is_traditional=0"


//搜索：
/* 
 name：搜索关键字
 child_catalog_name：中华菜系
 taste：口味
 fitting_crowd：适宜人群
 cooking_method：烹饪方法
 effect：功效
 page：当前搜索的第几页
 pageRecord：每页的数据条数
*/
#define SEARCH_URL kHost_And_Port@"/HandheldKitchen/api/vegetable/tblvegetable!getVegetableInfo.do?name=%@&child_catalog_name=%@&taste=%@&fitting_crowd=%@&cooking_method=%@&effect=%@&page=%d&pageRecord=%d&phonetype=0&user_id=&is_traditional=0"




/* ---------------------------------------------------------------------------------- */
/* ----------------------------      分割线      ------------------------------------- */
/* ---------------------------------------------------------------------------------- */

//对症治疗：
#define DUIZHENG_01_URL kHost_And_Port@"/HandheldKitchen/api/vegetable/tbloffice!getOffice.do?is_traditional=0"



//对症第二层(抽屉)：
/*
 officeId：第一层选择行对应的id
 */
#define DUIZHENG_02_URL kHost_And_Port@"/HandheldKitchen/api/vegetable/tbldisease!getDisease.do?officeId=%@&is_traditional=0"



//对症第三层(菜谱列表)：
/*
 diseaseId：第二层选择行 对应的id
 page：当前搜索的第几页
 pageRecord：每页的数据条数
 */
#define DUIZHENG_03_URL kHost_And_Port@"/HandheldKitchen/api/vegetable/tbldisease!getVegetable.do?diseaseId=%@&page=%d&pageRecord=%d&phonetype=0&is_traditional=0"


//菜谱详情：
/*
 vegetable_id：菜id
 */
#define COOKDETAILE_URL kHost_And_Port@"/HandheldKitchen/api/vegetable/tblvegetable!getTblVegetables.do?vegetable_id=%@&phonetype=2&user_id=&is_traditional=0"



//热门推荐：
//1.最新：
#define ZUIXIN_URL kHost_And_Port@"/HandheldKitchen/api/vegetable/tblvegetable!getNewTblVegetable.do?page=%d&pageRecord=%d&phonetype=0&user_id=&is_traditional=0"


//2.最热：
#define ZUIRE_URL kHost_And_Port@"/HandheldKitchen/api/vegetable/tblvegetable!getHotTblVegetable.do?page=%d&pageRecord=%d&phonetype=0&user_id=&is_traditional=0"




//食材大全
//左侧菜单
#define SHICAIDAQUAN_URL  kHost_And_Port@"/HandheldKitchen/api/more/tblmmaterialtype!getlMmaterialType.do?is_traditional=0"

//右侧菜单
#define  SHICAIDAQUAN_2_URL kHost_And_Port@"/HandheldKitchen/api/more/tblmmaterialtype!getMaterialList.do?materialTypeId=%d&page=1&pageRecord=10&is_traditional=0"

//食材大全-菜列表
#define  SHICAIDAQUAN_LIST_URL kHost_And_Port@"/HandheldKitchen/api/more/tblmmaterialtype!getVegetable.do?user_id=1&is_traditional=0&&page=%d&pageRecord=10&materialId=%d&phonetype=1"

//每月菜单:
//#define MEIYUECAIDAN_URL kHost_And_Port@"/HandheldKitchen/api/more/tblmonthlypopinfo!get.do?year=%@&month=%@&page=%d&phonetype=0&pageRecord=%d&user_id=&is_traditional=0"



//美女私房菜：
#define CELEBRITYPAGEINFO_URL kHost_And_Port@"/HandheldKitchen/api/vegetable/tblvegetablecooking!getCelebrityInfo.do?phonetype=2&is_traditional=0"

//私房菜详情列表：
#define  BEAUTYFOODRESULTLIST_URL kHost_And_Port@"/HandheldKitchen/api/vegetable/tblvegetable!getCelebrityVegeta.do?user_id=&vegetType=1&celebrityInfoId=%d&page=%d&pageRecord=10&phonetype=0&is_traditional=0"



//万道美食任你选：
//1.中间默认数据:
#define WANDAOMEISHI_URL kHost_And_Port@"/HandheldKitchen/api/vegetable/tblvegetable!getInfo.do?catalog_id=&page=%d&pageRecord=10&phonetype=0&user_id=&is_traditional=0"



//2.底部数据:
#define WANDAO_BOTTOM_TABBAR_URL kHost_And_Port@"/HandheldKitchen/api/vegetable/tblvegetablecatalog!get.do?page=1&pageRecord=10&phonetype=2&is_traditional=0"



//3.底部搜索
/*
 catalog_id：分类id
 */
#define WANDAO_BOTTOM_TABBAR_SEARCH_URL kHost_And_Port@"/HandheldKitchen/api/vegetable/tblvegetable!getInfo.do?catalog_id=%@&page=%d&pageRecord=8&phonetype=0&user_id=&is_traditional=0"




//登陆：
//email方式
#define APPLICATIONSETTING_LOGIN_EMAIL_URL kHost_And_Port@"/HandheldKitchen/api/users/tbluser!login.do?email=%@&password=%@&is_traditional=0"

//电话号码方式
#define APPLICATIONSETTING_LOGIN_PHONENUMBER_URL kHost_And_Port@"/HandheldKitchen/api/users/tbluser!login.do?phoneNumber=%@&password=%@&is_traditional=0"



//注册：
//email方式
#define APPLICATIONSETTINH_SIGN_EMAIL_URL kHost_And_Port@"/HandheldKitchen/api/users/tbluser!register.do?username=%@&password=%@&email=%@&is_traditional=0&channel=m360"

//电话号码方式
#define APPLICATIONSETTINH_SIGN_PHONENUMBER_URL kHost_And_Port@"/HandheldKitchen/api/users/tbluser!register.do?username=%@&password=%@&phoneNumber=%@&is_traditional=0&channel=m360"



//获取收藏
#define APPLICATIONCOLLECT_DISPLAY_URL kHost_And_Port@"/HandheldKitchen/api/more/tblcollection!getList.do?user_id=%@&page=%d&pageRecord=%d&is_traditional=0&phonetype=0"


//删除收藏：
#define APPLICATIONCOLLECT_DELETE_URL kHost_And_Port@"/HandheldKitchen/api/more/tblcollection!delete.do?user_id=%@&vegetable_id=%@&is_traditional=0"





#endif





