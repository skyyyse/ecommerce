<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Categories;
use App\Models\Product;
use App\Models\Slider;
use App\Models\Subcategories;
use App\Models\User;
use Illuminate\Http\Request;

class script_controller extends Controller
{
    public function slider($id){
        $Slider=Slider::where("id",$id)->get();
        return response()->json([
            'status' => 200,
            'slider' => $Slider,
        ]);
    }
    public function categories($id){
        $Category=Categories::where('id',$id)->get();
        return response()->json([
            'status' => 200,
            'Category' => $Category,
        ]);
    }
    public function subcategories($id){
        $subcategories=Subcategories::where('id',$id)->get();
        return response()->json([
            'status'=> 200,
            'subcategories'=> $subcategories,
        ]);
    }
    public function product($id){
        $product=Product::with('image')->where('id',$id)->get();
        return response()->json([
            'status'=> 200,
            'product'=> $product,
        ]);
    }
    public function user($id){
        $user=User::where('id',$id)->get();
        return response()->json([
            'status'=> 200,
            'user'=> $user,
        ]);
    }
}
