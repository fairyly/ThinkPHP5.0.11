<?php

namespace app\index\controller;

use think\Controller;
use think\Db;
use think\Cache;
use think\Url;
use think\Session;


url::root('/index.php'); //使模板中生成的地址含有/index.php
class Index extends Controller
{
    // 首页
    public function index()
    {
    	
    	header("Content-type:text/html;charset=utf-8");
    	
        $type = 'index';
        $users = Db::table('web_users')->where('valide_type',0)->select();
        $this->assign('users',$users);
        $this->assign('type',$type);

        return $this->fetch('index');
    }

    public function types(){
        $options = [
            'type'  =>  'Redis', // 缓存类型为File
            'expire'=>  7200, // 缓存有效期为永久有效
            'prefix'=>  '',//缓存的前缀
          
        ];
        $redis=Cache::connect($options);
      
        if(!$redis->get('types')){
        	
            // $m = Db::table('goods_type');
            $type =  Db::table('goods_type')->where('pid',0)->select();//
            $redis->set('types',$type);
            return $type;
        }else{
            return $redis->get('types');
        }   
    }

    public function detail($id)
    {
        $type = 'index';
        $this->assign('type',$type);
        $userinfo = Db::table('web_users')->where("userid = '".$id."'")->select();
            // var_dump($userinfo[0]);exit;
        $this->assign('userinfo',$userinfo);
    	return $this->fetch('detail');
    }

    public function userdetail($id)
    {
        $type = 'usercenter';
        $this->assign('type',$type);
        $userinfo = Db::table('web_users')->where("userid = '".$id."'")->select();
            // var_dump($userinfo[0]);exit;
        $this->assign('userinfo',$userinfo);
        return $this->fetch('userdetail');
    }



    public function lists()
    {
    	header("Content-type:text/html;charset=utf-8");
        
        $data=Db::table('goods')->where("tid=".$_GET['id'].' or tpid='.$_GET['id'])->select();
        $array=array();

        foreach($data as $k=>$v){
            $v['image']=array();//图片的名字
            $imageId=explode(',',$v['imagepath']);
           
            foreach($imageId as $vid){
                $img=Db::table('goods_files')->field('filepath')->where('id='.$vid)->find();
                 array_push($v['image'],$img);
            }
            array_push($array,$v);
        }
        
   
        $this->assign('data',$array);
        return $this->fetch();
    }

    // 关于页
    public function about()
    {
    	header("Content-type:text/html;charset=utf-8");
        $type = 'about';

        $this->assign('type',$type);
    	return $this->fetch('about');
    }
    // 简介
    public function ourinfo()
    {
    	header("Content-type:text/html;charset=utf-8");
        $type = 'ourinfo';

        $this->assign('type',$type);
    	return $this->fetch('ourinfo');
    }

    // 用户中心
    public function usercenter()
    {
    	header("Content-type:text/html;charset=utf-8");
        $type = 'usercenter';

        $this->assign('type',$type);

        if (Session::has('username')) {
            # code...
            $userinfo = Db::table('web_users')->where("username = '".Session::get('username')."'")->select();
            // var_dump($userinfo[0]);exit;
            $this->assign('userinfo',$userinfo);
            return $this->fetch('usercenter');
        } else {
            return $this->fetch('login');
        }
    	
    }

    // 登录
    public function login()
    {
        header("Content-type:text/html;charset=utf-8");
        $type = 'login';

        $this->assign('type',$type);
        return $this->fetch('login');
    }

    // 提交登录表单
    public function loginForm()
    {
        header("Content-type:text/html;charset=utf-8");
        $type = 'login';

        $this->assign('type',$type);
        // var_dump($_POST['uname'].md5($_POST['upass']));exit;
        $data = Db::table('web_users')->where("username = '".$_POST['uname']."' and userpass = '".md5($_POST['upass'])."'")->find();

        if($data){
            Session::set('username',$_POST['uname']);
            return $this->success("登陆成功",Url('index/index/usercenter'));
        }else{
            return $this->error("登陆失败");
        }
        // return $this->fetch('login');
    }

    // 更新资料
    public function userupdate($id)
    {
        $type = 'usercenter';
        $this->assign('type',$type);
        // var_dump($_POST);
        /*foreach($_POST as $key => $value){ 
            echo $value; 
            // if (!$value) {

            //     return;
            // }
        }*/
        
        $useremail = $_POST['useremail'];
        $telephone = $_POST['telephone'];
        $age = $_POST['age'];
        $sex = $_POST['sex'];
        $graduate = $_POST['graduate'];
        $birthday = $_POST['birthday'];
        $tall = $_POST['tall'];
        $weight = $_POST['weight'];
        $city = $_POST['city'];
        $QQ = $_POST['QQ'];
        $weixin = $_POST['weixin'];
        $weibo = $_POST['weibo'];
        $baseinfo = $_POST['baseinfo'];

        Db::table('web_users')->where("userid = '".$id."'")->update([
            'useremail'  => $useremail,
            'telephone' => $telephone,
            'age' => $age,
            'sex' => $sex,
            'graduate' => $graduate,
            'birthday' => $birthday,
            'tall' => $tall,
            'weight' => $weight,
            'city' => $city,
            'QQ' => $QQ,
            'weixin' => $weixin,
            'weibo' => $weibo,
            'baseinfo' => $baseinfo,

        ]);
        // var_dump($_POST);
        // exit;
        $userinfo = Db::table('web_users')->where("userid = '".$id."'")->select();
            // var_dump($userinfo[0]);exit;
        $this->assign('userinfo',$userinfo);
        return $this->fetch('usercenter');
    }

    // 注册
    public function register()
    {
        header("Content-type:text/html;charset=utf-8");
        $type = 'register';

        $this->assign('type',$type);
        return $this->fetch('register');
    }

    // 提交注册表单
    public function registerForm()
    {
        header("Content-type:text/html;charset=utf-8");
        $type = 'register';

        $this->assign('type',$type);

        $date = date('Y-m-d H:i:s');

        $data = Db::table('web_users')->where("username = '".$_POST['uname']."'")->find();
        if(!$data){
            $datas = ['username' => $_POST['uname'], 'userpass' => md5($_POST['upass']),'useremail' => $_POST['uemail'],'telephone' => $_POST['uphone'],'create_date' => $date];
            Db::table('web_users')->insert($datas);
            return $this->success("注册成功",Url('index/index/login'));
        }else{
            return $this->error("注册失败");
        }
        // return $this->fetch('register');
    }

    // 上传照片
    public function uploadphote($id)
    {
        $type = 'usercenter';
        $this->assign('type',$type);
        $userinfo = Db::table('web_users')->where("userid = '".$id."'")->select();
            // var_dump($userinfo[0]);exit;
        $this->assign('userinfo',$userinfo);
        return $this->fetch('uploadphote');
    }

    public function updatephote($id)
    {

        // $photo = $_POST;
        // Db::table('web_users')->where("userid = '".$id."'")->update([
        //     'photo' => $photo])
        $file = request()->file('file');
        $src = '';
        // 移动到框架应用根目录/public/uploads/ 目录下
        if($file){
            $info = $file->move(ROOT_PATH . 'public' . DS . 'static/uploads');
            if($info){
                // 成功上传后 获取上传信息
                // 输出 jpg
                // echo $info->getExtension();
                // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
                // echo $info->getSaveName();
                // 输出 42a79759f284b767dfcb2a0197904287.jpg
                // echo $info->getFilename(); 
                $src = '/static/uploads/' . str_replace('\\', '/', $info->getSaveName());
                // $thumb_path = '/static/index/images/11.png';
                // var_dump('$thumb_path:'.$thumb_path);

                // $image = \think\Image::open($thumb_path);
                // $image->thumb(300, 300)->save($thumb_path); 
                // var_dump($src);
            }else{
                // 上传失败获取错误信息
                echo $file->getError();
            }
        }

        // var_dump($src);
        Db::table('web_users')->where("userid = '".$id."'")->update([
            'photo'  => $src]);

        $type = 'usercenter';
        $this->assign('type',$type);

        $userinfo = Db::table('web_users')->where("userid = '".$id."'")->select();
            // var_dump($userinfo[0]);exit;
        $this->assign('userinfo',$userinfo);
        return $this->fetch('usercenter');
    }
}
