<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Subcategories;
use Illuminate\Http\Request;

class subcategory_controller extends Controller
{
    public function index($id){
        $Subcategories = Subcategories::where('categories_id',$id)->where('status',1)->get();
        return response()->json([
            "status"=> true,
            "Subcategories"=> $Subcategories,
        ]);
    }
}
