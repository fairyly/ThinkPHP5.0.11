<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

return [
    '__pattern__' => [
        'name' => '\w+',
    ],
    '[hello]'     => [
        ':id'   => ['index/hello', ['method' => 'get'], ['id' => '\d+']],
        ':name' => ['index/hello', ['method' => 'post']],
    ],
    
    'about' => 'index.php/index/index/about',
    'ourinfo' => 'index.php/index/index/ourinfo',
    'usercenter' => 'index.php/index/index/usercenter',
    'userdetail' => 'index.php/index/index/userdetail',
    'userupdate' => 'index.php/index/index/userupdate',
    'uploadphote' => 'index.php/index/index/uploadphote',
    'updatephote' => 'index.php/index/index/updatephote',
    'login' => 'index.php/index/index/login',
    'register' => 'index.php/index/index/register',
    'detail' => 'index.php/index/index/detail'
];
