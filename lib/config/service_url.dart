const serviceUrl = 'https://wxmini.baixingliangfan.cn/baixing/';
const servicePath = {
  'homePageContent': serviceUrl + 'wxmini/homePageContent', //商家首页信息
  'homePageBelowConten': serviceUrl + 'wxmini/homePageBelowConten', //商城首页热卖商品
  'getCategory': serviceUrl + 'wxmini/getCategory', //商品类别信息
  'getMallGoods': serviceUrl + 'wxmini/getMallGoods', //商品分类的商品列表
};

const myServiceUrl = 'http://49.234.103.109:18080/';
const myServicePath = {
  'index': myServiceUrl + 'index', //所有电影内容
  'floor': myServiceUrl + 'floor', //首页
  'selectMovie': myServiceUrl + 'selectMovie', //搜索电影
  'selectAllMovie': myServiceUrl + 'selectAllMovie', //全部电影
  'login': myServiceUrl + 'login', //登录
  'selectUser': myServiceUrl + 'selectUser' //查询用户信息
};
