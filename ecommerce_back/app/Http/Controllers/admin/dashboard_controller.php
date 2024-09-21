<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Order_model;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class dashboard_controller extends Controller
{
    public function index(){
        $user=Auth::user();
        $customer=User::where('role',0)->count('id');
        $order=Order_model::where('status',1)->count('id');
        $data=[
            'customer'=>$customer,
            'user'=>$user,
            'order'=>$order
        ];
        return view("admin.view.index",$data);
    }
}
