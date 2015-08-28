//
//

#ifndef PocketKitchen_NetInterface_h
#define PocketKitchen_NetInterface_h



// 获取应用连接的IP
//#define HOSTIP_URL @"http://client.izhangchu.com/get-videoIP.html"


// 最新服务器
#define kHost_And_Port @"http://121.40.54.251:80"

//新服务器
//#define kHost_And_Port @"http://112.124.32.151:80"

//旧服务器
//#define kHost_And_Port @"http://42.121.13.106:80"



// 主界面菜单
/*
 page: 页码
 */
#define MAINMENU_URL kHost_And_Port@"/HandheldKitchen/api/more/tblcalendaralertinfo!getHomePage.do?phonetype=2&page=%ld&pageRecord=10&user_id=&is_traditional=0"


// 主界面日期数据
/*
 year：年
 month：月
 day：日
 */
#define MAINDATE_URL kHost_And_Port@"/HandheldKitchen/api/more/tblcalendaralertinfo!get.do?year=%@&month=%@&day=%@&page=1&pageRecord=1&is_traditional=0"




//菜品详情

//1.材料：
/*
 type: 材料1, 做法2, 相关常识4, 相宜相克3
 */
#define CAILIAO_URL kHost_And_Port@"/HandheldKitchen/api/vegetable/tblvegetable!getIntelligentChoice.do?vegetable_id=%@&type=%d&phonetype=0&is_traditional=0"




//智能选菜：
/*
 material_id：食材id组成的字符串（多个id以逗号隔开 拼接的字符串）
 page：当前页
 pageRecord：每页数量
*/
#define SMART_SEARCH_URL kHost_And_Port@"/HandheldKitchen/api/vegetable/tblvegetable!getChooseFood.do?material_id=%@&page=%d&pageRecord=%d&phonetype=0&user_id=&is_traditional=0"



//菜品详情：
/*
 vegetable_id：菜id
 */
#define COOKDETAILE_URL kHost_And_Port@"/HandheldKitchen/api/vegetable/tblvegetable!getTblVegetables.do?vegetable_id=%@&phonetype=2&user_id=&is_traditional=0"





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










#endif





