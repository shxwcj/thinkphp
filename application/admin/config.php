<?php
//配置文件
return [
    // 文件上传默认驱动
    'UPLOAD_DRIVER' => 'Qiniu', //设置七牛上传驱动
    //'UPLOAD_DRIVER' => 'Local',
    // 七牛上传驱动配置说明
    'UPLOAD_Qiniu_CONFIG' => array(
        'secretKey' => 'LnEXgP-8F4nKn8HWzNWOF7kYtX0NqmlXXCyyYmIu', //七牛服务器
        'accessKey' => 'u1mpysU6FBNULGuJcVzGgQLJJ1zqBc3uhINvpazi', //七牛用户
        'domain'    => 'http://oetqv9f47.bkt.clouddn.com/', //七牛域名
        'bucket'    => 'test2', //空间名称
        'timeout'   => 300, //超时时间
    ),

    //权限节点
    'admin_menu'=>array(
        '0'=>array(
            'name'=>'系统设置',
            'act'=>'system',
            'list'=>array(
                '0'=>array('name'=>'管理员列表','url'=>'admin/system/admin_user','status'=>0),
                '1'=>array('name'=>'管理员添加','url'=>'admin/system/admin_user_add','status'=>0),
                '2'=>array('name'=>'管理员编辑','url'=>'admin/system/admin_user_edit','status'=>0),
                '3'=>array('name'=>'管理员删除','url'=>'admin/system/admin_user_delete','status'=>0),
                '4'=>array('name'=>'管理员设置','url'=>'admin/system/admin_user_setstatus','status'=>0),


                '5'=>array('name'=>'用户组列表','url'=>'admin/system/admin_group','status'=>0),
                '6'=>array('name'=>'用户组添加','url'=>'admin/system/admin_group_add','status'=>0),
                '7'=>array('name'=>'用户组编辑','url'=>'admin/system/admin_group_edit','status'=>0),
                '8'=>array('name'=>'用户组删除','url'=>'admin/system/admin_group_delete','status'=>0),
                '9'=>array('name'=>'用户组设置','url'=>'admin/system/admin_group_setstatus','status'=>0),

                '20'=>array('name'=>'佣金提现设置','url'=>'admin/system/sharefee','status'=>0),


            )
        ),


        '1'=>array(
            'name'=>'商品管理',
            'act'=>'goods',
            'list'=>array(
                '0'=>array('name'=>'商品列表','url'=>'admin/goods/index','status'=>0),
                '1'=>array('name'=>'商品添加','url'=>'admin/goods/goods_add','status'=>0),
                '2'=>array('name'=>'商品编辑','url'=>'admin/goods/goods_edit','status'=>0),

                '3'=>array('name'=>'商品分类','url'=>'admin/goods/cate_list','status'=>0),
                '4'=>array('name'=>'分类添加','url'=>'admin/goods/cate_add','status'=>0),
                '5'=>array('name'=>'分类编辑','url'=>'admin/goods/cate_edit','status'=>0),
                '6'=>array('name'=>'分类删除','url'=>'admin/goods/cate_delete','status'=>0),
                '7'=>array('name'=>'状态设置','url'=>'admin/goods/cate_setstatus','status'=>0),

                '8'=>array('name'=>'商品推介','url'=>'admin/goods/recommend_list','status'=>0),
                '9'=>array('name'=>'推介添加','url'=>'admin/goods/recommend_add','status'=>0),
                '10'=>array('name'=>'推介编辑','url'=>'admin/goods/recommend_edit','status'=>0),
                '11'=>array('name'=>'推介删除','url'=>'admin/goods/recommend_delete','status'=>0),

                '12'=>array('name'=>'单位列表','url'=>'admin/goods/unit_list','status'=>0),
                '13'=>array('name'=>'单位添加','url'=>'admin/goods/unit_add','status'=>0),
                '14'=>array('name'=>'单位编辑','url'=>'admin/goods/unit_edit','status'=>0),
                '15'=>array('name'=>'单位删除','url'=>'admin/goods/unit_delete','status'=>0),
                '16'=>array('name'=>'设置状态','url'=>'admin/goods/unit_setstatus','status'=>0),
            )
        ),



        '2'=>array(
            'name'=>'分销商',
            'act'=>'drp',
            'list'=>array(
                '0'=>array('name'=>'分销商列表','url'=>'admin/drp/index','status'=>0),
                '1'=>array('name'=>'提现申请','url'=>'admin/drp/withdrawapply','status'=>0),
                '2'=>array('name'=>'提现处理','url'=>'admin/drp/withdrawdo','status'=>0),
                '3'=>array('name'=>'提现记录','url'=>'admin/drp/withdrawrecord','status'=>0),
                '4'=>array('name'=>'订单列表','url'=>'admin/drp/withdraw_order_list','status'=>0),
                '5'=>array('name'=>'分销列表','url'=>'admin/drp/withdraw_fenxiao_list','status'=>0),
            )
        ),


        '3'=>array(
            'name'=>'CMS管理',
            'act'=>'cms',
            'list'=>array(
                '0'=>array('name'=>'文章列表','url'=>'admin/cms/index','status'=>0),
                '1'=>array('name'=>'文章添加','url'=>'admin/cms/article_add','status'=>0),
                '2'=>array('name'=>'文章编辑','url'=>'admin/cms/article_edit','status'=>0),
                '3'=>array('name'=>'批量删除','url'=>'admin/cms/article_delete','status'=>0),
                '4'=>array('name'=>'单个删除','url'=>'admin/cms/article_delete_one','status'=>0),
                '5'=>array('name'=>'分类列表','url'=>'admin/cms/cate_list','status'=>0),
                '6'=>array('name'=>'分类添加','url'=>'admin/cms/cate_add','status'=>0),
                '7'=>array('name'=>'分类编辑','url'=>'admin/cms/cate_edit','status'=>0),
                '8'=>array('name'=>'分类删除','url'=>'admin/cms/cate_delete','status'=>0),
                '9'=>array('name'=>'分类设置','url'=>'admin/cms/cate_setstatus','status'=>0),
            )
        ),

        '4'=>array(
            'name'=>'订单管理',
            'act'=>'order',
            'list'=>array(
                '0'=>array('name'=>'订单列表','url'=>'admin/order/index','status'=>0),
            )
        ),

    ),
];