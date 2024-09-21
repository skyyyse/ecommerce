<?php

namespace App\Http\Controllers\admin;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\Categories;
use App\Models\Subcategories;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class subcategories_controller extends Controller
{
    public function index(){
        $categories=Categories::all();
        $user=Auth::user();
        $subcategories = Subcategories::with('categories')->get();
        return view("admin.view.subcategories.index",compact("subcategories","categories",'user'));
    }
    public function create(){
        $categories=Categories::all();
        $user=Auth::user();
        return view("admin.view.subcategories.create",compact("categories","user"));
    }
    public function store(Request $request){
        $request->validate([
            "categories"=>"required",
            "title" => "required",
            "status" => "required",
            "file_image" => "required",
        ]);
        $imageName = Str::random(40) . '.' . $request->file_image->getClientOriginalExtension();
        $request->file_image->move(public_path('Image/Subcategories/Image'), $imageName);
        $Slider = Subcategories::create([
            'title' => $request->title,
            'categories_id'=>$request->categories,
            'status' => $request->status,
            'image' => $imageName
        ]);
        if ($Slider->save()) {
            return redirect()->route('subcategories.index')->with('sucess', 'Create slider sucessfully');
        }
    }
    public function destroy(Request $request){
        $subcategories = Subcategories::find($request->subcategories_id);
        $imagePath = public_path('Image/Subcategories/Image') . '/' . $subcategories->image;
        if (file_exists($imagePath)) {
            unlink($imagePath);
            if ($subcategories->delete()) {
                return redirect()->route('subcategories.index');
            }
        }
    }
    public function update(Request $request){
        $subcategories = Subcategories::find($request->id);
        $imagePath = public_path('Image/Subcategories/Image') . '/' . $subcategories->image;
        if ($request->hasFile('fileInput')) {
            $file = $request->file('fileInput');
            if ($file->isValid()) {
                if (file_exists($imagePath)) {
                    unlink($imagePath);
                    $imageName = Str::random(40) . '.' . $request->fileInput->getClientOriginalExtension();
                    $request->fileInput->move(public_path('Image/Subcategories/Image'), $imageName);
                    Subcategories::where('id', $request->id)->update([
                        'title' => $request->title,
                        'status' => $request->status,
                        'categories_id'=>$request->categories,
                        'image' => $imageName
                    ]);
                    return redirect()->route('subcategories.index');
                }
            }
        } else {
            Subcategories::where('id', $request->id)->update([
                'title'=> $request->title,
                'categories_id'=>$request->categories,
                'status'=> $request->status
            ]);
            if ($subcategories->save()) {
                return redirect()->route('subcategories.index');
            }
        }
    }
}
