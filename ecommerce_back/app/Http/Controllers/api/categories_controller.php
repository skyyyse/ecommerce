<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Categories;
use Illuminate\Http\Request;

class categories_controller extends Controller
{
    public function index(){
        $categories = Categories::where('status',1)->get();
        return response()->json([
            "status"=> true,
            "categories"=> $categories,
        ]);
    }
}
