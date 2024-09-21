<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Slider;
use Illuminate\Http\Request;

class slider_controller extends Controller
{
    public function index(){
        $slider=Slider::where('status',1)->get();
        return response()->json([
            'status'=>true,
            'slider'=>$slider
        ]);
    }
}
