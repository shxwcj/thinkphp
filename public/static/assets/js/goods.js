/**
 * Created by PhpStorm.
 * User: 835173372@qq.com
 * NickName: 半城村落
 * Date: 2016/10/26 14:34
 */

var vm = new Vue({
    el: '.bs-form',
    data: {
        goods_name: '',
        sku: 'Dd-'+parseInt(Math.random()*100000000),
        cate_id: 0,
        unit_id: 0,
        is_new: 0,
        is_rec: 0,
        is_hot: 0,
        price: '0.00',
        costprice: '0.00',
        fenxiao_rate: '0.00',
        daili_rate: '0.00',
        covers:[],
        content:'',
        lists: [
            //{"name":"重量","vals":["1斤","2斤","10斤"],'temp_name':''},
            //{"name":"","vals":[],'temp_name':''},//默认空数据
        ],
        goods_lists: [
            //{'sku':'','standard_value1':'','standard_value2':'','standard_value3':'','price':'','costprice':'','fenxiao_rate':'','daili_rate':''},//默认规格商品
        ]
    },
    methods: {

        settingcate:function (id) {
            vm.cate_id = id;
        },
        settingunit:function (id) {
            vm.unit_id = id;
        },
        //添加规格
        addlist:function () {
            if(vm.lists.length == 3){
                layer.msg('最多3个规格', {icon: 2});
                return false;
            }
            vm.lists.push({"name":"","vals":[]});
        },

        //移除规格
        removelist:function (index) {
            if(vm.lists.length == 1){
                vm.goods_lists = '';
            }
            vm.lists.splice(index, 1)
        },

        //添加属性值
        addvals:function (index) {
            var temp_val = vm.lists[index].temp_name;
            if(vm.lists[index].vals.length == 20){
                layer.msg('一个规格最多20个属性值', {icon: 2});
                return false;
            }
            vm.lists[index].vals.push(temp_val);
            vm.lists[index].temp_name = '';
        },

        //移除属性值
        removevals:function (keys,index) {
            vm.lists[keys].vals.splice(index, 1);
        },

        //添加规格商品
        addgoodslists:function () {
            if(vm.lists.length < 1){
                layer.msg('最少添加一个规格', {icon: 2});
                return false;
            }
            vm.goods_lists.push({'sku':'Dd-'+parseInt(Math.random()*100000000)});
        },
        //移除规格商品
        removegoodslists:function (index) {
            vm.goods_lists.splice(index, 1)
        },
        setting_goodslists_vals:function (k1,k2,val) {
            var standard = 'standard_value'+(k2+1);
            vm.goods_lists[k1][standard] = val
        }

    }
});

//添加商品操作
function goods_add(url) {
    var coverslist = [];
    $(".info").next('input').each(function (index,el) {
        coverslist.push($(".info").next('input').eq(index).val());
    });
    if(!vm.goods_name){
        layer.msg('商品名不能为空', {icon: 2});
        return false;
    }
    if(vm.price == 0){
        layer.msg('零售价必填', {icon: 2});
        return false;
    }
    if(vm.costprice == 0){
        layer.msg('成本价必填', {icon: 2});
        return false;
    }
    if(vm.fenxiao_rate == 0){
        layer.msg('上级分佣比例必填', {icon: 2});
        return false;
    }
    if(vm.daili_rate == 0){
        layer.msg('代理分佣比例必填', {icon: 2});
        return false;
    }
    if(coverslist.length == 0){
        layer.msg('最少添加一张图片', {icon: 2});
        return false;
    }
    vm.covers = coverslist;
    if(vm.is_new){
        vm.is_new = 1;
    }else{
        vm.is_new = 0;
    }
    if(vm.is_rec){
        vm.is_rec = 1;
    }else{
        vm.is_rec = 0;
    }
    if(vm.is_hot){
        vm.is_hot = 1;
    }else{
        vm.is_hot = 0;
    }
    var slenth = vm.lists.length;
    if(slenth>0){
        if(!vm.goods_lists.length){
            layer.msg('请添加规格商品', {icon: 2});
            return false;
        }else{
            for (var i=0;i<vm.goods_lists.length;i++){
                if(!vm.goods_lists[i].price){
                    layer.msg('零售价必填', {icon: 2});
                    return false;
                }
                if(!vm.goods_lists[i].costprice){
                    layer.msg('成本价必填', {icon: 2});
                    return false;
                }
                if(!vm.goods_lists[i].fenxiao_rate){
                    layer.msg('上级分佣比例必填', {icon: 2});
                    return false;
                }
                if(!vm.goods_lists[i].daili_rate){
                    layer.msg('代理分佣比例必填', {icon: 2});
                    return false;
                }
            }
        }
    }
    switch (slenth){
        case 1:
            for (var i=0;i<vm.goods_lists.length;i++){
                if(!vm.goods_lists[i].standard_value1){
                    layer.msg('商品规格请选择', {icon: 2});
                    return false;
                }
            }
            break;
        case 2:
            for (var i=0;i<vm.goods_lists.length;i++){
                if(!vm.goods_lists[i].standard_value1 || !vm.goods_lists[i].standard_value2){
                    layer.msg('商品规格请选择', {icon: 2});
                    return false;
                }
            }
            break;
        case 3:
            for (var i=0;i<vm.goods_lists.length;i++){
                if(!vm.goods_lists[i].standard_value2 || !vm.goods_lists[i].standard_value3){
                    layer.msg('商品规格请选择', {icon: 2});
                    return false;
                }
            }
            break;
    }
    vm.content = get_editor_content();
    //提交数据参数
    var parms = {
        goods_name: vm.goods_name,
        sku: vm.sku,
        cate_id: vm.cate_id,
        unit_id: vm.unit_id,
        is_new: vm.is_new,
        is_rec: vm.is_rec,
        is_hot: vm.is_hot,
        price: vm.price,
        costprice: vm.costprice,
        fenxiao_rate: vm.fenxiao_rate,
        daili_rate: vm.daili_rate,
        covers: JSON.stringify(vm.covers),
        content: vm.content,
        lists: JSON.stringify(vm.lists),
        goods_lists: JSON.stringify(vm.goods_lists)
    };
    $.post(url, parms, function (a) {
        handleAjax(a);
    });
}


