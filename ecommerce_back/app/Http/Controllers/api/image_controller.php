<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Image;
use Illuminate\Http\Request;

class image_controller extends Controller
{
    public function index($id){
        $image=Image::with('product')->where("product_id",$id)->get();
        return response()->json([
            'status'=>true,
            'image'=>$image
        ]);
    }
}
