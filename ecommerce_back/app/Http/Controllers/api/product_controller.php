<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;

class product_controller extends Controller
{
    public function index(Request $request){
        $product=Product::with('image')->where('status',1)->get();
        return response()->json([
            'status'=>true,
            'products'=> $product
        ]);
    }
    public function getproduct($id){
        $product = Product::with('image')->where('subcategories_id',$id)->get();
        return response()->json([
            'status'=>true,
            'products'=> $product
        ]);
    }
    public function detail($id){
        $product=Product::with('image')->where("id",$id)->with('favorite', function ($favorite) {
            return $favorite->where('user_id',Auth()->user()->id)->get();
        })->get();
        return response()->json([
            'status'=>true,
            'products'=>$product
        ]);
    }
}
