<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\Irem_model;
use App\Models\Item_model;
use App\Models\Order_model;
use App\Models\Order_modell;
use App\Models\Product;
use Illuminate\Http\Request;

class order_controller extends Controller
{
    public function index(){
        $orders = Order_model::with('item.product.image')->get();
        return response()->json([
            'status' => true,
            'orders' => $orders,
        ]);
    }
    public function status($status)
    {
        $orders = Order_model::with('item.product.image')->with('user')->where('status',$status)->get();
        return response()->json([
            'status' => true,
            'orders' => $orders,
        ]);
    }
    public function store_single($product_id, $qty)
    {
        $orderid = date('YmdHis');
        $product = Product::find($product_id);
        $stoke = $product->qty - $qty;
        if ($product) {
            if ($stoke < 0) {
                return response()->json([
                    'status' => true,
                    'message' => 'product all of stck......?'
                ]);
            } else {
                $order=Order_model::create([
                    'user_id' => auth()->user()->id,
                    'orderid'=>$orderid,
                    'totalprice' => $product->price * $qty,
                ]);
                if($order){
                    Item_model::create([
                        'order_id'=>$order->id,
                        'product_id'=> $product->id,
                        'price'=>$product->price,
                        'qty' => $qty,
                        'totalprice'=>$qty*$product->price,
                    ]);
                }
                return response()->json([
                    'status' => true,
                    'message' => "Create Order Sucessfull...",
                ]);
            }
        } else {
            return response()->json([
                'status' => false,
                'message' => 'products not found...?'
            ]);
        }
    }
    public function store_more( $totalPrice) {
        $cart=Cart::all();
        $orderid = date('YmdHis');
        $order=Order_model::create([
            'user_id' => auth()->user()->id,
            'totalprice' => $totalPrice,
            'orderid'=>$orderid,
        ]);
        foreach ($cart as $item) {
            $item=Item_model::create([
                'order_id' => $order->id,
                'product_id'=> $item->product_id,
                'price'=>$item->product->price,
                'qty'=> $item->qty,
                'totalprice'=>$item->qty*$item->product->price,
            ]);
        }
        return response()->json([
            'status' => true,
            'message' => "Create Order Sucessfull...",
        ]);
    }
    public function cancel($id) {
        Order_model::where("id", $id)->update([
            "status"=> '0',
        ]);
        return response()->json([
            'status' => true,
            'message' => "Cancel Order Sucessfull...",
        ]);
    }
}
