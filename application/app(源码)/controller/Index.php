<?php
/**
 * Created by PhpStorm.
 * User: 835173372@qq.com
 * NickName: 半城村落
 * Date: 2016/11/2 10:42
 */
namespace app\app\controller;

use think\Db;
use think\Log;

class Index extends Base
{
    //首页数据
    public function index()
    {

        $ads1_list = Db::name("app_ads")->alias("a")->join("admin_upload b", "a.cover=b.id")->field("a.*,b.url")->where("a.group_id=1")->select();
        $ads2_list = Db::name("app_ads")->alias("a")->join("admin_upload b", "a.cover=b.id")->field("a.*,b.url")->where("a.group_id=2")->select();
        $goods_lsit = Db::name("goods_info")->alias('a')
            ->join("goods_gallery b", "a.id=b.info_id", 'LEFT')
            ->join("admin_upload c", "b.cover = c.id", 'LEFT')
            ->where("a.putway=1")//上架状态
            ->field("a.id,a.goods_name,a.cate_id,a.price,a.costprice,b.cover,c.url")
            ->group("a.id")
            ->order("a.id desc")
            ->limit(50)
            ->select();
        $data['ads1_list'] = $ads1_list;
        $data['ads2_list'] = $ads2_list;
        $data['goods_list'] = $goods_lsit;
        ajaxmsg('ok', 0, $data);
    }

    //商品分类
    public function cate_list()
    {
        $cate_list = Db::name("goods_category")->where("pid=0")->order("id")->select();
        foreach ($cate_list as $k => $v) {
            $count = Db::name("goods_category")->where("pid={$v['id']}")->count();
            if (!$count) {
                unset($cate_list[$k]);
            }
        }
        sort($cate_list);//重新排序
        ajaxmsg('ok', 1, $cate_list);
    }

    //商品子分类
    public function children_cate_list()
    {
        $cate_id = input("request.cate_id");
        $cate_list = Db::name("goods_category")->alias("a")
            ->join("admin_upload b", "a.cover=b.id", "LEFT")
            ->field("a.*,b.url")
            ->where("a.pid={$cate_id}")->order("a.id")->select();
        ajaxmsg('ok', 1, $cate_list);
    }

    //分类商品
    public function cate_goodslist()
    {
        $map = array();
        $keywords = trim(input("request.keywords", ''));
        $cate_id = input("request.cate_id");
        $is_new = input("request.is_new");
        $is_rec = input("request.is_rec");
        $is_hot = input("request.is_hot");
        $map["a.putway"] = 1;//上架状态
        if ($keywords) {
            $map['a.goods_name|a.keyword|a.content'] = ['like', "%$keywords%"];
        }
        if ($cate_id > 0) {
            $map['a.cate_id'] = $cate_id;
        }
        if ($is_new > 0) {
            $map['a.is_new'] = $is_new;
        }
        if ($is_rec > 0) {
            $map['a.is_rec'] = $is_rec;
        }
        if ($is_hot > 0) {
            $map['a.is_hot'] = $is_hot;
        }
        $list = Db::name("goods_info")
            ->alias('a')
            ->join("goods_gallery b", "a.id=b.info_id", 'LEFT')
            ->join("admin_upload c", "b.cover = c.id", 'LEFT')
            ->where($map)
            ->group("a.id")
            ->order("a.id desc")
            ->field("a.id,a.goods_name,a.sku,a.cate_id,a.unit_id,a.keyword,a.is_new,a.is_hot,a.is_rec,a.price,a.costprice,a.fenxiao_rate,a.daili_rate,c.url")
            ->paginate(10, true);
        ajaxmsg('ok', 1, $list);
    }

    //商品详情
    public function goods_info()
    {
        $info_id = input("request.info_id", 0);
        $standard_list = Db::name("standard")->where("info_id={$info_id}")->select();
        foreach ($standard_list as $k => $v) {
            $standard_list[$k]['value_list'] = Db::name("standard_value")->where("standard_id={$v['id']}")->select();
        }
        $gallery = Db::name("goods_gallery")->alias("a")
            ->join("admin_upload b", "a.cover=b.id")
            ->where("a.info_id={$info_id}")
            ->field("a.info_id,b.url")
            ->select();
        $goods_info = Db::name("goods_info")->where("id={$info_id}")->find();
        $map['info_id'] = $info_id;
        if (input("request.standard_value1")) {
            $map['standard_value1'] = trim(input("request.standard_value1"));
        }
        if (input("request.standard_value2")) {
            $map['standard_value2'] = trim(input("request.standard_value2"));
        }
        if (input("request.standard_value3")) {
            $map['standard_value3'] = trim(input("request.standard_value3"));
        }

        $goods = Db::name("goods")->where($map)->find();
        if (!$goods) {
            ajaxmsg('false', 0);
        }
        $goods['standard'][0] = $goods['standard_value1'] ? $goods['standard_value1'] : 0;
        $goods['standard'][1] = $goods['standard_value2'] ? $goods['standard_value2'] : 0;
        $goods['standard'][2] = $goods['standard_value3'] ? $goods['standard_value3'] : 0;
        $data['goods_info'] = $goods_info;
        $data['goods'] = $goods;
        $data['goods_list'] = Db::name('goods')->where("info_id={$info_id}")->select();
        $data['gallery'] = $gallery;
        $data['standard_list'] = $standard_list;
        ajaxmsg('ok', 1, $data);
    }

    //商品相册
    public function goods_gallery()
    {
        $info_id = input("request.info_id");
        $list = Db::name("goods_info")->alias("a")
            ->join("goods_gallery b", "a.id=b.info_id")
            ->join("admin_upload c", "b.cover=c.id")
            ->where("a.id={$info_id}")
            ->field("c.url")
            ->select();
        ajaxmsg('true', 1, $list);
    }

    //添加收藏
    public function add_goods_collect()
    {
        $mid = $this->is_login();
        $goods_id = input("request.goods_id", 0);
        $info_id = input("request.info_id", 0);
        $count = Db::name("goods_collect")->where("mid={$mid} and goods_id={$goods_id}")->count("id");
        if ($count > 0) {
            ajaxmsg('收藏成功', 1);
        } else {
            $id = Db::name("goods_collect")->insertGetId(array(
                'mid' => $mid,
                'goods_id' => $goods_id,
                'info_id' => $info_id,
                'create_time' => time()
            ));
            if ($id > 0) {
                ajaxmsg('收藏成功', 1);
            } else {
                ajaxmsg('收藏失败', 0);
            }
        }
    }

    //删除收藏
    public function delete_goods_collect()
    {
        $mid = $this->is_login();
        $goods_id = input("request.goods_id", 0);
        $count = Db::name("goods_collect")->where("mid={$mid} and goods_id={$goods_id}")->count("id");
        if ($count > 0) {
            Db::name("goods_collect")->where("mid={$mid} and goods_id={$goods_id} ")->delete("id");
            ajaxmsg('true', 1);
        } else {
            ajaxmsg('非法操作', 0);
        }
    }

    //收藏列表
    public function list_goods_collect()
    {
        $mid = $this->is_login();
        $list = Db::name("goods_collect")->alias("a")
            ->join("goods_info b", "a.info_id=b.id", "LEFT")
            ->join("goods_gallery c", "b.id=c.info_id", "LEFT")
            ->join("admin_upload d", "c.cover=d.id", "LEFT")
            ->join("goods e", "a.goods_id=e.id", "LEFT")
            ->where("a.mid={$mid} and e.putway=1")
            ->group("a.id")
            ->field("a.*,b.goods_name,d.url,e.price")
            ->paginate(10, true);
        ajaxmsg('ok', 1, $list);
    }

    public function usercenter_help()
    {
        return view();
    }

    public function about_us()
    {
        return view();
    }

    public function agreement_content()
    {
        return view();
    }

    public function explain_content()
    {
        return view();
    }

    public function goods_share()
    {
        $info_id = input("request.info_id", 0);
        $list = Db::name("goods_info")->alias("a")
            ->join("goods_gallery b", "a.id=b.info_id")
            ->join("admin_upload c", "b.cover=c.id")
            ->where("a.id={$info_id}")
            ->field("c.url")
            ->select();

        $info = Db::name("goods_info")->where("id={$info_id}")->find();
        //print_r($list);
        $this->assign('list', $list);
        $this->assign('info', $info);
        return view();
    }

    public function article_list()
    {
        $token = trim(input("request.token"));
        $mid = Db::name("tokens")->where("token='{$token}'")->value('mid');
        $map = array();
        $cate_id = input("request.cate_id");
        if ($cate_id > 0) {
            $map['cate_id'] = array('eq', $cate_id);
        }
        $list = Db::name("cms_article")->where($map)->order("id desc")->paginate(10, true);
        ajaxmsg('ok', 1, $list);
    }

    //推广二维码
    public function erweima_qrcode()
    {
        //$pid = $this->is_login();
        $pid = 12;

        $save_path = isset($_GET['save_path'])?$_GET['save_path']:ROOT_PATH.'public/qrcode/';  //图片存储的绝对路径
        $web_path = isset($_GET['save_path'])?$_GET['web_path']:'/qrcode/';        //图片在网页上显示的路径

        $qr_data = 'http://'.$_SERVER['HTTP_HOST'].'/app/index/erweima_reg/pid/'.$pid;

        $qr_level = isset($_GET['qr_level'])?$_GET['qr_level']:'H';
        $qr_size = isset($_GET['qr_size'])?$_GET['qr_size']:'10';
        $save_prefix = isset($_GET['save_prefix'])?$_GET['save_prefix']:'ZETA';
        if($filename = $this->createQRcode($save_path,$qr_data,$qr_level,$qr_size,$save_prefix)){
            $pic = $web_path.$filename;
        }
        $host = $_SERVER['HTTP_HOST'];
        $data['url'] = 'http://'.$host.$pic;


        ajaxmsg('true',1,$data);


    }

    public function erweima_reg()
    {
        //$pid = input("request.pid",0);
        $pid = 12;
        $this->assign('pid', $pid);
        $host = $_SERVER['HTTP_HOST'];
        $this->assign('host', $host);
        return view();
    }

    /**
      功能：生成二维码
      @param string $qr_data 手机扫描后要跳转的网址
      @param string $qr_level 默认纠错比例 分为L、M、Q、H四个等级，H代表最高纠错能力
      @param string $qr_size 二维码图大小，1－10可选，数字越大图片尺寸越大
      @param string $save_path 图片存储路径
      @param string $save_prefix 图片名称前缀
     */
    public function createQRcode($save_path, $qr_data = 'PHP QR Code :)', $qr_level = 'L', $qr_size = 4, $save_prefix = 'qrcode')
    {
        if (!isset($save_path)) return '';
        //设置生成png图片的路径
        $PNG_TEMP_DIR = &$save_path;
        //导入二维码核心程序
        //vendor('PHPQRcode.class#phpqrcode');  //注意这里的大小写哦，不然会出现找不到类，PHPQRcode是文件夹名字，class#phpqrcode就代表class.phpqrcode.php文件名
        require_once EXTEND_PATH . 'Erweima/phpqrcode.php';
        $obj = new \QRcode();
        //检测并创建生成文件夹
        if (!file_exists($PNG_TEMP_DIR)) {
            mkdir($PNG_TEMP_DIR);
        }
        $filename = $PNG_TEMP_DIR . 'test.png';
        $errorCorrectionLevel = 'L';
        if (isset($qr_level) && in_array($qr_level, array('L', 'M', 'Q', 'H'))) {
            $errorCorrectionLevel = &$qr_level;
        }
        $matrixPointSize = 4;
        if (isset($qr_size)) {
            $matrixPointSize = min(max((int)$qr_size, 1), 10);
        }
        if (isset($qr_data)) {
            if (trim($qr_data) == '') {
                die('data cannot be empty!');
            }
            //生成文件名 文件路径+图片名字前缀+md5(名称)+.png
            $filename = $PNG_TEMP_DIR . $save_prefix . md5($qr_data . '|' . $errorCorrectionLevel . '|' . $matrixPointSize) . '.png';
            //开始生成
            $obj::png($qr_data, $filename, $errorCorrectionLevel, $matrixPointSize, 2);
        } else {
            //默认生成
            $obj::png('PHP QR Code :)', $filename, $errorCorrectionLevel, $matrixPointSize, 2);
        }
        if (file_exists($PNG_TEMP_DIR . basename($filename)))
            return basename($filename);
        else
            return FALSE;
    }

    public function jingdongp(){
        return view();
    }
    public function jingdongs(){
        return view();
    }

}
