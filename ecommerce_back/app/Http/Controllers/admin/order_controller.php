<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Item_model;
use App\Models\Order_mode;
use App\Models\Order_model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class order_controller extends Controller
{
    public function index(){
        $orders = Order_model::all();
        $user=Auth::user();
        return view("admin.view.orders.index",compact("orders",'user'));
    }
    public function item(Request $request){
        $user=Auth::user();
        $orders = Order_model::where('id', $request->order_id)->get();
        $totalPrice = Item_model::where('order_id', $request->order_id)->sum('totalprice');
        return view("admin.view.orders.item",compact("orders","totalPrice","user"));
    }
}
