<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/24
 * Time: 15:56
 */

namespace app\app\controller;

use think\Db;

class Index extends Base
{
    /**
     *首页数据列表
     * @author wangchunjing
     * return array|false|string
     */
    public function index()
    {
        /*首页列表*/
        $ads1_list = Db::name('app_ads a')
            ->join('admin_upload b', 'a.cover = b.id')
            ->field('a.*,b.url')
            ->where('a.group_id', 1)
            ->select();

        $ads2_list = Db::name('app_ads a')
            ->join('admin_upload b', 'a.cover = b.id')
            ->field('a.*,b.url')
            ->where('a.group_id', 2)
            ->select();

        /*商品列表*/

        $goods_list = Db::name('goods_info a')
            ->join('goods_gallery b', 'a.id = b.info_id', 'LEFT')
            ->join('admin_upload c', 'b.cover = c.id', 'LEFT')
            ->where('a.putway', 1)//上架状态
            ->field('a.id,a.goods_name,a.cate_id,a.price,a.costprice,b.cover,c.url')
            ->group('a.id')
            ->order('a.id', 'desc')
            ->select();

        $data['ads1_list'] = $ads1_list;
        $data['ads2_list'] = $ads2_list;
        $data['goods'] = $goods_list;

        return ajaxmsg('ok', 1, $data);

    }

    /**
     *商品顶级分类列表
     * @author wangchunjing
     * return array|false|string
     */

    public function cate_list()
    {
        $cate_list = Db::name('goods_category')
            ->where('pid',0)
            ->order('sort')
            ->select();
        foreach ($cate_list as $key=>$value)
        {
           if(! Db::name('goods_category')->where('pid',$value['id'])->find()){
               unset($cate_list[$key]);
           }
        }

        sort($cate_list);   //重新排序
        return ajaxmsg('ok',1,$cate_list);
    }

    /**
     *商品二级分类列表
     * @author wangchunjing
     * return array|false|string
     */

    public function children_cate_list()
    {
        $cate_id = input("request.cate_id");
        if(! $cate_id || ! Db::name('goods_category')->where('pid',$cate_id)->find()){
            return ajaxmsg('非法操作',0);
        }
        $cate_id = Db::name('goods_category a')
            ->join('admin_upload b','a.cover = b.id')
            ->field('a.*,b.url')
            ->where('a.pid',$cate_id)
            ->select();

        return ajaxmsg('ok',1,$cate_id);
    }

    /**
     *商品分类下的商品列表
     * @author wangchunjing
     * return array|false|string
     */

    public function cate_goodlist()
    {
        $map = array();
        $keywords = trim(input("request.keywords", '')); //关键词
        $cate_id = input("request.cate_id");        //商品id
        $is_new = input("request.is_new");          //新品 默认1
        $is_rec = input("request.is_rec");          //推荐 默认1
        $is_hot = input("request.is_hot");          //热销 默认1
        $map['a.putway'] = 1;  //上架状态

        if($keywords)  $map['a.goods_name|a.keyword|a.content'] = ['like', "%$keywords%"];

        if($cate_id > 0) $map['a.cate_id'] = $cate_id;

        if($is_new > 0) $map['a.is_new'] = $is_new;

        if($is_hot > 0) $map['a.is_hot'] = $is_hot;

        $list = Db::name('goods_info a')
            ->join('goods_gallery b','a.id = b.info_id','LEFT')
            ->join('admin_upload c','b.cover = c.id','LEFT')
            ->where($map)
            ->group('a.id')
            ->order('a.is_hot','asc')
            ->field('a.id,a.goods_name,a.sku,a.cate_id,a.unit_id,a.keyword,a.is_new,a.is_hot,a.is_rec,a.price,a.costprice,a.fenxiao_rate,a.daili_rate,c.url')
            ->paginate(10,true);

        return ajaxmsg('ok',1,$list);

    }

    /**
     *商品详情
     * @author wangchunjing
     * return array|false|string
     */

    public function goods_info()
    {
        $info_id = input("request.info_id");
        if(! $info_id){
            return ajaxmsg('非法操作',0);
        }
        $standard_list = Db::name("standard")->where('info_id',$info_id)->select();
        foreach ($standard_list as $key => $value)
        {
            $standard_list[$key]['value_list'] = Db::name('standard_value')->where('standard_id',$value['id'])->select();

        }

        /*商品相册*/
        $gallery = Db::name('goods_gallery a')
            ->join('admin_upload b','a.cover = b.id')
            ->where('a.info_id',$info_id)
            ->field('a.info_id,b.url')
            ->select();

        /*商品详情*/
        $goods_info = Db::name('goods_info')->where('id',$info_id)->find();

        $map['info_id'] = $info_id;

        /*添加规格*/
        if(input("request.standard_value1")) $map['standard_value1'] = trim(input("request.standard_value1"));

        if(input("request.standard_value2")) $map['standard_value2'] = trim(input("request.standard_value2"));

        if(input("request.standard_value3")) $map['standard_value3'] = trim(input("request.standard_value3"));

        $goods = Db::name('goods')->where($map)->find();

        if(! $goods){
            return ajaxmsg('false',0);
        }

        /*数组形式返回数据*/
        $goods['standard'][0] = $goods['standard_value1'] ? $goods['standard_value1']:0;
        $goods['standard'][1] = $goods['standard_value2'] ? $goods['standard_value2']:0;
        $goods['standard'][2] = $goods['standard_value3'] ? $goods['standard_value3']:0;
        $data['goods_info'] = $goods_info;
        $data['goods'] = $goods;
        $data['goods_list'] = Db::name('goods')->where('info_id',$info_id)->select();
        $data['gallery'] = $gallery;
        $data['standard_list'] = $standard_list;

        return ajaxmsg('ok',1,$data);
    }










}