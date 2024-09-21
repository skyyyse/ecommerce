<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\favorite;
use App\Models\Product;
use Illuminate\Http\Request;

class favorite_controler extends Controller
{
    public function index(){
        $favorite=favorite::with('product.image')->with('product.favorite',function ($favorite) {
            return $favorite->where('user_id',Auth()->user()->id)->get();
        })->where('user_id',auth()->user()->id)->get();
        return response()->json(
            [
                "status"=>true,
                "favorite"=> $favorite,
            ]
        );
    }
    public function store($id){
        $product=Product::find($id);
        if($product){
            $favorite=$product->favorite()->where('user_id',Auth()->user()->id)->first();
            if(!$favorite){
                favorite::create([
                    'product_id'=>$id,
                    'user_id'=>Auth()->user()->id,
                ]);
                return response()->json([
                    'message'=>'favorite sucessfull',
                    'status'=>true,
                ]);
            }else{
                $favorite->delete();
                return response()->json([
                    'message'=>'unfavorite sucessfull',
                    'status'=>true,
                ]);
            }
        }else{
            return response()->json([
                'message'=>'not fount',
                'status'=>true,
            ]);
        }
    }
}
